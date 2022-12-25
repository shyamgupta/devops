module "pub-sec-group" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "pub-sec-group"
  description = "Open port 22 for bastion host for everyone"
  vpc_id      = module.my-vpc.vpc_id
  egress_with_cidr_blocks = [
    {
      from_port   = 0
      to_port     = 65535
      protocol    = "all"
      description = "Allow egress traffic"
      cidr_blocks = "0.0.0.0/0"
    }
  ]

  ingress_with_cidr_blocks = [

    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      description = "SSH"
      cidr_blocks = "0.0.0.0/0"
    }
  ]
}


module "pri-sec-group" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "pri-sec-group"
  description = "Traffic for private subnet"
  vpc_id      = module.my-vpc.vpc_id
  egress_with_cidr_blocks = [
    {
      from_port   = 0
      to_port     = 65535
      protocol    = "all"
      description = "Allow egress traffic"
      cidr_blocks = "0.0.0.0/0"
    }
  ]

  ingress_with_cidr_blocks = [

    {
      from_port   = 0
      to_port     =65535
      protocol    = "all"
      description = "Allow ingress traffic only from VPC CIDR block"
      cidr_blocks = "10.0.0.0/16"
    }
  ]
}
