#!/bin/bash

# Create a new Google Cloud project
gcloud projects create name-source --name="Name-Source"

# Set the current Google Cloud project
gcloud config set project name-source

# Create a new service account
gcloud iam service-accounts create Name-Source --project=name-source

# Add IAM policy binding to the project
gcloud projects add-iam-policy-binding name-source --member="serviceAccount:Name-Source@name-source.iam.gserviceaccount.com" --role="roles/editor"

# Get the unique ID of the service account
gcloud iam service-accounts describe Name-Source@name-source.iam.gserviceaccount.com --project=name-source --format="value(uniqueId)"

# Create a service account key and save it to a JSON file
gcloud iam service-accounts keys create Name-Source.json --iam-account=Name-Source@name-source.iam.gserviceaccount.com --project=name-source

# Enable necessary Google services
gcloud services enable drive.googleapis.com sheets.googleapis.com admin.googleapis.com people.googleapis.com contacts.googleapis.com migrate.googleapis.com gmail.googleapis.com calendar-json.googleapis.com groupsmigration.googleapis.com groupssettings.googleapis.com tasks.googleapis.com --project=name-source

# Download the service account key JSON file
cloudshell download Name-Source.json
