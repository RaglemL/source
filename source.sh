#!/bin/bash

# Create a new Google Cloud project
gcloud projects create lualmedele-source --name="Lualmedele-Source"

# Set the current Google Cloud project
gcloud config set project lualmedele-source

# Create a new service account
gcloud iam service-accounts create Lualmedele-Source --project=lualmedele-source

# Add IAM policy binding to the project
gcloud projects add-iam-policy-binding lualmedele-source --member="serviceAccount:Lualmedele-Source@lualmedele-source.iam.gserviceaccount.com" --role="roles/editor"

# Get the unique ID of the service account
gcloud iam service-accounts describe Lualmedele-Source@lualmedele-source.iam.gserviceaccount.com --project=lualmedele-source --format="value(uniqueId)"

# Create a service account key and save it to a JSON file
gcloud iam service-accounts keys create Lualmedele-Source.json --iam-account=Lualmedele-Source@lualmedele-source.iam.gserviceaccount.com --project=lualmedele-source

# Enable necessary Google services
gcloud services enable drive.googleapis.com sheets.googleapis.com admin.googleapis.com people.googleapis.com contacts.googleapis.com migrate.googleapis.com gmail.googleapis.com calendar-json.googleapis.com groupsmigration.googleapis.com groupssettings.googleapis.com tasks.googleapis.com --project=lualmedele-source

# Download the service account key JSON file
cloudshell download Lualmedele-Source.json
