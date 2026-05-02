provider "aws" {
  region = "ap-south-1"
}

# Create a VPC
resource "aws_vpc" "myvpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "Santhosh-vpc"
  }
}

# create a Public subnet
resource "aws_subnet" "Public-subnet" {
  vpc_id     = aws_vpc.myvpc.id
  cidr_block = "10.0.1.0/24"
  tags = {
    Name = "PublicSubnet"
  }
}

# Create a Private subnet
resource "aws_subnet" "Private-subnet" {
  vpc_id     = aws_vpc.myvpc.id
  cidr_block = "10.0.2.0/24"
  tags = {
    Name = "PrivateSubnet"
  }
}

# Create a Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.myvpc.id
}

# Create a public route Table
resource "aws_route_table" "Publicrt" {
  vpc_id = aws_vpc.myvpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

# Create a private route table
resource "aws_route_table" "Privatert" {
  vpc_id = aws_vpc.myvpc.id
}

# Create a public route table association
resource "aws_route_table_association" "PublicRtAssociation" {
  subnet_id      = aws_subnet.Public-subnet.id
  route_table_id = aws_route_table.Publicrt.id
}

# Create a private route table association
resource "aws_route_table_association" "PrivateRtAssociation" {
  subnet_id      = aws_subnet.Private-subnet.id
  route_table_id = aws_route_table.Privatert.id
}