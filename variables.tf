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

variable "subnets" {
  description = "Lista de subnets donde desplegar el ALB"
  type        = list(string)
}

variable "security_group_ids" {
  description = "Lista de IDs del security group(s) del ALB"
  type        = list(string)
}

variable "vpc_id" {
  description = "ID del VPC donde crear el Target Group"
  type        = string
}

variable "instance_id" {
  description = "ID de la instancia EC2 a registrar en el Target Group (opcional)"
  type        = string
}
