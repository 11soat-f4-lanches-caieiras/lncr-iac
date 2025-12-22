#========================================================================================#
#                                 SECURITY GROUP OUTPUTS                                #
#========================================================================================#

output "alb_security_group_id" {
  description = "ID of the ALB security group"
  value       = aws_security_group.alb_sg.id
}

output "alb_security_group_arn" {
  description = "ARN of the ALB security group"
  value       = aws_security_group.alb_sg.arn
}