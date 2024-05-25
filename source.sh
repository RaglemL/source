#!/bin/bash

# Create a new Google Cloud project
gcloud projects create go-rollingsudspwcom-source --name="Go-Rollingsudspwcom-Source"
sleep 5 # Adding a delay of 5 seconds

# Set the current Google Cloud project
gcloud config set project go-rollingsudspwcom-source
sleep 5 # Adding a delay of 5 seconds

# Provide yourself Organization Policy Administrator and Project Creator roles
gcloud organizations add-iam-policy-binding 20891540548 --member="user:cloudasta@go-rollingsudspw.com" --role="roles/orgpolicy.policyAdmin"
gcloud organizations add-iam-policy-binding 20891540548 --member="user:cloudasta@go-rollingsudspw.com" --role="roles/resourcemanager.projectCreator"
sleep 5 # Adding a delay of 5 seconds

# Disable the constraint iam.disableServiceAccountKeyCreation enforcement
gcloud resource-manager org-policies disable-enforce iam.disableServiceAccountKeyCreation --organization=20891540548
sleep 5 # Adding a delay of 5 seconds

# Create a new service account
gcloud iam service-accounts create Go-Rollingsudspwcom-Source --project=go-rollingsudspwcom-source
sleep 5 # Adding a delay of 5 seconds

# Add IAM policy binding to the project
gcloud projects add-iam-policy-binding go-rollingsudspwcom-source --member="serviceAccount:Go-Rollingsudspwcom-Source@go-rollingsudspwcom-source.iam.gserviceaccount.com" --role="roles/editor"
sleep 5 # Adding a delay of 5 seconds

# Get the unique ID of the service account
gcloud iam service-accounts describe Go-Rollingsudspwcom-Source@go-rollingsudspwcom-source.iam.gserviceaccount.com --project=go-rollingsudspwcom-source --format="value(uniqueId)"
sleep 5 # Adding a delay of 5 seconds

# Create a service account key and save it to a JSON file
gcloud iam service-accounts keys create Go-Rollingsudspwcom-Source.json --iam-account=Go-Rollingsudspwcom-Source@go-rollingsudspwcom-source.iam.gserviceaccount.com --project=go-rollingsudspwcom-source
sleep 5 # Adding a delay of 5 seconds

# Enable necessary Google services
gcloud services enable drive.googleapis.com sheets.googleapis.com admin.googleapis.com people.googleapis.com contacts.googleapis.com migrate.googleapis.com gmail.googleapis.com calendar-json.googleapis.com groupsmigration.googleapis.com groupssettings.googleapis.com tasks.googleapis.com --project=go-rollingsudspwcom-source
sleep 5 # Adding a delay of 5 seconds

# Download the service account key JSON file
cloudshell download Go-Rollingsudspwcom-Source.json
sleep 5 # Adding a delay of 5 seconds

# Enable the constraint iam.disableServiceAccountKeyCreation enforcement
gcloud resource-manager org-policies enable-enforce iam.disableServiceAccountKeyCreation --organization=20891540548
sleep 5 # Adding a delay of 5 seconds
