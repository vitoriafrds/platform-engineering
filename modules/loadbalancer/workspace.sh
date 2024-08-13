#!/bin/bash

#6. Crie um ambiente de dev e um de prod
terraform workspace new dev || echo "Workspace 'dev' already exists"
terraform workspace new prod || echo "Workspace 'prod' already exists"

apply_workspace() {
    local workspace=$1
    terraform workspace select $workspace
    terraform apply -auto-approve
}

apply_workspace dev
apply_workspace prod

