#
# == Manifest: Project: Security Groups: draft-frontend
#
# The puppetmaster needs to be accessible on ports:
#   - 443 from the other VMs
#
# === Variables:
# stackname - string
#
# === Outputs:
# sg_draft-frontend_id
# sg_draft-frontend_elb_id

resource "aws_security_group" "draft-frontend" {
  name        = "${var.stackname}_draft-frontend_access"
  vpc_id      = "${data.terraform_remote_state.infra_vpc.vpc_id}"
  description = "Access to the draft-frontend host from its ELB"

  tags {
    Name = "${var.stackname}_draft-frontend_access"
  }
}

resource "aws_security_group_rule" "allow_draft-frontend_elb_in" {
  type      = "ingress"
  from_port = 443
  to_port   = 443
  protocol  = "tcp"

  # Which security group is the rule assigned to
  security_group_id = "${aws_security_group.draft-frontend.id}"

  # Which security group can use this rule
  source_security_group_id = "${aws_security_group.draft-frontend_elb.id}"
}

resource "aws_security_group" "draft-frontend_elb" {
  name        = "${var.stackname}_draft-frontend_elb_access"
  vpc_id      = "${data.terraform_remote_state.infra_vpc.vpc_id}"
  description = "Access the draft-frontend ELB"

  tags {
    Name = "${var.stackname}_draft-frontend_elb_access"
  }
}

# TODO test whether egress rules are needed on ELBs
resource "aws_security_group_rule" "allow_draft-frontend_elb_egress" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.draft-frontend_elb.id}"
}