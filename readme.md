## Simple module to deploy Ubuntu cloud image in VMware Cloud Director 10.x
This recipe is intended to deploy Ubuntu (tested on 20.04 LTS) from Ubuntu cloud image https://cloud-images.ubuntu.com/focal/ and customize it with cloud-init.<br />
**The recipe is going to deploy stand-alone VMs (with "shadow" vApps). If you need to use vApps, check https://github.com/nokogerra/terraform-vcloud-ubuntu-cloud-init.**<br />
Despite I usually use cloud-ready-image, it is possible to use your own custom Ubuntu image with properly configured cloud-init. 

### Requirements
You gonna need a preconfigured Org Network (IP pool, DNS settings, etc) and an Ubuntu image in your Org Catalog (Library).<br />

### Additional disks bus type
Be careful choosing bus type for a data disks. In case your template has system disk (0:0) with Parallel bus type, and then you add data disks to a Paravirtual bus (1:x), your Ubuntu guest OS will change system disk letter (e.g. from sda to sdb)! It's safer to add data disks to the same bus type as a system disk attached to. It just means not the same bus, but the **same bus type**.<br />
In my example, the bus type of the system disk is overrided during deployment and set to "paravirtual", so there will be no issues, if you choose "paravirtual" for an additional disks too.

### System disk override
If you need to override system disk parameters, then uncomment the corresponding section in the main.tf of "ubuntu-customization-module". **It is uncommented by default in this example**.

### CPU and Memory hot-add
CPU hot-add and Memory hot-plug are enabled and hardcoded in module "ubuntu-customization-module".

### Cloud-init
There is just a simple example of cloud-init userdata, which is going to:
* create a new user (sudoer) with ssh_pub;
* set passwords for a new user and root;
* set a hostname, an instance_id and time zone;
* disable IPv6;
* upgrade all packages.<br />
<br />
Network settings are configured via customization (manual IP allocation).


### Usage
Fulfill "terraform.tfvars", then:
```
terraform init
terraform plan
terraform apply
```
If you are unable to init your project due to a limited access to Terraform registry, you can use a mirror (e.g. https://registry.comcloud.xyz/) or a cached providers.