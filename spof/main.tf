data "aws_ami" "this" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "architecture"
    values = ["arm64"]
  }
  filter {
    name   = "name"
    values = ["al2023-ami-2023*"]
  }
}

resource "aws_default_vpc" "default" {}

resource "aws_security_group" "security_group" {
  name        = "security group for spof"
  description = "allow ssh on port 22 and http on port 80"
  vpc_id      = aws_default_vpc.default.id

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }


  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "spof" {
  instance_type          = "t4g.nano"
  ami                    = data.aws_ami.this.id
  key_name = "spof"
  user_data              = file("userdata.tpl")
  vpc_security_group_ids = [aws_security_group.security_group.id]
}

output "ip_address" {
  value = aws_instance.spof.public_ip
}
