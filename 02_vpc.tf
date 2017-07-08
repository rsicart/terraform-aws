resource "aws_vpc" "my_vpc" {
    cidr_block = "${var.vpc_cidr}"
    tags {
	Name = "vpc"
    }
}

resource "aws_internet_gateway" "default_gw" {
    vpc_id = "${aws_vpc.my_vpc.id}"
}

/*
 * Public subnet
 */
resource "aws_subnet" "public_subnet" {
    vpc_id = "${aws_vpc.my_vpc.id}"
    cidr_block = "${var.subnet_public_cidr}"
    availability_zone = "${var.region}a"
}

resource "aws_route_table" "public_subnet_rt" {
    vpc_id = "${aws_vpc.my_vpc.id}"
    route {
	cidr_block = "0.0.0.0/0"
	gateway_id = "${aws_internet_gateway.default_gw.id}"
    }
    tags {
	Name = "public subnet route table"
    }
}

resource "aws_route_table_association" "public_subnet_rt_association" {
    subnet_id = "${aws_subnet.public_subnet.id}"
    route_table_id = "${aws_route_table.public_subnet_rt.id}"
}
