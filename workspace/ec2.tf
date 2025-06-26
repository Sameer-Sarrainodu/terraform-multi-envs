resource "aws_security_group" "allow-all" {
    name = "${var.Project}-${var.sg_name}-${terraform.workspace}"
    description = var.sg_descri 
    lifecycle {
      create_before_destroy = true
    }
    tags =merge(
        var.common_tags,
        {
            Name="${var.Project}-${var.sg_name}-${terraform.workspace}"
            

        }

    ) 
    

    ingress{
        from_port = var.fromport
        to_port = var.toport
        protocol = "-1"
        cidr_blocks = var.cidr 
        ipv6_cidr_blocks = ["::/0"]
    } 
    
    egress{
        from_port = var.fromport
        to_port = var.toport 
        protocol = "-1"
        cidr_blocks = var.cidr 
        ipv6_cidr_blocks = ["::/0"]
    } 
}

resource "aws_instance" "instances" {
    count =length(var.instances)
    ami = var.aws_ami
    instance_type = lookup(var.instance_type,terraform.workspace)
    vpc_security_group_ids =[aws_security_group.allow-all.id]
    tags =merge(
        var.common_tags,
        {
        Name = "${var.Project}-${var.instances[count.index]}-${terraform.workspace}"
      Component = var.instances[count.index]
      Environment = terraform.workspace
        }
    )
    
}