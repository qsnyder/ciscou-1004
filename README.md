# CISCOU-1004

This repository will serve as the collection point for all code used for the CISCOU-1004 presentation at CLUS in Las Vegas, 2023.  After the initial commit of these files, they may or may not be maintained as a part of another session, however, any updates will be documented in a CHANGELOG within the repository.

## Prerequisites

These Terraform files are built to interact with an ACI fabric, and preconfigured to connect to an instance of the ACI 5.2 reservable sandbox within DevNet.  This sandbox can be reserved by following (this hyperlink)[https://devnetsandbox.cisco.com/RM/Diagram/Index/4eaa9878-3e74-4105-b26a-bd83eeaa6cd9?diagramType=Topology].  However, it is possible to modify the Terraform to point towards any arbitrary fabric, assuming that is reachable by the workstation on which you will execute the Terraform HCL files.

Additionally, Terraform will need to be downloaded (the link to download is found (here)[http://terraform.io/downloads]) and ideally installed to `$PATH` to ensure that it can be found by the shell easily.  Alternatively, a software such as (`tfenv`)[https://github.com/tfutils/tfenv] can be used to facilitate the easy switching of Terraform versions.  These files have been verified to be function on Terraform 1.4.5.

## Usage

Each of these folders is a self-contained project within Terraform and can be executed without any editing of any values.  If edited values are desired, the approrpriate names or values can be edited in either `main.tf` or `variables.tf` within the specific project of choice.  

Once the values have been edited, the Terraform configuration can be applied through the following steps:

```bash
terraform init
terraform plan -out tf.plan
terraform apply "tf.plan"
```

### `terraform init`

This step will download the provider declared in the top of the `main.tf` file and add it to a `.terraform` directory within the project folder.  It will also create a `.terraform.lock.hcl` which will lock the provider version downloaded within the project.

### `terraform plan -out tf.plan`

This step will combine all `.tf` files to create a single set of steps that need to be applied on the remote device.  If this is a secondary run of the project, this step will also compare the existing stored state to validate the requested changes against the state that Terraform is aware of and make the appropriate changes as necessary.  These steps will then be saved to a "plan" file, which will be executed by the apply step.  This ensures that any changes made to the Terraform files after the plan was created will not impact the subsequent configuration done in the `apply` step

### `terraform apply "tf.plan"

This step will take the perscriptive steps created within the `plan` step and perform the desired configuration changes on the endpoint target of the Terraform file.  Depending on connectivity and size of changes to be made, this can take a bit of time to perform.

### `terraform destroy` or `terraform destroy -auto-approve`

This step will read the configuration in the Terraform HCL files and perform the removal of the configuration defined.  The addition of the `-auto-approve` flag will remove the confirmation prompt from the process (i.e. will destroy the changes immediately).

## Summary of included folders

- **01-intro:** an introduction to Terraform in general with a single HCL file, no variables.  Creates a single ACI tenant
- **02-vars:** contains the same changes as the previous folder, but uses a `variables.tf` to remove the username, password, and URL of the fabric, as well as the tenant name from the `main.tf` file.
- **03-vars-prompt:** demonstrates that if a `default` value is not declared within a variable that the user will be prompted to add in the value
- **04-vars-secret:** demonstrates the use of the `sensitive = true` argument within a variable declaration block, which will hide the output of that value on the screen when a Terraform `plan` or `apply` action is performed
- **05-network:** demonstrates a larger automation of an ACI tenant construct
- **06-network-unordered:** contains the similar set of configuration as the previous folder, but in an order that would not work if it was applied top-to-bottom, due to nesting requirements.  Illustrates that Terraform will apply configuration changes in the correct order, regardless of how it is written within the HCL file(s)

### A note about the `graph-command.info` file

This file contains a Terraform command which, when invoked (assuming the correct software is installed on your workstation) will consume the Terraform HCL file(s) and produce a picture of how the components of the desired Terraform configuration are related.  This is useful to demonstrate the "end state declarative" nature of Terraform

## Questions/Comments

Please reach out to me via DM on Twitter (@qsnyder)[https://twitter.com/qsnyder]
