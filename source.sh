#!/bin/bash

# Create a new Google Cloud project
gcloud projects create go-rollingsuds-source --name="Go-Rollingsuds-Source"
sleep 5 # Adding a delay of 5 seconds

# Set the current Google Cloud project
gcloud config set project go-rollingsuds-source
sleep 5 # Adding a delay of 5 seconds

# Provide yourself Organization Policy Administrator and Project Creator roles
gcloud organizations add-iam-policy-binding 903894156066 --member="user:cloudasta@go-rollingsuds.com" --role="roles/orgpolicy.policyAdmin"
gcloud organizations add-iam-policy-binding 903894156066 --member="user:cloudasta@go-rollingsuds.com" --role="roles/resourcemanaget.projectCreator"
sleep 5 # Adding a delay of 5 seconds

# Disable the constraint iam.disableServiceAccountKeyCreation enforcement
gcloud resource-manager org-policies disable-enforce iam.disableServiceAccountKeyCreation --organization=903894156066
sleep 5 # Adding a delay of 5 seconds

# Create a new service account
gcloud iam service-accounts create Go-Rollingsuds-Source --project=go-rollingsuds-source
sleep 5 # Adding a delay of 5 seconds

# Add IAM policy binding to the project
gcloud projects add-iam-policy-binding go-rollingsuds-source --member="serviceAccount:Go-Rollingsuds-Source@go-rollingsuds-source.iam.gserviceaccount.com" --role="roles/editor"
sleep 5 # Adding a delay of 5 seconds

# Get the unique ID of the service account
gcloud iam service-accounts describe Go-Rollingsuds-Source@go-rollingsuds-source.iam.gserviceaccount.com --project=go-rollingsuds-source --format="value(uniqueId)"
sleep 5 # Adding a delay of 5 seconds

# Create a service account key and save it to a JSON file
gcloud iam service-accounts keys create Go-Rollingsuds-Source.json --iam-account=Go-Rollingsuds-Source@go-rollingsuds-source.iam.gserviceaccount.com --project=go-rollingsuds-source
sleep 5 # Adding a delay of 5 seconds

# Enable necessary Google services
gcloud services enable drive.googleapis.com sheets.googleapis.com admin.googleapis.com people.googleapis.com contacts.googleapis.com migrate.googleapis.com gmail.googleapis.com calendar-json.googleapis.com groupsmigration.googleapis.com groupssettings.googleapis.com tasks.googleapis.com --project=go-rollingsuds-source
sleep 5 # Adding a delay of 5 seconds

# Download the service account key JSON file
cloudshell download Go-Rollingsuds-Source.json
sleep 5 # Adding a delay of 5 seconds

# Enable the constraint iam.disableServiceAccountKeyCreation enforcement
gcloud resource-manager org-policies enable-enforce iam.disableServiceAccountKeyCreation --organization=
sleep 5 # Adding a delay of 5 seconds
