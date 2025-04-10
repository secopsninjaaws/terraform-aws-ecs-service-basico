resource "aws_alb_listener_rule" "main" {
  count        = var.alb_internal == "false" ? 1 : 0
  listener_arn = var.listiner_arn

  action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.main.arn
  }

  condition {
    host_header {
      values = ["${var.host_name}"]
    }
  }

  depends_on = [aws_alb_target_group.main]

}