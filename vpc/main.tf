module aws_vpc_module {
    source = "./aws_vpc"

    aws_access_key = "${var.access_key}"
    aws_secret_key = "${var.secret_key}"
    aws_region = "${var.region}"
    aws_vpc_cidr = "${var.cidr}"
    aws_vpc_name = "${var.name}"
}