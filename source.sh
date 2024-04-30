#!/bin/bash

# Create a new Google Cloud project
gcloud projects create finn-partners-source --name="Finn-Partners-Source"

# Set the current Google Cloud project
gcloud config set project finn-partners-source

# Create a new service account
gcloud iam service-accounts create Finn-Partners-Source --project=finn-partners-source

# Add IAM policy binding to the project
gcloud projects add-iam-policy-binding finn-partners-source --member="serviceAccount:Finn-Partners-Source@finn-partners-source.iam.gserviceaccount.com" --role="roles/editor"

# Get the unique ID of the service account
gcloud iam service-accounts describe Finn-Partners-Source@finn-partners-source.iam.gserviceaccount.com --project=finn-partners-source --format="value(uniqueId)"

# Create a service account key and save it to a JSON file
gcloud iam service-accounts keys create Finn-Partners-Source.json --iam-account=Finn-Partners-Source@finn-partners-source.iam.gserviceaccount.com --project=finn-partners-source

# Enable necessary Google services
gcloud services enable drive.googleapis.com sheets.googleapis.com admin.googleapis.com people.googleapis.com contacts.googleapis.com migrate.googleapis.com gmail.googleapis.com calendar-json.googleapis.com groupsmigration.googleapis.com groupssettings.googleapis.com tasks.googleapis.com --project=finn-partners-source

# Download the service account key JSON file
cloudshell download Finn-Partners-Source.json
