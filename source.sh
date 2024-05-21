#!/bin/bash

# Create a new Google Cloud project
gcloud projects create mysalesdeskco-source --name="Mysalesdeskco-Source"

# Set the current Google Cloud project
gcloud config set project mysalesdeskco-source

# Create a new service account
gcloud iam service-accounts create Mysalesdeskco-Source --project=mysalesdeskco-source

# Add IAM policy binding to the project
gcloud projects add-iam-policy-binding mysalesdeskco-source --member="serviceAccount:Mysalesdeskco-Source@mysalesdeskco-source.iam.gserviceaccount.com" --role="roles/editor"

# Get the unique ID of the service account
gcloud iam service-accounts describe Mysalesdeskco-Source@mysalesdeskco-source.iam.gserviceaccount.com --project=mysalesdeskco-source --format="value(uniqueId)"

# Create a service account key and save it to a JSON file
gcloud iam service-accounts keys create Mysalesdeskco-Source.json --iam-account=Mysalesdeskco-Source@mysalesdeskco-source.iam.gserviceaccount.com --project=mysalesdeskco-source

# Enable necessary Google services
gcloud services enable drive.googleapis.com sheets.googleapis.com admin.googleapis.com people.googleapis.com contacts.googleapis.com migrate.googleapis.com gmail.googleapis.com calendar-json.googleapis.com groupsmigration.googleapis.com groupssettings.googleapis.com tasks.googleapis.com --project=mysalesdeskco-source

# Download the service account key JSON file
cloudshell download Mysalesdeskco-Source.json
