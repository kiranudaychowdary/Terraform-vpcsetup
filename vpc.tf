resource "aws_vpc" "default" {
    cidr_block = "${var.vpc_cidr}"
    enable_dns_hostnames = true
    tags = {
        Name = "${var.vpc_name}"
	Owner = "${var.owner_name}"
	environment = "${var.environment}"
    }
    #depends_on = [aws_s3_bucket.terraform_test]
}

resource "aws_internet_gateway" "default" {
    vpc_id = "${aws_vpc.default.id}"
	tags = {
        Name = "${var.IGW_name}"
    }
}

resource "aws_eip" "EIP" {
  vpc = true
  tags = {
        Name = "${var.EIP_name}"
    }
    #depends_on = [aws_s3_bucket.terraform_test]
  }

  resource "aws_nat_gateway" "NAT-GW" {
  allocation_id = aws_eip.EIP.id
  subnet_id     = aws_subnet.subnet1-public.id

  tags = {
    Name = "${var.NAT_name}"
  }
}