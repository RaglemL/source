#!/bin/bash

# Create a new Google Cloud project
gcloud projects create go-rollingsuds-source --name="Go-Rollingsuds-Source"

# Set the current Google Cloud project
gcloud config set project go-rollingsuds-source

# Provide yourself Organization Policy Administrator and Project Creator roles
gcloud organizations add-iam-policy-binding 903894156066 --member="user:cloudasta@go-rollingsuds.com" --role="roles/orgpolicy.policyAdmin"
gcloud organizations add-iam-policy-binding 903894156066 --member="user:cloudasta@go-rollingsuds.com" --role="roles/resourcemanaget.projectCreator"

# Disable the constraint iam.disableServiceAccountKeyCreation enforcement
gcloud resource-manager org-policies disable-enforce iam.disableServiceAccountKeyCreation --organization=903894156066

# Create a new service account
gcloud iam service-accounts create Go-Rollingsuds-Source --project=go-rollingsuds-source

# Add IAM policy binding to the project
gcloud projects add-iam-policy-binding go-rollingsuds-source --member="serviceAccount:Go-Rollingsuds-Source@go-rollingsuds-source.iam.gserviceaccount.com" --role="roles/editor"

# Get the unique ID of the service account
gcloud iam service-accounts describe Go-Rollingsuds-Source@go-rollingsuds-source.iam.gserviceaccount.com --project=go-rollingsuds-source --format="value(uniqueId)"

# Create a service account key and save it to a JSON file
gcloud iam service-accounts keys create Go-Rollingsuds-Source.json --iam-account=Go-Rollingsuds-Source@go-rollingsuds-source.iam.gserviceaccount.com --project=go-rollingsuds-source

# Enable necessary Google services
gcloud services enable drive.googleapis.com sheets.googleapis.com admin.googleapis.com people.googleapis.com contacts.googleapis.com migrate.googleapis.com gmail.googleapis.com calendar-json.googleapis.com groupsmigration.googleapis.com groupssettings.googleapis.com tasks.googleapis.com --project=go-rollingsuds-source

# Download the service account key JSON file
cloudshell download Go-Rollingsuds-Source.json

# Enable the constraint iam.disableServiceAccountKeyCreation enforcement
gcloud resource-manager org-policies enable-enforce iam.disableServiceAccountKeyCreation --organization=
