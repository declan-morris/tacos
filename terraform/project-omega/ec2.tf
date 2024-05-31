module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name = "single-instance"

  instance_type          = "t2.micro"
  monitoring             = true

  tags = {
    Terraform   = "true"
    Environment = terraform.workspace
    project = "alpha"
  }
}

module "test2" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name = "single-instance"

  instance_type = "t2.micro"
  monitoring    = true

  tags = {
    Terraform   = "true"
    Environment = terraform.workspace
    project     = "beta"
  }
}