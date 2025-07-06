# Terraform 101 Course

This is an overview course of Terraform with labs for orchatrarting azure cloud.

## Lab1

### Terraform Core Workflow

- terraform init
- terraform plan
- terraform apply
- terraform destroy

![Core concepts written on a whiteboard ](img/core.png)

### Inputs

[variables.tf](/Lab1/Lab1/variables.tf)
![Input variables screen shot](img/inputs.png)

### Outputs

[outputs.tf](/Lab1/Lab1/outputs.tf)
![Output variables screen shot](img/outputs.png)

### String Interpolation

Allows to concatenate strings together, in a highly readable way
[main.tf](/Lab1/Lab1/main.tf)
![String interpolation screen shot](img/interpolation.png)

### Defining Required Providers

[versions.tf](/Lab1/versions.tf)
![Required providers screen shot](img/required_providers.png)

### Referencing Resource Outputs

[outputs.tf](/Lab1/outputs.tf)
![Outputs screen shot](img/rro-outputs.png)
[main.tf](/Lab1/main.tf)
![main file screen shot](img/rro-main.png)

### Default Variable Files

[default.auto.tfvars](/Lab1/default.auto.tfvars)
![defaut vars screen shot](img/auto-tvarfs.png)
