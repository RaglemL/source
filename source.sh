#!/bin/bash

# Create a new Google Cloud project
gcloud projects create avenue_z-source --name="Avenue_Z-Source"

# Set the current Google Cloud project
gcloud config set project avenue_z-source

# Create a new service account
gcloud iam service-accounts create Avenue_Z-Source --project=avenue_z-source

# Add IAM policy binding to the project
gcloud projects add-iam-policy-binding avenue_z-source --member="serviceAccount:Avenue_Z-Source@avenue_z-source.iam.gserviceaccount.com" --role="roles/editor"

# Get the unique ID of the service account
gcloud iam service-accounts describe Avenue_Z-Source@avenue_z-source.iam.gserviceaccount.com --project=avenue_z-source --format="value(uniqueId)"

# Create a service account key and save it to a JSON file
gcloud iam service-accounts keys create Avenue_Z-Source.json --iam-account=Avenue_Z-Source@avenue_z-source.iam.gserviceaccount.com --project=avenue_z-source

# Enable necessary Google services
gcloud services enable drive.googleapis.com sheets.googleapis.com admin.googleapis.com people.googleapis.com contacts.googleapis.com migrate.googleapis.com gmail.googleapis.com calendar-json.googleapis.com groupsmigration.googleapis.com groupssettings.googleapis.com tasks.googleapis.com --project=avenue_z-source

# Download the service account key JSON file
cloudshell download Avenue_Z-Source.json
