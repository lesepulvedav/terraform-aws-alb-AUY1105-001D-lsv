# ─── APPLICATION LOAD BALANCER ────────────────────────────────────────────────
resource "aws_lb" "main" {
  name               = var.alb_name
  internal           = false
  load_balancer_type = var.load_balancer_type
  security_groups    = [aws_security_group.alb.id]
  subnets            = [aws_subnet.public.id, aws_subnet.public_2.id]

  enable_deletion_protection = false

  tags = {
    Name        = var.alb_name
    Environment = var.environment
  }
}

# ─── TARGET GROUP ─────────────────────────────────────────────────────────────
resource "aws_lb_target_group" "web" {
  name     = var.tg_alb_name
  port     = var.port
  protocol = var.protocol
  vpc_id   = aws_vpc.main.id

  health_check {
    enabled             = true
    path                = "/"
    protocol            = "HTTP"
    matcher             = "200"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }

  tags = {
    Name = var.tg_alb_name
  }
}

# ─── REGISTRO DE LA EC2 EN EL TARGET GROUP ────────────────────────────────────
resource "aws_lb_target_group_attachment" "web" {
  target_group_arn = aws_lb_target_group.web.arn
  target_id        = aws_instance.web.id
  port             = var.port
}

# ─── LISTENER HTTP ────────────────────────────────────────────────────────────
resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.main.arn
  port              = var.port
  protocol          = var.protocol

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.web.arn
  }
}