This folder contains solution for creation of PUB SUB topics in GCP via terraform

Pre-requisities:
1. Install terraform
2. Install gcloud
3. Create Project i.e. "autozonecasestudy" in GCP.
4. Set Project id using: gcloud config set project PROJECT_ID
5. Create a service account: gcloud iam service-accounts create sa-autozone-tf --description="Terraform Service account Auto Zone Demo" --display-name="Terraform Service Account"
6. Provide permission: gcloud projects add-iam-policy-binding autozonecasestudy --member="serviceAccount:sa-autozone-tf@autozonecasestudy.iam.gserviceaccount.com" --role="roles/editor"
7. Set environment variable set GCLOUD_KEYFILE_JSON=<path of json file> and value as path of json file.
8. Terraform state will be created in Solution3/terraform as we will run terraform init in terraform folder

Execution steps:-

1. Go to Solution3/terraform folder.
2. Run ./terraform.exe init to initialize.
3. Update the pubsub.tfvars file to create the number of pubsubtopics as per requirement. For testing purpose, it is having 2 topic details.
4. Run ./terraform.exe plan -var-file="pubsub.tfvars"
5. Run ./terraform.exe validate
6. Run ./terraform apply -var-file="pubsub.tfvars" -auto-approve

Infrastructure created via IAC:-

1. PubSub Topics created in the project passed via tfvar files

The Terraform resources will consists of following structure:

variable.tf - It contain the declarations for variables.
pubsub.tfvars - The file to pass the terraform variables values.
provider.tf - terraform provider
/modules - modules
main.tf - entry point
version.tf - version of providers to be used

Modules

For this solution, I have created a module:

pubsub: This module will create pub sub topics.


Testing details:

1. terraform-apply_log_file.txt: Contains terraform apply logs
2. terraform-destroy_log_file.txt: Contains terraform destroy logs
3. gcp_pubsub_snippet.png: Screenshot of pubsub created in gcp


