variable "Environment" {
  description = "prd or dev"
  type        = string
  default     = "prd"
}

variable "ec2unit" {
  description = "Number of ec2 instance created." 
  type        = number
  default     = 2
}

variable "multi_az" {
  description = "rds instance multi az." 
  type        = bool
  default     = true 
}
