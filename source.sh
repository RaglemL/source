#!/bin/bash

# Create a new Google Cloud project
gcloud projects create rollingsuds-source --name="Rollingsuds-Source"

# Set the current Google Cloud project
gcloud config set project rollingsuds-source

# Create a new service account
gcloud iam service-accounts create Rollingsuds-Source --project=rollingsuds-source

# Add IAM policy binding to the project
gcloud projects add-iam-policy-binding rollingsuds-source --member="serviceAccount:Rollingsuds-Source@rollingsuds-source.iam.gserviceaccount.com" --role="roles/editor"

# Get the unique ID of the service account
gcloud iam service-accounts describe Rollingsuds-Source@rollingsuds-source.iam.gserviceaccount.com --project=rollingsuds-source --format="value(uniqueId)"

# Create a service account key and save it to a JSON file
gcloud iam service-accounts keys create Rollingsuds-Source.json --iam-account=Rollingsuds-Source@rollingsuds-source.iam.gserviceaccount.com --project=rollingsuds-source

# Enable necessary Google services
gcloud services enable drive.googleapis.com sheets.googleapis.com admin.googleapis.com people.googleapis.com contacts.googleapis.com migrate.googleapis.com gmail.googleapis.com calendar-json.googleapis.com groupsmigration.googleapis.com groupssettings.googleapis.com tasks.googleapis.com --project=rollingsuds-source

# Download the service account key JSON file
cloudshell download Rollingsuds-Source.json
