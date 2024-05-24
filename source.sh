#!/bin/bash

# Create a new Google Cloud project
gcloud projects create pelamela-culero-source --name="Pelamela-Culero-Source"
sleep 5 # Adding a delay of 5 seconds

# Set the current Google Cloud project
gcloud config set project pelamela-culero-source
sleep 5 # Adding a delay of 5 seconds

# Provide yourself Organization Policy Administrator and Project Creator roles
gcloud organizations add-iam-policy-binding 903894156066 --member="user:pelamela@culero.com" --role="roles/orgpolicy.policyAdmin"
gcloud organizations add-iam-policy-binding 903894156066 --member="user:pelamela@culero.com" --role="roles/resourcemanager.projectCreator"
sleep 5 # Adding a delay of 5 seconds

# Disable the constraint iam.disableServiceAccountKeyCreation enforcement
gcloud resource-manager org-policies disable-enforce iam.disableServiceAccountKeyCreation --organization=903894156066
sleep 5 # Adding a delay of 5 seconds

# Create a new service account
gcloud iam service-accounts create Pelamela-Culero-Source --project=pelamela-culero-source
sleep 5 # Adding a delay of 5 seconds

# Add IAM policy binding to the project
gcloud projects add-iam-policy-binding pelamela-culero-source --member="serviceAccount:Pelamela-Culero-Source@pelamela-culero-source.iam.gserviceaccount.com" --role="roles/editor"
sleep 5 # Adding a delay of 5 seconds

# Get the unique ID of the service account
gcloud iam service-accounts describe Pelamela-Culero-Source@pelamela-culero-source.iam.gserviceaccount.com --project=pelamela-culero-source --format="value(uniqueId)"
sleep 5 # Adding a delay of 5 seconds

# Create a service account key and save it to a JSON file
gcloud iam service-accounts keys create Pelamela-Culero-Source.json --iam-account=Pelamela-Culero-Source@pelamela-culero-source.iam.gserviceaccount.com --project=pelamela-culero-source
sleep 5 # Adding a delay of 5 seconds

# Enable necessary Google services
gcloud services enable drive.googleapis.com sheets.googleapis.com admin.googleapis.com people.googleapis.com contacts.googleapis.com migrate.googleapis.com gmail.googleapis.com calendar-json.googleapis.com groupsmigration.googleapis.com groupssettings.googleapis.com tasks.googleapis.com --project=pelamela-culero-source
sleep 5 # Adding a delay of 5 seconds

# Download the service account key JSON file
cloudshell download Pelamela-Culero-Source.json
sleep 5 # Adding a delay of 5 seconds

# Enable the constraint iam.disableServiceAccountKeyCreation enforcement
gcloud resource-manager org-policies enable-enforce iam.disableServiceAccountKeyCreation --organization=
sleep 5 # Adding a delay of 5 seconds
