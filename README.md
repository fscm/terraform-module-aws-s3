# S3 Terraform Module

A Terraform module to create a S3 endpoint service association to a VPC

## Prerequisites

Terraform and AWS Command Line Interface tools need to be installed on your
local computer.

### Terraform

Terraform version 0.10.3 or higher is required.

Terraform installation instructions can be found
[here](https://www.terraform.io/intro/getting-started/install.html).

### AWS Command Line Interface

AWS Command Line Interface installation instructions can be found
[here](http://docs.aws.amazon.com/cli/latest/userguide/installing.html).

## Module Input Variables

- `private_route_tables` - List of the private Route Table Identifiers to be associated with the S3 Endpoint. *[default value: []]*
- `public_route_tables` - List of the public Route Table Identifiers to be associated with the S3 Endpoint. *[default value: []]*
- `vpc_id` - The ID of the VPC in which the S3 endpoint will be used. *[default value: '']*

## Usage

Simple example:

```hcl
module "my_s3" {
  source               = "github.com/fscm/terraform-module-aws-s3"
  private_route_tables = ["rtb-012345a67b8901234"]
  public_route_tables  = ["rtb-0123a456b7890cdef"]
  vpc_id               = "vpc-0a12b345678cd9e0f"
}
```

Example with VPC:

```hcl
module "my_vpc" {
  source                 = "github.com/fscm/terraform-module-aws-vpc"
  cidr                   = "10.0.0.0/16"
  domain                 = "mydomain.tld"
  name                   = "vpc"
  prefix                 = "mycompany-"
  private_subnets_amount = "3"
  public_subnets_amount  = "3"
}

module "my_s3" {
  source               = "github.com/fscm/terraform-module-aws-s3"
  private_route_tables = "${module.my_vpc.private_route_table_id}"
  public_route_tables  = "${module.my_vpc.public_route_table_id}"
  vpc_id               = "${module.my_vpc.id}"
}
```

## Outputs

- `id` - **[type: string]** The ID of the S3 endpoint.
- `state` - **[type: string]** The state of the VPC endpoint.

## Contributing

1. Fork it!
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request

Please read the [CONTRIBUTING.md](CONTRIBUTING.md) file for more details on how
to contribute to this project.

## Versioning

This project uses [SemVer](http://semver.org/) for versioning. For the versions
available, see the [tags on this repository](https://github.com/fscm/terraform-module-aws-s3/tags).

## Authors

* **Frederico Martins** - [fscm](https://github.com/fscm)

See also the list of [contributors](https://github.com/fscm/terraform-module-aws-s3/contributors)
who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE)
file for details
