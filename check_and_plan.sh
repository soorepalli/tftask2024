#!/bin/bash

# Directory containing tfvars files
TFVARS_DIR="users"

# Terraform state directory
STATE_DIR="terraform-state"

# Initialize a flag to check changes
CHANGES_DETECTED=false

# Function to run Terraform plan
run_terraform_plan() {
  USER_FILE=$1
  echo "Changes detected in ${USER_FILE}. Running Terraform plan..."
  
  terraform init -backend-config="${TFVARS_DIR}/${USER_FILE}_backend.tf"
  terraform plan -var-file="${TFVARS_DIR}/${USER_FILE}.tfvars"
}

# Check for changes in .tfvars files
for TFVARS_FILE in ${TFVARS_DIR}/*.tfvars; do
  USER=$(basename ${TFVARS_FILE} .tfvars)

  # Check if the .tfvars file has been modified since the last commit
  if git diff --quiet HEAD ${TFVARS_FILE}; then
    echo "No changes detected in ${USER}.tfvars"
  else
    CHANGES_DETECTED=true
    run_terraform_plan ${USER}
  fi
done

# Final output
if [ "${CHANGES_DETECTED}" = false ]; then
  echo "No changes detected in any .tfvars files. Terraform plan not executed."
else
  echo "Terraform plan executed for changed files."
fi
