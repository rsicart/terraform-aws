resource "aws_security_group" "allow_home" {
    name = "allow_home"
    description = "allow all inbound connections from my home"
    vpc_id = "${aws_vpc.my_vpc.id}"

    ingress {
	from_port = 0
	to_port = 22
	protocol = "tcp"
	cidr_blocks = [
	    "${var.my_home}"
	]
    }

    ingress {
	from_port = 0
	to_port = 0
	protocol = "icmp"
	cidr_blocks = [
	    "${var.my_home}"
	]
    }

    ingress {
	from_port = 0
	to_port = 80
	protocol = "tcp"
	cidr_blocks = [
	    "${var.my_home}",
	    "10.0.0.0/16",
	]
    }

    egress {
	from_port = 0
	to_port = 0
	protocol = "-1"
	cidr_blocks = [
	    "0.0.0.0/0"
	]
    }
}

resource "aws_security_group" "allow_elb_www" {
    name = "allow_elb_www"
    description = "allow all inbound and outbound connections on elb"
    vpc_id = "${aws_vpc.my_vpc.id}"

    ingress {
	from_port = 0
	to_port = 80
	protocol = "tcp"
	cidr_blocks = [
	    "${var.my_home}",
	]
    }

    egress {
	from_port = 0
	to_port = 0
	protocol = "-1"
	cidr_blocks = [
	    "0.0.0.0/0"
	]
    }
}
