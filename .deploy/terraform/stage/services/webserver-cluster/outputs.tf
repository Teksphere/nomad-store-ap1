output "stage_alb_dns_name" {
  value = module.webserver_cluster.alb_dns_name
  description = "The domain name of the load balancer for stage env"
}

output "lb_https_url" {
  value = module.webserver_cluster.lb_url 
  description = "The domain name of the load balancer for stage env"
}