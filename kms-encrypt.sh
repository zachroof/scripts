#!/bin/bash

KMS_KEY_ID=$1 # Arn of the key
PROFILE="${2:-default}"
ENCRYPT_THIS_FILE_AT_PATH=fileb://"${3:-secret}"

output=$(aws kms encrypt --key-id ${KMS_KEY_ID} --plaintext ${ENCRYPT_THIS_FILE_AT_PATH} --query CiphertextBlob --output text --profile ${PROFILE})
echo "Base64 Encoded Ciphertext Is: $output"
