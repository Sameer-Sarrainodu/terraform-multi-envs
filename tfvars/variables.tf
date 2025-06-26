variable "aws_reg" {
    default = "us-east-1"
  
}
variable "aws_ami" {
    default = "ami-09c813fb71547fc4f"
  
}
variable "instance_type" {
    
  
}
variable "environment" {
  
}
variable "instances" {
    type=list(string)
    default = ["frontend","mysql"]
  
}
variable "sg_name" {
    default="allow-all"
  
}
variable "sg_descri" {
    default="this is security group created by sameer"
  
}

variable "fromport" {
  default = 0
}
variable "toport" {
  default = 0
}
variable "cidr" {
    default=["0.0.0.0/0"]
  
}
variable "domain_name" {
    default = "sharkdev.shop"
  
}
variable "zone_id" {
    default ="Z0022572U6LHZ3ASAGBB"
  
}

variable "common_tags" {
    default = {
        Project="roboshop"
        terraform=true
    }
  
}
variable "Project" {
    default = "roboshop"
  
}
