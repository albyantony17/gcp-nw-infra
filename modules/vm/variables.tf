variable "name" {
  type = string
}

variable "machine_type" {
  type = string
}

variable "zone" {
  type = string
}

variable "subnet" {
  type = string
}

variable "tags" {
  type = list(string)
}

variable "image" {
  type = string
}