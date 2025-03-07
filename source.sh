#!/bin/bash

# Create a new Google Cloud project
echo "[Creating GCP Project...]"
gcloud projects create melgar-source --name="Melgar-Source"
sleep 5 # Adding a delay of 5 seconds

# Set the current Google Cloud project
echo "[Setting up GCP Project...]"
gcloud config set project melgar-source
sleep 5 # Adding a delay of 5 seconds

# Provide yourself Organization Policy Administrator and Project Creator roles
echo "[Assigning Roles...]"
gcloud organizations add-iam-policy-binding 1090329255832 --member="user:paola@melgar.cloud" --role="roles/orgpolicy.policyAdmin"
sleep 5 # Adding a delay of 5 seconds
gcloud organizations add-iam-policy-binding 1090329255832 --member="user:paola@melgar.cloud" --role="roles/resourcemanager.projectCreator"
sleep 5 # Adding a delay of 5 seconds

# Disable the constraint iam.disableServiceAccountKeyCreation enforcement
echo "[Disabling Policy Enforcement...]"
gcloud resource-manager org-policies disable-enforce iam.disableServiceAccountKeyCreation --organization=1090329255832
sleep 60 # Adding a delay of 60 seconds to allow propagation

# Create a new service account
echo "[Creating Service Account...]"
gcloud iam service-accounts create Melgar-Source --project=melgar-source
sleep 5 # Adding a delay of 5 seconds

# Add IAM policy binding to the project
echo "[Adding Policies...]"
gcloud projects add-iam-policy-binding melgar-source --member="serviceAccount:Melgar-Source@melgar-source.iam.gserviceaccount.com" --role="roles/editor"
sleep 5 # Adding a delay of 5 seconds

# Get the unique ID of the service account
echo "[Obtaining Unique ID...]"
gcloud iam service-accounts describe Melgar-Source@melgar-source.iam.gserviceaccount.com --project=melgar-source --format="value(uniqueId)"
sleep 5 # Adding a delay of 5 seconds

# Create a service account key and save it to a JSON file
echo "[Creating JSON Key...]"
gcloud iam service-accounts keys create Melgar-Source.json --iam-account=Melgar-Source@melgar-source.iam.gserviceaccount.com --project=melgar-source
sleep 5 # Adding a delay of 5 seconds

# Enable necessary Google services
echo "[Enabling APIs...]"
gcloud services enable drive.googleapis.com sheets.googleapis.com admin.googleapis.com people.googleapis.com contacts.googleapis.com migrate.googleapis.com gmail.googleapis.com calendar-json.googleapis.com groupsmigration.googleapis.com groupssettings.googleapis.com tasks.googleapis.com forms.googleapis.com vault.googleapis.com storage-component.googleapis.com chat.googleapis.com --project=melgar-source
sleep 5 # Adding a delay of 5 seconds

# Download the service account key JSON file
echo "[Downloading JSON Key...]"
cloudshell download Melgar-Source.json
sleep 5 # Adding a delay of 5 seconds

# Enable the constraint iam.disableServiceAccountKeyCreation enforcement
echo "[Re-enabling Policy Enforcement...]"
gcloud resource-manager org-policies enable-enforce iam.disableServiceAccountKeyCreation --organization=1090329255832
sleep 5 # Adding a delay of 5 seconds

# Tasks completed confirmation
echo "[All tasks completed.]"
sleep 5 # Adding a delay of 5 seconds
echo "Script created by Luis Melgar."