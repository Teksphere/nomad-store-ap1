output "alb_dns_name" { 
  value = aws_lb.nomad_lb.dns_name
  description = "The domain name of the load balancer"
}

output "lb_url" {
  value = "SSL url for load balancer https://${aws_route53_record.domain.fqdn}"
}