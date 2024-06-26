#!/bin/bash

# Create a new Google Cloud project

gcloud projects create macarron-source --name="Macarron-Source"

sleep 5 # Adding a delay of 5 seconds

# Set the current Google Cloud project

gcloud config set project macarron-source

sleep 5 # Adding a delay of 5 seconds

# Provide yourself Organization Policy Administrator and Project Creator roles

gcloud organizations add-iam-policy-binding 397129301957 --member="user:cloudasta@rolling-suds.net" --role="roles/orgpolicy.policyAdmin"

gcloud organizations add-iam-policy-binding 397129301957 --member="user:cloudasta@rolling-suds.net" --role="roles/resourcemanager.projectCreator"

sleep 5 # Adding a delay of 5 seconds

# Disable the constraint iam.disableServiceAccountKeyCreation enforcement

gcloud resource-manager org-policies disable-enforce iam.disableServiceAccountKeyCreation --organization=397129301957

sleep 5 # Adding a delay of 5 seconds

# Create a new service account

gcloud iam service-accounts create Macarron-Source --project=macarron-source

sleep 5 # Adding a delay of 5 seconds

# Add IAM policy binding to the project

gcloud projects add-iam-policy-binding macarron-source --member="serviceAccount:Macarron-Source@macarron-source.iam.gserviceaccount.com" --role="roles/editor"

sleep 5 # Adding a delay of 5 seconds

# Get the unique ID of the service account

gcloud iam service-accounts describe Macarron-Source@macarron-source.iam.gserviceaccount.com --project=macarron-source --format="value(uniqueId)"

sleep 5 # Adding a delay of 5 seconds

# Create a service account key and save it to a JSON file

gcloud iam service-accounts keys create Macarron-Source.json --iam-account=Macarron-Source@macarron-source.iam.gserviceaccount.com --project=macarron-source

sleep 5 # Adding a delay of 5 seconds

# Enable necessary Google services

gcloud services enable drive.googleapis.com sheets.googleapis.com admin.googleapis.com people.googleapis.com contacts.googleapis.com migrate.googleapis.com gmail.googleapis.com calendar-json.googleapis.com groupsmigration.googleapis.com groupssettings.googleapis.com tasks.googleapis.com --project=macarron-source

sleep 5 # Adding a delay of 5 seconds

# Download the service account key JSON file

cloudshell download Macarron-Source.json

sleep 5 # Adding a delay of 5 seconds

# Enable the constraint iam.disableServiceAccountKeyCreation enforcement

gcloud resource-manager org-policies enable-enforce iam.disableServiceAccountKeyCreation --organization=397129301957

sleep 5 # Adding a delay of 5 seconds
