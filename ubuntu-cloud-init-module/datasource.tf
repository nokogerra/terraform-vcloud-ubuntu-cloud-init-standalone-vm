data "template_file" "userdata" {

  template = file("${path.module}/userdata.yml")
  vars = {
    ci_hostname     = "${var.mod_vm_name}"
    ci_instance_id  = "${var.mod_vm_name}"
    ci_user_name    = "${var.mod_ci_user_name}"
    ci_user_gecos   = "${var.mod_ci_user_gecos}"
    ci_user_ssh_pub = "${var.mod_ci_user_ssh_pub}"
    ci_time_zone    = "${var.mod_ci_time_zone}"
    ci_user_passwd  = "${var.mod_ci_user_passwd}"
    ci_root_passwd  = "${var.mod_ci_root_passwd}"
  }
}

data "vcd_catalog" "my_cat" {
  org  = var.mod_org_name
  name = var.mod_org_catalog
}
