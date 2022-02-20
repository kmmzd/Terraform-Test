variable "Environment" {
  description = "prd or dev"
  type        = string
  default     = "dev"
}

variable "ec2unit" {
  description = "Number of ec2 instance created." 
  type        = number
  default     = 1
}

variable "multi_az" {
  description = "rds instance multi az." 
  type        = bool
  default     = false 
}







