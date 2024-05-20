#!/bin/bash

# Create a new Google Cloud project
gcloud projects create salesdeskco-source-source --name="Salesdeskco-Source-Source"

# Set the current Google Cloud project
gcloud config set project salesdeskco-source-source

# Create a new service account
gcloud iam service-accounts create Salesdeskco-Source-Source --project=salesdeskco-source-source

# Add IAM policy binding to the project
gcloud projects add-iam-policy-binding salesdeskco-source-source --member="serviceAccount:Salesdeskco-Source-Source@salesdeskco-source-source.iam.gserviceaccount.com" --role="roles/editor"

# Get the unique ID of the service account
gcloud iam service-accounts describe Salesdeskco-Source-Source@salesdeskco-source-source.iam.gserviceaccount.com --project=salesdeskco-source-source --format="value(uniqueId)"

# Create a service account key and save it to a JSON file
gcloud iam service-accounts keys create Salesdeskco-Source-Source.json --iam-account=Salesdeskco-Source-Source@salesdeskco-source-source.iam.gserviceaccount.com --project=salesdeskco-source-source

# Enable necessary Google services
gcloud services enable drive.googleapis.com sheets.googleapis.com admin.googleapis.com people.googleapis.com contacts.googleapis.com migrate.googleapis.com gmail.googleapis.com calendar-json.googleapis.com groupsmigration.googleapis.com groupssettings.googleapis.com tasks.googleapis.com --project=salesdeskco-source-source

# Download the service account key JSON file
cloudshell download Salesdeskco-Source-Source.json
