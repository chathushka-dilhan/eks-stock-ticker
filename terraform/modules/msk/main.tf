// This module creates the MSK cluster.

resource "aws_security_group" "msk" {
  name        = "${var.cluster_name}-msk-sg"
  description = "Security group for MSK cluster"
  vpc_id      = var.vpc_id

  tags = merge(
    var.tags,
    {
      Name = "${var.cluster_name}-msk-sg"
    }
  )
}

# Allow traffic from within the VPC on the Kafka ports
resource "aws_security_group_rule" "allow_vpc_inbound" {
  type              = "ingress"
  from_port         = 9092
  to_port           = 9094
  protocol          = "tcp"
  security_group_id = aws_security_group.msk.id
  cidr_blocks       = [var.vpc_cidr_block]
}

resource "aws_msk_cluster" "main" {
  cluster_name           = var.cluster_name
  kafka_version          = var.kafka_version
  number_of_broker_nodes = var.number_of_broker_nodes

  broker_node_group_info {
    instance_type   = var.broker_instance_type
    client_subnets  = var.private_subnet_ids
    security_groups = [aws_security_group.msk.id]
  }

  encryption_info {
    encryption_in_transit {
      client_broker = "TLS"
    }
  }

  tags = merge(
    var.tags,
    {
      Name = var.cluster_name
    }
  )
}