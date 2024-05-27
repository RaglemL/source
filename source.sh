#!/bin/bash

# Create a new Google Cloud project
echo "Creating GCP Project..."
gcloud projects create rollingsudsco-source --name="Rollingsudsco-Source"
sleep 5 # Adding a delay of 5 seconds

# Set the current Google Cloud project
echo "Setting GCP Project..."
gcloud config set project rollingsudsco-source
sleep 5 # Adding a delay of 5 seconds

# Provide yourself Organization Policy Administrator and Project Creator roles
echo "Assigning Roles..."
gcloud organizations add-iam-policy-binding 933898662270 --member="user:cloudasta@rollingsudsco.com" --role="roles/orgpolicy.policyAdmin"
sleep 5 # Adding a delay of 5 seconds
gcloud organizations add-iam-policy-binding 933898662270 --member="user:cloudasta@rollingsudsco.com" --role="roles/resourcemanager.projectCreator"
sleep 5 # Adding a delay of 5 seconds

# Disable the constraint iam.disableServiceAccountKeyCreation enforcement
echo "Disabling Policy Enforcement..."
gcloud resource-manager org-policies disable-enforce iam.disableServiceAccountKeyCreation --organization=933898662270
sleep 5 # Adding a delay of 5 seconds

# Create a new service account
echo "Creating Service Account..."
gcloud iam service-accounts create Rollingsudsco-Source --project=rollingsudsco-source
sleep 5 # Adding a delay of 5 seconds

# Add IAM policy binding to the project
echo "Adding Policies..."
gcloud projects add-iam-policy-binding rollingsudsco-source --member="serviceAccount:Rollingsudsco-Source@rollingsudsco-source.iam.gserviceaccount.com" --role="roles/editor"
sleep 5 # Adding a delay of 5 seconds

# Get the unique ID of the service account
echo "Obtaining Unique ID..."
gcloud iam service-accounts describe Rollingsudsco-Source@rollingsudsco-source.iam.gserviceaccount.com --project=rollingsudsco-source --format="value(uniqueId)"
sleep 5 # Adding a delay of 5 seconds

# Create a service account key and save it to a JSON file
echo "Creating JSON Key..."
gcloud iam service-accounts keys create Rollingsudsco-Source.json --iam-account=Rollingsudsco-Source@rollingsudsco-source.iam.gserviceaccount.com --project=rollingsudsco-source
sleep 5 # Adding a delay of 5 seconds

# Enable necessary Google services
echo "Enabling APIs..."