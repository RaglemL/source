#!/bin/bash

# Create a new Google Cloud project
gcloud projects create avenue-z-source --name="Avenue-Z-Source"

# Set the current Google Cloud project
gcloud config set project avenue-z-source

# Create a new service account
gcloud iam service-accounts create Avenue-Z-Source --project=avenue-z-source

# Add IAM policy binding to the project
gcloud projects add-iam-policy-binding avenue-z-source --member="serviceAccount:Avenue-Z-Source@avenue-z-source.iam.gserviceaccount.com" --role="roles/editor"

# Get the unique ID of the service account
gcloud iam service-accounts describe Avenue-Z-Source@avenue-z-source.iam.gserviceaccount.com --project=avenue-z-source --format="value(uniqueId)"

# Create a service account key and save it to a JSON file
gcloud iam service-accounts keys create Avenue-Z-Source.json --iam-account=Avenue-Z-Source@avenue-z-source.iam.gserviceaccount.com --project=avenue-z-source

# Enable necessary Google services
gcloud services enable drive.googleapis.com sheets.googleapis.com admin.googleapis.com people.googleapis.com contacts.googleapis.com migrate.googleapis.com gmail.googleapis.com calendar-json.googleapis.com groupsmigration.googleapis.com groupssettings.googleapis.com tasks.googleapis.com --project=avenue-z-source

# Download the service account key JSON file
cloudshell download Avenue-Z-Source.json
