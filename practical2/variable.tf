variable "ami_id" {
  type = string

}
variable "instance_type" {
  type = string

}
variable "subnet_id" {
  type = string

}
variable "key_name" {
  type = string

}
variable "vpc_id" {
  type = string

}
variable "region" {
  type = string

}
variable "my_ip" {
  description = "Your public IP with /32"
  type        = string
}