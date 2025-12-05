#!/bin/bash
echo ' Deploying AWS Newsletter System...'
echo ' Uploading to S3...'
aws s3 sync . s3://website-boat/ --exclude '.git/*' --exclude '*.ps1' --delete
echo ' Deployment complete!'
echo ' URL: https://d3o8vrxnvf3ttp.cloudfront.net'
