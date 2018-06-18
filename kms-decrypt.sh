#!/bin/bash

DECRYPT_THIS_BASE64_STRING=$1
PROFILE="${2:-default}"

output=$(aws kms decrypt --ciphertext-blob fileb://<(echo $DECRYPT_THIS_BASE64_STRING | base64 -D) --query Plaintext --output text --profile ${PROFILE} | base64 -D)
echo "Decrypted Ciphertext Is: $output"
