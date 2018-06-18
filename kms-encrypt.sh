#!/bin/bash

ENCRYPT_THIS_FILE_AT_PATH=fileb://$1
KMS_KEY_ID=$2 # Arn of the key
PROFILE="${3:-default}"

output=$(aws kms encrypt --key-id ${KMS_KEY_ID} --plaintext ${ENCRYPT_THIS_FILE_AT_PATH} --query CiphertextBlob --output text --profile ${PROFILE})
echo "Base64 Encoded Ciphertext Is: $output"
