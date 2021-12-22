provider "aws"{

    region = "${var.region}"

    #access_key = "************"

    #sevret_key = "************"

    }

resource "aws_instance" "ec2_pro" {

    availability_zone = "${var.availability_zones}"

    ami ="${var.ami}"

    instance_type = "${var.instance_type}"

    key_name = "jenkins"

    #count = var.instance_count

    tags = {

        Name = "Productionserver"

        #Name = "Terraform-${count.index + 1}"

        }

    security_groups= ["${aws_security_group.ALLTRAFFIC.name}"]   

    }




resource "aws_security_group" "ALLTRAFFIC" {

   name="ALLOW TRAFFIC"



    ingress {

         from_port = 22

         to_port = 22

         protocol = "TCP"

         cidr_blocks = ["0.0.0.0/0"]

    }
 ingress {

         from_port = 8080

         to_port = 8080

         protocol = "TCP"

         cidr_blocks = ["0.0.0.0/0"]

    }



    egress {

        from_port = 443

      to_port = 443

      protocol = "TCP"

      cidr_blocks = ["0.0.0.0/0"]



 }

 }



# resource "aws_ebs_volume" "volume1" {

#     availability_zone = "us-west-2a"

#     size = 1

#     encrypted = true

 

# }

# resource "aws_volume_attachment" "ebsattchment" {

#     device_name = "/dev/sdh"

#     volume_id = "${aws_ebs_volume.volume1.id}"

#     instance_id = "${aws_instance.ec2_pro.id}"

 

# }
