# ecr changelog

## 3.1.0 (October 26, 2022)

- Adding a new optional variable `lifecycle_policy_configuration` to control some aspects of the lifecycle policy.
- Adding a new attribute to the `lifecycle_policy_configuration`, `total_image_limit` that will control the total image limit for a given ECR. Default is 15.

## 3.0.0 (August 08, 2022)

- Add `image_tag_mutability` which defaults to `IMMUTABLE`. This prevents image tags from being overwritten and 
helps to keep a reliable mechanism to track and uniquely identify images.

## 2.2.0 (June 16, 2021)

- Add repo_name as output

## 2.1.0 (March 18, 2021)

- Add `enable_lambda_access` input variable.
- Allow the lambda service to download images when `enable_lambda_access` is set to true

## 2.0.0 (March 12, 2021)

- Add `additional_aws_account_ids` input variable.
- Allow module to add other accounts that has access to the repo.
- The account the repo lives in always has access to repo.

## 1.0.0 (January 22, 2021)

- Beginning version tracking of the module.
