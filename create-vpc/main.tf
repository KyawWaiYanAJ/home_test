provider "aws" {
  access_key = data.vault_aws_access_credentials.creds.access_key
  secret_key = data.vault_aws_access_credentials.creds.secret_key
}

resource "aws_vpc" "main" {
  cidr_block = "10.10.0.0/16"
}

resource "aws_subnet" "public" {
  count = length(var.public_cidr_block)
  vpc_id = aws_vpc.main.id
  cidr_block = var.public_cidr_block[count.index]
  availability_zone = data.aws_availability_zone.azs.names[count.index]
  map_public_ip_on_launch = true

  tags = {
    Name = "public subnet-${element(data.aws_availability_zones.azs.names, count.index)}" 
  }
}

resource "aws_route_table" "public_subnet_rt" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "public_subnet_rt"
  }
}

resource "aws_route_table_association" "public_subnet_rt" {
  count = length(var.public_cidr_block)
  subnet_id = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public_subnet_rt.id
} 

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "vault_vpc GW"
  }
}

resource "aws_route" "r" {
  route_table_id = aws_route_table.public_subnet_rt
  destination_cidr_block = "0.0.0.0"
  gateway_id = aws.aws_internet_gateway.gw.id
}

resource "aws_subnet" "private" {
  count = length(var.private_cidr_block)
  vpc_id = aws_vpc.main.id
  cidr_block = var.private_cidr_block[count.index]
  availability_zone = data.aws_availability_zone.azs.names[count.index]

  tags = {
    Name = "public subnet-${element(data.aws_availability_zones.azs.names, count.index)}" 
  }
}

resource "aws_route_table" "private_subnet_rt" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "public_subnet_rt"
  }
}

resource "aws_route_table_association" "private_subnet_rt" {
  count = length(var.private_cidr_block)
  subnet_id = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.private_subnet_rt.id
} 

resource "aws_eip" "nat_eip" {
  domain = "vpc"
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id = aws_subnet.public[0].id
  
  tags = {
    Name = "gw NAT"
  }

  depends_on = [aws_internet_gateway.gw]
}

resource "aws_route" "private_r" {
  route_table_id = aws_route_table.pivate_subnet_rt
  destination_cidr_block = "0.0.0.0"
  gateway_id = aws_nat_gateway.nat.id
}

