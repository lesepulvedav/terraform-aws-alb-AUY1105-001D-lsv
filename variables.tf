variable "alb_name" {
  description = "Nombre del Application Load Balancer"
  type        = string
  default     = "alb-prueba2"
}

variable "load_balancer_type" {
  description = "Tipo de Load Balancer (application o network)"
  type        = string
  default     = "application"
}

variable "environment" {
  description = "Entorno de despliegue (dev, staging, prod)"
  type        = string
  default     = "dev"
}

variable "tg_alb_name" {
  description = "Nombre del Target Group del ALB"
  type        = string
  default     = "tg-web-prueba2"
}

variable "port" {
  description = "Puerto para el Target Group"
  type        = number
  default     = 80
}

variable "protocol" {
  description = "Protocolo para el Target Group"
  type        = string
  default     = "HTTP"
}
