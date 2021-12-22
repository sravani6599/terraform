module "ec2" {

  source = "../Modules"

  region = "us-west-2"

  availability_zones = "us-west-2a"

  ami = "ami-002068ed284fb165b"

  instance_type = "t2.micro"

  }
