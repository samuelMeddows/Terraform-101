# Terraform 101 Course

This is an overview course of Terraform with labs for orchatrarting azure cloud.

## Lab 1: Fundamentals

### Terraform Core Workflow

- terraform init
- terraform plan
- terraform apply
- terraform destroy

![Core concepts written on a whiteboard ](img/core.png)

### Inputs

[variables.tf](lab1-fundamentals/variables.tf)

![Input variables screen shot](img/inputs.png)

### Outputs

[outputs.tf](lab1-fundamentals/outputs.tf)

![Output variables screen shot](img/outputs.png)

### String Interpolation

Allows to concatenate strings together, in a highly readable way
[main.tf](lab1-fundamentals/main.tf)

![String interpolation screen shot](img/interpolation.png)

### Defining Required Providers

[versions.tf](lab1-fundamentals/versions.tf)

![Required providers screen shot](img/required_providers.png)

### Referencing Resource Outputs

[outputs.tf](lab1-fundamentals/outputs.tf)

![Outputs screen shot](img/rro-outputs.png)

[main.tf](lab1-fundamentals/main.tf)

![main file screen shot](img/rro-main.png)

### Default Variable Files

[default.auto.tfvars](lab1-fundamentals/default.auto.tfvars)

![defaut vars screen shot](img/auto-tvarfs.png)

### Using Input Variable Files for Environment Configuration

Move the environment name to it's own tfvars file.
Note: Terraform needs the dev var file added into the command

`terraform apply -var-file dev.tfvars`

[default.auto.tfvars](lab1-fundamentals/default.auto.tfvarsf)

![alt text](img/ec-default.auto.tfvars.png)

[dev.tfvars](lab1-fundamentals/env/dev.tfvars)

![alt text](img/ec-dev.tfvars.png)

### Managing Input Variable Files for Multiple Environments

Create environment files for test.tfvars and prod.ftvrs
To load prod: `terraform apply -var-file prod.tfvars`

Group together the tfvar files and place them into the env folder.

- env/dev.tfvrs
- env/test.tfvrs
- env/prod.tfvr

To load prod: `terraform apply -var-file env/prod.tfvars`

### Seneitive Inputs and Outputs

- Passwords
- Connection strings
- API keys

[variables.tf](lab1-fundamentals/variables.tf)

```
variable api_key{
    sensitive = true
}
```

[outputs.tf](lab1-fundamentals/outputs.tf)

```
output "api_key" {
    value = var.api_key
    sensitive = true
}
```

Run terrform apply
`terraform apply -var-file env/dev.tfvars`

Even though marked as sensitive, we can still view the API output
`terraform output api_key`

⚠️ **Sec Note:**

1. Only execute terraform from a trusted machine.
2. Employ terrfrom state backends that use data encryption.
3. Principle of least privledge is applied to state files.

### Passing Input Variable Values using Environment Variables using PowerShell

Run a PS script that exports an environment variable.

<u>Powershell</u>
`PS: $env:SAMSBLOG_API_KEY = "sk-47cd-9986-898f13127486"`

<u>Terrform specifc syntax</u>
`PS: $env:TF_VAR_api_key = "sk-47cd-9986-898f13127486"`

Note: api_key is case sensitive to the same variable in variables.tf

You will no longer be promted for the API key.
`terraform apply -var-file env/dev.tfvars`

### Passing Input Variable Values using Environment Variables using BASH

Run a BASH script that exports an environment variable.

<u>Terrform specifc syntax</u>
`BASH: export TF_VAR_api_key="sk-ce3d27f9-025d-47cd-9986-898f13127486"`

⚠️ **Sec Note:** Ensure sensitive variable scripts NEVER get commited.

### Input Variable Value Selection Order

Order of Terraform variable Lookup

1. Enviroment variables
2. Default Terraform tfvar files
   1. terraform.trvars
   2. anything.auto.tfvar
3. -var and -var-file command line options
4. Manual input

### Input Variable Types

Decleare variable types within the variables.tf file.

```
variable "enabled" {
  type = bool
}
```

#### Collection typer

<u>List</u>

variables.tf

```
variable "list"{
  type = list(string)
}
```

prod.tfavrs

```
regions = ["us-east-1", "us-west-2"]
```

<u>Map</u>
Maps a great for delcaring how many instances of a resource you want in each region.
variables.tf

```
variable "region_instant_count" {
  type = map(string)
}
```

prod.tfavrs

```
region_instant_count = {
  "us-east-1" = 4
  "us-west-2" = 8
}
```
