#Provider vars
org_user                        = "admin"
org_password                    = "password"
org_name                        = "org"
org_url                         = "https://cloud.director.example/api"
org_vdc                         = "org_vdc"
org_max_retry_timeout           = 1800
org_allow_unverified_ssl        = true

org_edge_gw                     = "edge"
org_catalog                     = "org_catalog"
template_vm                     = "Ubuntu-20.04-cloud-init"

#System disk override vars. Disk override is going to commit the changes only if its section is not commented out inside the module (main.tf)
#In case you don't want to override the system disk, make sure, the override section is commented out in the module body.
system_disk_bus = "paravirtual"
system_disk_size = "20"
system_disk_storage_profile = "DPLabCompNonSSD"

#Other vars
ci_user_name = "ansible"
ci_user_gecos = "ANSIBLE"
ci_user_ssh_pub = "ssh-ed25519 AAAAC3NzaC1lZDIxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx nokogerra-personal"
ci_time_zone = "Europe/Moscow"
#Encrypted passwords can be generated by "openssl passwd -6 P@ssw0rd". In modren openssl versions the salt is unique in every usage,
#so you don't need to specify it manually. Just try the command "openssl passwd -6 some_string" and you'll get the different result every time.
ci_user_passwd = "$6$2.AdSNvQxZHJCsIw$aDI7AlkNrevdRVsR8IqqYSwX3qqZWBF.wVlh7w9NI/Zp74GDzIIzBREjohhw/vtd8/gNu8DyBBd3CnAAQH2mF1"  
ci_root_passwd = "$6$W7MDl8VgU4xofiKe$xkL3dMmCrjhZG2Io5X6leAgV6wzfOHMG52/JfI0y8tI7XfCEYvUFp3cOs4K7ni1CVxght6FPZOwa.KJOEDotT."
org_network = "kube-net02"
#This is actually a "VM Home" storage policy. If you need to change system disk storage policy,
#you have to override it in "system_disk_storage_profile" variable. 
storage_profile = "DPLabCompNonSSD"

#VM vars
#In the following map variable you must specify VM, IP addresses and CPU/mem configuration according to your needs.
#Specify as many VMs, as you need:
vms = {
    s1-init-test03 = {
        vm_name = "s1-init-test03"
        ip_addr = "10.215.102.63"
        vm_mem = "4"
        vm_cpus = "2"
    }
    s1-init-test04 = {
        vm_name = "s1-init-test04"
        ip_addr = "10.215.102.64"
        vm_mem = "8"
        vm_cpus = "4"
    }
}

#Additional disks vars
#Data disks. Comment this var out, in case you do not need an additional disks.
#Specify as many disks, as you need:
add_disks = {
          disk1 = {
            sizegb = "15"
            bus_num = "1"
            unit_num = "0"
            storage_profile = "DPLabCompNonSSD" 
            bus_type = "paravirtual" 
          }
          disk2 = {
            sizegb = "5"
            bus_num = "1"
            unit_num = "1"
            storage_profile = "DPLabCompNonSSD"
            bus_type = "paravirtual"  
          }
}