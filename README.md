# pbp-terraform-module-naming-convention-abhishek
Terraform Module Exercise Solution by Abhishek Arora

## Overview

### Modules Features
This module creates dynamically provides the resource name with the following naming convention 
- This modules should create a naming convention for AWS resources such as `pbp-{domain}-{service_name}-{environment}`
>`pbp` - Required: Is a fixed value that must be at the start. This is to indicate that the resource was deployed by PayByPhone.
> `{domain}` - Required: Must be from one of the following accepted values from the list of domains (reporting|data|platform|fron
tend|backend)
> `{service_name}` - Optional: Alphanumeric and with no spaces; when service name is not provided, a random string (length 8) is
created
> `{environment}` - Optional: Must be from one of the following accepted values development and production

- by default lower case and can accept any user case
- total character count should limit to 50 
- Exposed the module output as the resource name

- Allow reordering of {domain}, {environment}, {service_name} using a `bool` variable `reordering_flag`. Default set to `false`. If set to `true` it accepts the input from the consumer for 1st , 2nd and 3rd order of the naming convention.
> For example : if 1st order is `service_name` and 2nd order is `domain` and 3rd order is `environment` then the resulted output should be
```
pbp-{service_name}-{domain}-{environment}
```

