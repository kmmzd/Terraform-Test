terraform {
  backend "s3" {
    bucket = "tftest-tfstate"
    key    = "prd/prd_tfstate"
    region = "ap-northeast-1"
  }
}