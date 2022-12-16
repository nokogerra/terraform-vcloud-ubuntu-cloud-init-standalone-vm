# Provider vars
variable "mod_org_name" {
  description = ""
  default     = "default"
}

variable "mod_org_catalog" {
  description = ""
  default     = "default"
}

variable "mod_template_vm" {
  description = ""
  default     = "default"
}

#System disk vars
variable "mod_system_disk_bus" {
  description = ""
  default     = "default"
}

variable "mod_system_disk_size" {
  description = ""
  default     = "default"
}

variable "mod_system_disk_storage_profile" {
  description = ""
  default     = "default"
}

#Other vars

variable "mod_ci_user_name" {
  description = ""
  default     = "default"
}

variable "mod_ci_user_gecos" {
  description = ""
  default     = "default"
}

variable "mod_ci_user_ssh_pub" {
  description = ""
  default     = "default"
}

variable "mod_ci_time_zone" {
  description = ""
  default     = "default"
}

variable "mod_ci_user_passwd" {
  description = ""
  default     = "default"
}

variable "mod_ci_root_passwd" {
  description = ""
  default     = "default"
}

variable "mod_org_network" {
  description = ""
  default     = "default"
}

variable "mod_storage_profile" {
  description = ""
  default     = "default"
}

#VM vars
variable "mod_vm_mem" {
  description = ""
  default     = "2"
}
variable "mod_vm_cpus" {
  description = ""
  default     = "default"
}

variable "mod_vm_name" {
  description = ""
  default     = "default"
}

variable "mod_ip_addr" {
  description = ""
  default     = "default"
}

#Additional disks vars
variable "mod_add_disks" {
  type = map(object({
    sizegb          = string
    bus_num         = string
    unit_num        = string
    storage_profile = string
    bus_type        = string
  }))
  default = {}
}
