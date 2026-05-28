**Changelog**

Este archivo contiene los cambios realizados en el proyecto de infraestructura como código utilizando Terraform. Sigue el formato Keep a Changelog y respeta la semántica de versiones Semantic Versioning.

[0.2.0] - 2026-05-28
Changed

- Se añadieron nuevas variables de entrada: `subnets`, `security_group_id`, `vpc_id` e `instance_id` para parametrizar la creación del ALB y su target group.
- El ALB y el Target Group ahora usan entradas externas en lugar de depender de recursos locales dentro del módulo.
- Se eliminó la condición `count` en la creación del `aws_lb_target_group_attachment` para evitar dependencias computadas en tiempo de plan; `instance_id` ahora puede ser `null`.

Breaking

- Interfaz del módulo modificada: consumidores deben proporcionar `subnets`, `security_group_id` y `vpc_id`.

[0.1.1]
Agregado

Se agrega archivo .gitignore

[0.1.0]
Agregado

Definición inicial de variables en variables.tf.
Creación de salidas en outputs.tf
Creación de recursos en archivo main.tf
Documentación generada automáticamente con terraform-docs.

Nota: Este archivo se mantendrá actualizado con cada cambio significativo para mejorar la trazabilidad y la colaboración.