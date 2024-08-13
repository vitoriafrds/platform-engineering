data "aws_vpc" "vpc" {
  tags = {
    Name = "${var.project}"
  }
}

data "aws_subnets" "all" {
  filter {
    name   = "tag:Tier"
    values = ["Public"]
  }
  filter {
    name   = "vpc-id"
    values = ["${data.aws_vpc.vpc.id}"]
  }
}

data "aws_subnet" "public" {
  for_each = toset(data.aws_subnets.all.ids)
  id       = each.value
}
