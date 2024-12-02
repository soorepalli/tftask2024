#!/bin/bash

USER_NAME=$1
USER_FILE="users/${USER_NAME}.tfvars"

if [ -z "$USER_NAME" ]; then
  echo "Usage: $0 <user_name>"
  exit 1
fi

if [ -f "$USER_FILE" ]; then
  echo "User configuration already exists: ${USER_FILE}"
  exit 1
fi

cat <<EOF > ${USER_FILE}
bucket_prefix               = "${USER_NAME}-bucket"
location                    = "US"
storage_class               = "STANDARD"
labels                      = { environment = "dev", user = "${USER_NAME}" }
versioning                  = true
uniform_bucket_level_access = true
bucket_count                = 1
EOF

echo "User configuration created: ${USER_FILE}"
./scripts/generate_backend.sh
echo "Backend configuration updated."
