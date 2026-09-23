#!/usr/bin/env bash
# First, disable the workflow you want to delete (via Github console) before executing this script.

# This script need gh cli and jq
# ref: https://github.com/cli/cli
# ref: https://github.com/stedolan/jq
set -euo pipefail

command -v gh
command -v jq

read -rp 'organisation [google]: ' ORG
ORG=${ORG:-google}
read -rp 'repo [cpu_features]: ' REPO
REPO=${REPO:-cpu_features}

URI=repos/"${ORG}"/"${REPO}"/actions

# Get workflow IDs with status "disabled_manually"
mapfile -t WORKFLOW_IDS < <(gh api "${URI}/workflows" | jq '.workflows[] | select(.["state"] | contains("disabled_manually")) | .id')
for WORKFLOW_ID in "${WORKFLOW_IDS[@]}"
do
  WORKFLOW_NAME=$(gh api "${URI}/workflows/${WORKFLOW_ID}" | jq '.name')
  echo "Listing runs for the workflow Name:${WORKFLOW_NAME} ID:${WORKFLOW_ID}"

  # Get all runs associated to this workflow ID
  mapfile -t RUN_IDS < <(gh api "${URI}/workflows/${WORKFLOW_ID}/runs" --paginate | jq '.workflow_runs[].id')
  for RUN_ID in "${RUN_IDS[@]}"
  do
    RUN_NAME=$(gh api "${URI}/runs/${RUN_ID}" | jq '.name')
    echo "Deleting Run Name:${RUN_NAME} ID:${RUN_ID}"
    gh api "${URI}/runs/${RUN_ID}" -X DELETE >/dev/null
  done
done
