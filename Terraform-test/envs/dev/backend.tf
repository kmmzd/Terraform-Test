terraform {
  backend "s3" {
    bucket = "tftest-tfstate"
    key    = "dev/dev_tfstate"
    region = "ap-northeast-1"
  }
}