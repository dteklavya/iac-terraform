variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "aws_region" {}

provider "aws" {
    access_key = var.aws_access_key
    secret_key = var.aws_secret_key
    region = var.aws_region
}

resource "aws_instance" "web" {
  ami           = "ami-0f5ee92e2d63afc18"
  instance_type = "t2.micro"

  tags = {
    Name = "first-tf-ec2-instance"
  }
}

resource "aws_vpc" "main-vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name  = "Production"
  }
}

resource "aws_subnet" "first-subnet" {
    vpc_id = "${aws_vpc.main-vpc.id}"
    cidr_block = "10.0.1.0/24"
    
    tags = {
        Name = "prod-subnet"
    }
}
