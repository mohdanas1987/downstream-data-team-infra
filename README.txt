STRADA Downstream Team - Terraform + Azure DevOps
===================================================
This repo turns your manual Azure Portal build into a repeatable, pipeline-driven deployment.

Folders
- Strada-terraform_repo/        : Azure infra (RG, VNet/Subnets, ADLS Gen2, Key Vault, SQL, ADF, Databricks)
- Strada-terraform_repo/environments/   : Environment variable files (dev/tst/prd)
- Strada-terraform_repo\modules/: Reusable modules(databricks, datafactory, keyvault, networking,sql,storage)
- Databricks Unity Catalog automation included in root main.tf
- azure-pipelines.yml : Pipeline (Validate -> Plan -> Apply)
- architecture_diagram = Azure Databricks.pdf

Quick Run (Azure DevOps)
1) Create a service connection: 'service-conn-tf-deployer' (ARM).
2) Create a tfstate SA + container; set pipeline variables:
   TFSTATE_RG, TFSTATE_SA, TFSTATE_CONTAINER, ENV_NAME (dev/tst/prd)
3) Optional: in Key Vault 'kv-dt-<env>-team' create secret 'databricks-pat'.
4) Run the pipeline with ENV_NAME=prd (or dev/tst).

Security/Networking
- RBAC-first (Key Vault uses RBAC).
- Simple VNet with two subnets (databricks/platform).
- Roadmap: VNet injection, Private Endpoints, Private DNS, AAD tokens for UC & SQL.
