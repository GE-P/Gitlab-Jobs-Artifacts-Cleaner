#!/bin/bash

# Name: Jobs_Artifacts_Cleaner V0.1
# Author: Not the author but made some modifications
# Version: 0.1 --> Going in the future in repo_cleaner script
# Usage: This script deletes artifacts stored inside Gitlab jobs

project_id="Your project ID visible on main page of the project"

token="Personal token made in gitlab"
server="Url of gitlab, like gitlab.com"

job_ids=("Put results of the following command : find . -maxdepth 2 -mindepth 2 -type d -exec basename {} \; > folder.txt")


for job_id in ${job_ids[@]};
do
 URL="https://$server/api/v4/projects/$project_id/jobs/$job_id/erase"
 echo "$URL"
 curl -k --request POST --header "PRIVATE-TOKEN:${token}" "$URL" --insecure
 echo "\n"
done
