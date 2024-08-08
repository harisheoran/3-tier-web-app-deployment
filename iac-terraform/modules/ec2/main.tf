resource "aws_instance" "prod_server" {
    ami = var.ami_prod_server
    instance_type = var.type_prod_server
    key_name = var.key_name
    vpc_security_group_ids = [aws_security_group.prod_aws_security_group.id]
    associate_public_ip_address = true

    root_block_device {
        volume_size = 15  # Custom size for the root EBS volume
    }


    tags = {
        Name = "Production Server"
    }
}

# jumpbox server security group
resource "aws_security_group" "prod_aws_security_group" {
    name = "security-group-k8s-jb"
    
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 3000
        to_port = 3000
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}