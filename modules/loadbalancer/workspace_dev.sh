#!/bin/bash

apply_workspace() {
    local workspace=$1
    terraform workspace select $workspace
    terraform init
    terraform apply -auto-approve
    wait $!
}

#6. Crie um ambiente de dev e um de prod
terraform workspace new dev || echo "Workspace 'dev' already exists"

apply_workspace dev