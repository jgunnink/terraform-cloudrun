# Terraform Cloud Run example files

This repo contains sample code for deploying a serverless cloud run app using infrastructure as code. It makes use of
Terraform to accomplish this.

## Initialisation

- Run `terraform init -backend-config=dev.tfbackend`

## Planning

- Run `terraform plan -var-file=dev.tfvars`

## Apply

- Run `terraform apply -var-file=dev.tfvars`

## Cleanup / Destruction

- Run `terraform destroy -var-file=dev.tfvars`
