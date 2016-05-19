# Terraform and Chef Test

This is a test of Terraform and Chef.

This is what happens when doing a "terraform apply"

- a t2.micro node gets fired up using the specified CentOS AMI and keypair
- the instance is added to the specified AZ, VPC subnet
- the specified security groups are added
- an EIP is allocated and attached to this node
- the IP of the Chef server is added to the /etc/hosts file using the remote-exec provisioner
- a Chef provisioner is run to bootstrap the instance, then run the specified cookbook.

###Do a Terraform dry run

```
terraform plan
```

###Do the real Terraform run

```
terraform apply
```

Here is an example of an actual Terraform run

```

$ terraform apply
aws_instance.example: Refreshing state... (ID: i-52a3b4cf)
aws_instance.example: Destroying...
aws_instance.example: Still destroying... (10s elapsed)
aws_instance.example: Still destroying... (20s elapsed)
aws_instance.example: Still destroying... (30s elapsed)
aws_instance.example: Still destroying... (40s elapsed)
aws_instance.example: Still destroying... (50s elapsed)
aws_instance.example: Creating...
  ami:                               "" => "ami-6d1c2007"
  availability_zone:                 "" => "us-east-1d"
  ebs_block_device.#:                "" => "<computed>"
  ephemeral_block_device.#:          "" => "<computed>"
  instance_state:                    "" => "<computed>"
  instance_type:                     "" => "t2.micro"
  key_name:                          "" => "ken.wong@shomi.com"
  placement_group:                   "" => "<computed>"
  private_dns:                       "" => "<computed>"
  private_ip:                        "" => "<computed>"
  public_dns:                        "" => "<computed>"
  public_ip:                         "" => "<computed>"
  root_block_device.#:               "" => "<computed>"
  security_groups.#:                 "" => "<computed>"
  source_dest_check:                 "" => "true"
  subnet_id:                         "" => "subnet-2ed00405"
  tags.#:                            "" => "1"
  tags.Name:                         "" => "dev-chef-tf-node-ken"
  tenancy:                           "" => "<computed>"
  vpc_security_group_ids.#:          "" => "2"
  vpc_security_group_ids.2641625115: "" => "sg-0c2a3275"
  vpc_security_group_ids.865208124:  "" => "sg-9b9f62e0"
aws_instance.example: Still creating... (3s elapsed)
aws_instance.example: Still creating... (10s elapsed)
aws_instance.example: Still creating... (13s elapsed)
aws_instance.example: Still creating... (20s elapsed)
aws_instance.example: Still creating... (23s elapsed)
aws_instance.example: Provisioning with 'local-exec'...
aws_instance.example (local-exec): Executing: /bin/sh -c "echo 52.201.233.63 > file.txt"
aws_instance.example: Provisioning with 'file'...
aws_instance.example: Still creating... (30s elapsed)
aws_instance.example: Still creating... (33s elapsed)
aws_instance.example: Still creating... (40s elapsed)
aws_instance.example: Still creating... (43s elapsed)
aws_instance.example: Still creating... (50s elapsed)
aws_instance.example: Still creating... (53s elapsed)
aws_instance.example: Still creating... (1m0s elapsed)
aws_instance.example: Still creating... (1m3s elapsed)
aws_instance.example: Still creating... (1m10s elapsed)
aws_instance.example: Still creating... (1m13s elapsed)
aws_instance.example: Still creating... (1m20s elapsed)
aws_instance.example: Still creating... (1m23s elapsed)
aws_instance.example: Still creating... (1m30s elapsed)
aws_instance.example: Still creating... (1m33s elapsed)
aws_instance.example: Still creating... (1m40s elapsed)
aws_instance.example: Still creating... (1m43s elapsed)
aws_instance.example: Still creating... (1m50s elapsed)
aws_instance.example: Provisioning with 'remote-exec'...
aws_instance.example (remote-exec): Connecting to remote host via SSH...
aws_instance.example (remote-exec):   Host: 52.201.233.63
aws_instance.example (remote-exec):   User: centos
aws_instance.example (remote-exec):   Password: false
aws_instance.example (remote-exec):   Private key: true
aws_instance.example (remote-exec):   SSH Agent: true
aws_instance.example (remote-exec): Connected!
aws_instance.example (remote-exec): Adding entry for Chef server to /etc/hosts
aws_instance.example: Provisioning with 'chef'...
aws_instance.example (chef): Connecting to remote host via SSH...
aws_instance.example (chef):   Host: 52.201.233.63
aws_instance.example (chef):   User: centos
aws_instance.example (chef):   Password: false
aws_instance.example (chef):   Private key: true
aws_instance.example (chef):   SSH Agent: true
aws_instance.example (chef): Connected!
aws_instance.example (chef):   % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
aws_instance.example (chef):                                  Dload  Upload   Total   Spent    Left  Speed
aws_instance.example (chef):   0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0
aws_instance.example: Still creating... (1m53s elapsed)
aws_instance.example (chef): 100 19602  100 19602    0     0  50094      0 --:--:-- --:--:-- --:--:-- 50261
aws_instance.example (chef): el 7 x86_64
aws_instance.example (chef): Getting information for chef stable  for el...
aws_instance.example (chef): downloading https://omnitruck-direct.chef.io/stable/chef/metadata?v=&p=el&pv=7&m=x86_64
aws_instance.example (chef):   to file /tmp/install.sh.4031/metadata.txt
aws_instance.example (chef): trying curl...
aws_instance.example (chef): sha1	4def83368a1349959fdaf0633c4d288d5ae229ce
aws_instance.example (chef): sha256	6f00c7bdf96a3fb09494e51cd44f4c2e5696accd356fc6dc1175d49ad06fa39f
aws_instance.example (chef): url	https://packages.chef.io/stable/el/7/chef-12.10.24-1.el7.x86_64.rpm
aws_instance.example (chef): version	12.10.24
aws_instance.example (chef): downloaded metadata file looks valid...
aws_instance.example (chef): downloading https://packages.chef.io/stable/el/7/chef-12.10.24-1.el7.x86_64.rpm
aws_instance.example (chef):   to file /tmp/install.sh.4031/chef-12.10.24-1.el7.x86_64.rpm
aws_instance.example (chef): trying curl...
aws_instance.example (chef): Comparing checksum with sha256sum...

aws_instance.example (chef): WARNING WARNING WARNING WARNING WARNING WARNING WARNING WARNING WARNING

aws_instance.example (chef): You are installing an omnibus package without a version pin.  If you are installing
aws_instance.example (chef): on production servers via an automated process this is DANGEROUS and you will
aws_instance.example (chef): be upgraded without warning on new releases, even to new major releases.
aws_instance.example (chef): Letting the version float is only appropriate in desktop, test, development or
aws_instance.example (chef): CI/CD environments.

aws_instance.example (chef): WARNING WARNING WARNING WARNING WARNING WARNING WARNING WARNING WARNING

aws_instance.example (chef): Installing chef
aws_instance.example (chef): installing with rpm...
aws_instance.example (chef): warning: /tmp/install.sh.4031/chef-12.10.24-1.el7.x86_64.rpm: Header V4 DSA/SHA1 Signature, key ID 83ef826a: NOKEY
aws_instance.example (chef): Preparing...
aws_instance.example (chef): ################################# [100%]
aws_instance.example (chef): Updating / installing...
aws_instance.example (chef):    1:chef-12.10.24-1.el7                                                (  1%)
aws_instance.example: Still creating... (2m0s elapsed)
aws_instance.example (chef): ########                          ( 25%)
aws_instance.example (chef): ############                      ( 37%)
aws_instance.example: Still creating... (2m3s elapsed)
aws_instance.example: Still creating... (2m10s elapsed)
aws_instance.example: Still creating... (2m13s elapsed)
aws_instance.example (chef): #############                     ( 40%)
aws_instance.example (chef): ####################              ( 60%)
aws_instance.example (chef): #####################             ( 63%)
aws_instance.example: Still creating... (2m20s elapsed)
aws_instance.example: Still creating... (2m23s elapsed)
aws_instance.example (chef): ######################            ( 66%)
aws_instance.example (chef): #######################           ( 69%)
aws_instance.example (chef): ########################          ( 72%)
aws_instance.example: Still creating... (2m30s elapsed)
aws_instance.example: Still creating... (2m33s elapsed)
aws_instance.example (chef): #########################         ( 75%)
aws_instance.example (chef): ##########################        ( 78%)
aws_instance.example (chef): ###########################       ( 81%)
aws_instance.example (chef): ############################      ( 84%)
aws_instance.example (chef): #############################     ( 87%)
aws_instance.example (chef): ##############################    ( 90%)
aws_instance.example (chef): ###############################   ( 93%)
aws_instance.example (chef): ################################  ( 96%)
aws_instance.example (chef): ################################# [100%]
aws_instance.example (chef): Thank you for installing Chef!
aws_instance.example (chef): Creating configuration files...
aws_instance.example: Still creating... (2m40s elapsed)
aws_instance.example (chef): Starting initial Chef-Client run...
aws_instance.example: Still creating... (2m43s elapsed)
aws_instance.example (chef): Starting Chef Client, version 12.10.24
aws_instance.example (chef): Creating a new client identity for dev-chef-tf-node-ken using the validator key.
aws_instance.example (chef): resolving cookbooks for run list: ["hello_chef_server"]
aws_instance.example (chef): Synchronizing Cookbooks:
aws_instance.example (chef):   - hello_chef_server (0.1.0)
aws_instance.example (chef): Installing Cookbook Gems:
aws_instance.example (chef): Compiling Cookbooks...
aws_instance.example (chef): Converging 1 resources
aws_instance.example (chef): Recipe: hello_chef_server::default
aws_instance.example (chef):   * file[/var/chef/cache/hello.txt] action create
aws_instance.example (chef):     - create new file /var/chef/cache/hello.txt
aws_instance.example (chef):     - update content in file /var/chef/cache/hello.txt from none to 41371d
aws_instance.example (chef):     --- /var/chef/cache/hello.txt	2016-05-19 19:06:47.899769758 +0000
aws_instance.example (chef):     +++ /var/chef/cache/.chef-hello.txt20160519-7299-7z5ep4	2016-05-19 19:06:47.899769758 +0000
aws_instance.example (chef):     @@ -1 +1,2 @@
aws_instance.example (chef):     +Hullo, Chef Server! This is strange.
aws_instance.example (chef):     - restore selinux security context
aws_instance.example (chef): 
aws_instance.example (chef): Running handlers:
aws_instance.example (chef): Running handlers complete
aws_instance.example (chef): Chef Client finished, 1/1 resources updated in 04 seconds
aws_instance.example: Creation complete
aws_eip.ip: Creating...
  allocation_id:     "" => "<computed>"
  association_id:    "" => "<computed>"
  domain:            "" => "<computed>"
  instance:          "" => "i-d2adba4f"
  network_interface: "" => "<computed>"
  private_ip:        "" => "<computed>"
  public_ip:         "" => "<computed>"
aws_eip.ip: Creation complete

Apply complete! Resources: 2 added, 0 changed, 0 destroyed.

The state of your infrastructure has been saved to the path
below. This state is required to modify and destroy your
infrastructure, so keep it safe. To inspect the complete state
use the `terraform show` command.

State path: terraform.tfstate

Outputs:

  ip = 52.203.242.167

```
