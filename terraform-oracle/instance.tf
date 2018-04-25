resource "aws_instance" "mycluster" {
  count = "${var.count_instances}"

  ami           = "${var.ami_id}"
  instance_type = "${var.INSTANCE_TYPE}"

  # the security group
  vpc_security_group_ids = ["${aws_security_group.allow-sg.id}"]

  # the public SSH key
  #key_name = "${aws_key_pair.mykeypair.key_name}"
  key_name = "${var.SSH_KEY_NAME}"

  tags {
    Name = "${var.name}"
    TTL = 72
  }

  # Copies the myapp.conf file to /etc/myapp.conf
  /*
  provisioner "file" {
    source      = "scripts/runcbd.sh"
    destination = "/var/lib/cloudbreak-deployment/runcbd.sh"
   }

 provisioner "remote-exec" {
   inline = [
    "cd /var/lib/cloudbreak-deployment/",
    "chmod +x runcbd.sh",
    "./runcbd.sh ${var.UAA_DEFAULT_SECRET} ${var.UAA_DEFAULT_USER_PW} ${var.UAA_DEFAULT_USER_EMAIL}"
  ]
 }
   connection {
     Type = "ssh"
     user = "${var.INSTANCE_USERNAME}"
     #private_key = "${file(${var.path_to_private_key})}"
     private_key = "${var.PRIVATE_KEY}"
    }

}
*/


