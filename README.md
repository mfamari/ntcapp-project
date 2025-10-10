# ntcapp-project
Terraform CI/CD GitHub Actions Workflow

This repository includes a GitHub Actions workflow to automate Terraform tasks, including validation, formatting, security scanning, cost analysis, and deployment. It is designed for fast feedback and safe automatic apply to the main branch.

🚀 Workflow Overview

The workflow runs on push and pull request events to the main branch and can also be triggered manually. It performs the following tasks:

Terraform Validation

Checks Terraform files formatting (terraform fmt).

Validates Terraform configuration (terraform validate).

Security & Linting Scans

TFLint: Terraform code linter.

tfsec: Security scanner for Terraform.

Checkov: Infrastructure-as-code security scanner.

Scan reports are uploaded as workflow artifacts (.sarif and .json).

Terraform Plan & Apply

Generates a Terraform plan and uploads it as an artifact.

Automatically applies the plan only on the main branch.

Cost Analysis with Infracost

Converts Terraform plan to JSON (terraform show -json).

Runs Infracost to estimate cloud costs.

Posts cost breakdown as a PR comment (if applicable).

Uploads infracost.json as an artifact for reference.

⚙️ Workflow Details

Workflow file: .github/workflows/terraform-ci.yml

Key Environment Variables
Variable	Description
TF_WORKING_DIR	Path to the Terraform directory (default: ./terraform)
TF_PLAN_FILE	Terraform plan filename (default: plan.binary)
AWS_ACCESS_KEY_ID	AWS access key (from repository secrets)
AWS_SECRET_ACCESS_KEY	AWS secret key (from repository secrets)
AWS_REGION	AWS region (default: us-east-1)
INFRACOST_API_KEY	Infracost API key (from repository secrets)
GITHUB_TOKEN	GitHub token for posting PR comments (provided automatically)
📦 Artifacts

The workflow uploads the following artifacts:

terraform-scan-reports

tflint.sarif

tfsec.sarif

checkov.json

terraform-plan

plan.binary

infracost-report

infracost.json

Artifacts can be downloaded from the Actions tab in GitHub after workflow execution.

📝 PR Comments

If the workflow runs on a pull request, it automatically posts a cost estimate comment from Infracost to the PR, including:

Total estimated cost

Monthly cost per resource

Changes compared to the base branch

🔧 How to Use

Ensure your repository contains a Terraform project under the directory defined in TF_WORKING_DIR (default ./terraform).

Add the following repository secrets:

AWS_ACCESS_KEY_ID

AWS_SECRET_ACCESS_KEY

INFRACOST_API_KEY

Push changes to a branch or open a pull request.

The workflow will automatically run validation, scans, plan, and cost analysis.

Merge to main to automatically apply the Terraform plan.

📚 References

Terraform GitHub Actions

TFLint

tfsec

Checkov

Infracost CLI

<img width="1024" height="1536" alt="image" src="https://github.com/user-attachments/assets/5a4c9d85-60d5-4150-ad43-549bb937a235" />

