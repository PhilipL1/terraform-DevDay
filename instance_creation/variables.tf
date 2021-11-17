variable "subnet" {
  type        = string
  description = "Subnet for VM "
}

variable "security_groups" {
  type        = list
  description = "List of security groups for NIC"
}

variable "name_of_instance" {
  type        = string
  description = "Name of Instance"
}

variable "target_group" {
  type        = string
  description = "Name of target group"
}