#!/bin/bash

set -e  # Exit if any command fails

# Install gdown (Google Drive downloader)
pip install --upgrade gdown

# Create a directory to store Google Drive files
mkdir -p google_drive_data

echo "Downloading files from Google Drive..."

# Replace with actual Google Drive File IDs (Find in Google Drive link)
gdown --id FILE_ID_1 -O google_drive_data/file1.csv
gdown --id FILE_ID_2 -O google_drive_data/file2.txt

echo "Files downloaded successfully!"

# Run Terraform to create S3 and upload files
terraform init
terraform apply -auto-approve

echo "Terraform execution complete. Files uploaded to S3!"
