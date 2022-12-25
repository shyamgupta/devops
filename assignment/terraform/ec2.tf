module "bastion" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name = "bastion"

  ami                    = "ami-0b0ea68c435eb488d"
  instance_type          = "t2.micro"
  key_name               = "acgkp"
  monitoring             = true
  vpc_security_group_ids = [module.pub-sec-group.security_group_id]
  subnet_id              = module.my-vpc.public_subnets[0]
}


module "jenkins" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name = "jenkins"

  ami                    = "ami-0b0ea68c435eb488d"
  instance_type          = "t2.medium"
  key_name               = "acgkp"
  monitoring             = true
  vpc_security_group_ids = [module.pri-sec-group.security_group_id]
  subnet_id              = module.my-vpc.private_subnets[0]
}


module "appserver" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name = "appserver"

  ami                    = "ami-0b0ea68c435eb488d"
  instance_type          = "t2.micro"
  key_name               = "acgkp"
  monitoring             = true
  vpc_security_group_ids = [module.pri-sec-group.security_group_id]
  subnet_id              = module.my-vpc.private_subnets[0]
}
