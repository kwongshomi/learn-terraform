# Keys abstracted out to separate variable files
provider "aws" {
    access_key = "${var.access_key}"
    secret_key = "${var.secret_key}"
    region = "${var.region}"
}

# The main resource to setup an instance
resource "aws_instance" "example" {
    ami = "${lookup(var.amis, var.region)}"
    instance_type = "t2.micro"
    subnet_id = "${var.vpc_subnet}"
    vpc_security_group_ids = ["${split(",",var.vpc_security_groups)}"]
    key_name = "${var.keypair_name}"
    availability_zone = "${var.availability_zone}"
    tags {
      Name = "${var.node_name}"
    }
    
    # Just an example of a local-exec.  This writes to the directory where Terraform is started.
    provisioner "local-exec" {
      command = "echo ${aws_instance.example.public_ip} > file.txt"
    }

    # This provisioner copies a file from the Terraform run directory to the remote instance.
    # Need the connection section to SSH in as a user other than the default of root.
    provisioner "file" {
      connection {
        user = "centos"
        key_file = "${var.aws_private_key}"
      }
      source = "edithosts.sh"
      destination = "/tmp/edithosts.sh"
    }

    # This provisioner runs the script that is copied to the remote server by the previous step.
    provisioner "remote-exec" {
      connection {
        user = "centos"
        key_file = "${var.aws_private_key}"
      }
      inline = ["sudo chmod +x /tmp/edithosts.sh; sudo su -c '/tmp/edithosts.sh'"]
    }

    # This is the Chef provisioner.  It bootstraps the instance and runs the specified recipe/cookbook.
    provisioner "chef" {
        connection {
          user = "centos"
          key_file = "${var.aws_private_key}"
        }
        environment = "_default"
        run_list = [
           "recipe[hello_chef_server]"
        ]
        node_name = "${var.node_name}"
        #secret_key = "${file("../encrypted_data_bag_secret")}"
        server_url = "${var.chef_server_url}"
        validation_client_name = "${var.chef_validation_client_name}"
        validation_key = "${var.chef_validation_key}"
        ssl_verify_mode = ":verify_none"
    }
}

# This allocates an EIP and attaches it to the instance
resource "aws_eip" "ip" {
    instance = "${aws_instance.example.id}"
}

# This just prints the EIP to stdout
output "ip" {
    value = "${aws_eip.ip.public_ip}"
}
