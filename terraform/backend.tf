terraform {
  backend "s3" {
    bucket = "cicd-terraform-eks-march"
    key    = "eks/terraform.tfstate"
    region = "ap-northeast-1"
  }
}
