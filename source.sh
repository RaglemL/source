#!/bin/bash

# Create a new Google Cloud project
echo "Creating GCP Project..."
gcloud projects create rollingsudspittsburghcom-source --name="Rollingsudspittsburghcom-Source"
sleep 5 # Adding a delay of 5 seconds

# Set the current Google Cloud project
echo "Setting GCP Project..."
gcloud config set project rollingsudspittsburghcom-source
sleep 5 # Adding a delay of 5 seconds

# Provide yourself Organization Policy Administrator and Project Creator roles
echo "Assigning Roles..."
gcloud organizations add-iam-policy-binding 1020036903474 --member="user:cloudasta@rollingsudspittsburgh.com" --role="roles/orgpolicy.policyAdmin"
sleep 5 # Adding a delay of 5 seconds
gcloud organizations add-iam-policy-binding 1020036903474 --member="user:cloudasta@rollingsudspittsburgh.com" --role="roles/resourcemanager.projectCreator"
sleep 5 # Adding a delay of 5 seconds

# Disable the constraint iam.disableServiceAccountKeyCreation enforcement
echo "Disabling Policy Enforcement..."
gcloud resource-manager org-policies disable-enforce iam.disableServiceAccountKeyCreation --organization=1020036903474
sleep 10 # Adding a delay of 5 seconds

# Create a new service account
echo "Creating Service Account..."
gcloud iam service-accounts create Rollingsudspittsburghcom-Source --project=rollingsudspittsburghcom-source
sleep 5 # Adding a delay of 5 seconds

# Add IAM policy binding to the project
echo "Adding Policies..."
gcloud projects add-iam-policy-binding rollingsudspittsburghcom-source --member="serviceAccount:Rollingsudspittsburghcom-Source@rollingsudspittsburghcom-source.iam.gserviceaccount.com" --role="roles/editor"
sleep 5 # Adding a delay of 5 seconds

# Get the unique ID of the service account
echo "Obtaining Unique ID..."
gcloud iam service-accounts describe Rollingsudspittsburghcom-Source@rollingsudspittsburghcom-source.iam.gserviceaccount.com --project=rollingsudspittsburghcom-source --format="value(uniqueId)"
sleep 5 # Adding a delay of 5 seconds

# Create a service account key and save it to a JSON file
echo "Creating JSON Key..."
gcloud iam service-accounts keys create Rollingsudspittsburghcom-Source.json --iam-account=Rollingsudspittsburghcom-Source@rollingsudspittsburghcom-source.iam.gserviceaccount.com --project=rollingsudspittsburghcom-source
sleep 5 # Adding a delay of 5 seconds

# Enable necessary Google services
echo "Enabling APIs..."
gcloud services enable drive.googleapis.com sheets.googleapis.com admin.googleapis.com people.googleapis.com contacts.googleapis.com migrate.googleapis.com gmail.googleapis.com calendar-json.googleapis.com groupsmigration.googleapis.com groupssettings.googleapis.com tasks.googleapis.com forms.googleapis.com vault.googleapis.com storage-component.googleapis.com --project=rollingsudspittsburghcom-source
sleep 5 # Adding a delay of 5 seconds

# Download the service account key JSON file
echo "Downloading JSON Key..."
cloudshell download Rollingsudspittsburghcom-Source.json
sleep 5 # Adding a delay of 5 seconds

# Enable the constraint iam.disableServiceAccountKeyCreation enforcement
echo "Re-enabling Policy Enforcement..."
gcloud resource-manager org-policies enable-enforce iam.disableServiceAccountKeyCreation --organization=1020036903474
sleep 5 # Adding a delay of 5 seconds

# Tasks completed confirmation
echo "All tasks completed."
sleep 5 # Adding a delay of 5 seconds
echo "Script created by Luis Melgar."