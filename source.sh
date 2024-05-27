#!/bin/bash

# Create a new Google Cloud project
echo "Creating GCP Project..."
gcloud projects create rollingsudspwnet-source --name="Rollingsudspwnet-Source"
sleep 5 # Adding a delay of 5 seconds

# Set the current Google Cloud project
echo "Setting GCP Project..."
gcloud config set project rollingsudspwnet-source
sleep 5 # Adding a delay of 5 seconds

# Provide yourself Organization Policy Administrator and Project Creator roles
echo "Assigning Roles..."
gcloud organizations add-iam-policy-binding 1054244104017 --member="user:cloudasta@rollingsudspw.net" --role="roles/orgpolicy.policyAdmin"
sleep 5 # Adding a delay of 5 seconds
gcloud organizations add-iam-policy-binding 1054244104017 --member="user:cloudasta@rollingsudspw.net" --role="roles/resourcemanager.projectCreator"
sleep 5 # Adding a delay of 5 seconds

# Disable the constraint iam.disableServiceAccountKeyCreation enforcement
echo "Disabling Policy Enforcement..."
gcloud resource-manager org-policies disable-enforce iam.disableServiceAccountKeyCreation --organization=1054244104017
sleep 5 # Adding a delay of 5 seconds

# Create a new service account
echo "Creating Service Account..."
gcloud iam service-accounts create Rollingsudspwnet-Source --project=rollingsudspwnet-source
sleep 5 # Adding a delay of 5 seconds

# Add IAM policy binding to the project
echo "Adding Policies..."
gcloud projects add-iam-policy-binding rollingsudspwnet-source --member="serviceAccount:Rollingsudspwnet-Source@rollingsudspwnet-source.iam.gserviceaccount.com" --role="roles/editor"
sleep 5 # Adding a delay of 5 seconds

# Get the unique ID of the service account
echo "Obtaining Unique ID..."
gcloud iam service-accounts describe Rollingsudspwnet-Source@rollingsudspwnet-source.iam.gserviceaccount.com --project=rollingsudspwnet-source --format="value(uniqueId)"
sleep 5 # Adding a delay of 5 seconds

# Create a service account key and save it to a JSON file
echo "Creating JSON Key..."
gcloud iam service-accounts keys create Rollingsudspwnet-Source.json --iam-account=Rollingsudspwnet-Source@rollingsudspwnet-source.iam.gserviceaccount.com --project=rollingsudspwnet-source
sleep 5 # Adding a delay of 5 seconds

# Enable necessary Google services
echo "Enabling APIs..."
gcloud services enable drive.googleapis.com sheets.googleapis.com admin.googleapis.com people.googleapis.com contacts.googleapis.com migrate.googleapis.com gmail.googleapis.com calendar-json.googleapis.com groupsmigration.googleapis.com groupssettings.googleapis.com tasks.googleapis.com forms.googleapis.com vault.googleapis.com storage-component.googleapis.com --project=rollingsudspwnet-source
sleep 5 # Adding a delay of 5 seconds

# Download the service account key JSON file
echo "Downloading JSON Key..."
cloudshell download Rollingsudspwnet-Source.json
sleep 5 # Adding a delay of 5 seconds

# Enable the constraint iam.disableServiceAccountKeyCreation enforcement
echo "Re-enabling Policy Enforcement..."
gcloud resource-manager org-policies enable-enforce iam.disableServiceAccountKeyCreation --organization=1054244104017
sleep 5 # Adding a delay of 5 seconds

# Tasks completed confirmation
echo "All tasks completed."
sleep 5 # Adding a delay of 5 seconds
echo "Script created by Luis Melgar."