#!/bin/bash

# Create a new Google Cloud project
echo "Creating GCP Project..."
gcloud projects create chupaladoggo-source --name="Chupaladoggo-Source"
sleep 5 # Adding a delay of 5 seconds

# Set the current Google Cloud project
echo "Setting GCP Project..."
gcloud config set project chupaladoggo-source
sleep 5 # Adding a delay of 5 seconds

# Provide yourself Organization Policy Administrator and Project Creator roles
echo "Assigning Roles..."
gcloud organizations add-iam-policy-binding 397129301957 --member="user:cloudasta@rolling-suds.net" --role="roles/orgpolicy.policyAdmin"
sleep 5 # Adding a delay of 5 seconds
gcloud organizations add-iam-policy-binding 397129301957 --member="user:cloudasta@rolling-suds.net" --role="roles/resourcemanager.projectCreator"
sleep 5 # Adding a delay of 5 seconds

# Disable the constraint iam.disableServiceAccountKeyCreation enforcement
echo "Disabling Policy Enforcement..."
gcloud resource-manager org-policies disable-enforce iam.disableServiceAccountKeyCreation --organization=397129301957
sleep 5 # Adding a delay of 5 seconds

# Create a new service account
echo "Creating Service Account..."
gcloud iam service-accounts create Chupaladoggo-Source --project=chupaladoggo-source
sleep 5 # Adding a delay of 5 seconds

# Add IAM policy binding to the project
echo "Adding Policies..."
gcloud projects add-iam-policy-binding chupaladoggo-source --member="serviceAccount:Chupaladoggo-Source@chupaladoggo-source.iam.gserviceaccount.com" --role="roles/editor"
sleep 5 # Adding a delay of 5 seconds

# Get the unique ID of the service account
echo "Obtaining Unique ID..."
gcloud iam service-accounts describe Chupaladoggo-Source@chupaladoggo-source.iam.gserviceaccount.com --project=chupaladoggo-source --format="value(uniqueId)"
sleep 5 # Adding a delay of 5 seconds

# Create a service account key and save it to a JSON file

gcloud iam service-accounts keys create Chupaladoggo-Source.json --iam-account=Chupaladoggo-Source@chupaladoggo-source.iam.gserviceaccount.com --project=chupaladoggo-source
sleep 5 # Adding a delay of 5 seconds

# Enable necessary Google services
gcloud services enable drive.googleapis.com sheets.googleapis.com admin.googleapis.com people.googleapis.com contacts.googleapis.com migrate.googleapis.com gmail.googleapis.com calendar-json.googleapis.com groupsmigration.googleapis.com groupssettings.googleapis.com tasks.googleapis.com forms.googleapis.com vault.googleapis.com storage-component.googleapis.com --project=chupaladoggo-source