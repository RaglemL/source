#!/bin/bash

# Create a new Google Cloud project
gcloud projects create test2-source --name="Test2-Source"

# Set the current Google Cloud project
gcloud config set project test2-source

# Create a new service account
gcloud iam service-accounts create Test2-Source --project=test2-source

# Add IAM policy binding to the project
gcloud projects add-iam-policy-binding test2-source --member="serviceAccount:Test2-Source@test2-source.iam.gserviceaccount.com" --role="roles/editor"

# Get the unique ID of the service account
gcloud iam service-accounts describe Test2-Source@test2-source.iam.gserviceaccount.com --project=test2-source --format="value(uniqueId)"

# Create a service account key and save it to a JSON file
gcloud iam service-accounts keys create Test2-Source.json --iam-account=Test2-Source@test2-source.iam.gserviceaccount.com --project=test2-source

# Enable necessary Google services
gcloud services enable drive.googleapis.com sheets.googleapis.com admin.googleapis.com people.googleapis.com contacts.googleapis.com migrate.googleapis.com gmail.googleapis.com calendar-json.googleapis.com groupsmigration.googleapis.com groupssettings.googleapis.com tasks.googleapis.com --project=test2-source

# Download the service account key JSON file
cloudshell download Test2-Source.json
