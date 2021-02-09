resource "aws_security_group" "SG-1" {
  name        = "${var.SG1_name}"
  vpc_id      = "${aws_vpc.default.id}"

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${var.inbound_source}"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.SG1_name}"
  }
}