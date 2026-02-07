terraform {
  backend "s3" {
    bucket = "cicd-terraform-eks-feb"
    key    = "eks/terraform.tfstate"
    region = "ap-northeast-1"
  }
}
