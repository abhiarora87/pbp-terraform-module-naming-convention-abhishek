# pbp-terraform-module-naming-convention-abhishek
Terraform Module Exercise Solution by Abhishek Arora

## Overview

### Modules Features
This module creates dynamically provides the resource name with the following naming convention 
- This modules should create a naming convention for AWS resources such as `pbp-{domain}-{service_name}-{environment}`
    -`pbp` - Required: Is a fixed value that must be at the start. This is to indicate that the resource was deployed by PayByPhone.
    -`{domain}` - Required: Must be from one of the following accepted values from the list of domains (reporting|data|platform|fron
tend|backend)
    -`{service_name}` - Optional: Alphanumeric and with no spaces; when service name is not provided, a random string (length 8) is
created
    -`{environment}` - Optional: Must be from one of the following accepted values development and production

- by default lower case and can accept any user case

- This module will only create the name if the total character count is less than or equal to 50 . If greater than 50 it will provide a null value and output of `total_character_exceed_flag` to `true` if needs to be consumed somewhere in the child module

- Exposed the module output as the resource name

- Allow reordering of {domain}, {environment}, {service_name} using a `bool` variable `reordering_flag`. Default set to `false`. If set to `true` it accepts the input from the consumer for 1st , 2nd and 3rd order of the naming convention.
> For example : if 1st order is `service_name` and 2nd order is `domain` and 3rd order is `environment` then the resulted output should be
```
pbp-{service_name}-{domain}-{environment}
```

- Allow for any delimiter. The default is “-” when none is specified . If another delimiter the consumer can provide in `var.delimiter`

- Allow additional case output: default lower, additional case Title and UPPER by exposing name outputs with lower, title and upper case.

### Module Usage

- This module can be consumed by the following example to create a athena database

#### Example 1
```
module "naming_convention"{
    source = "git@github.com:abhiarora87/pbp-terraform-module-naming-convention-abhishek.git"
    domain = "reporting"
    environment = "development"
}

resource "aws_s3_bucket" "example" {
  bucket = "example"
}

resource "aws_athena_database" "example" {
  name   = module.naming_convention.name
  bucket = aws_s3_bucket.example.id
}

```

#### Example 2
```
module "naming_convention"{
    source = "git@github.com:abhiarora87/pbp-terraform-module-naming-convention-abhishek.git"
    domain = "reporting"
    environment = "development"
    reordering_flag = true
    reordering = {
      first_order  = "service_name"
      second_order = "domain"
      third_order  = "environment"
    }
}

resource "aws_s3_bucket" "example" {
  bucket = "example"
}

resource "aws_athena_database" "example" {
  name   = module.naming_convention.name_upper
  bucket = aws_s3_bucket.example.id
}

```