#!/bin/bash

###########################################

# Author: Shreyas Desai
#Version: v1

# This is a shell script for fetching all public repositories of a user

###########################################
#Uncomment the below line for printing the commands that were executed
#set -x

API_URL="https://api.github.com/users"
ACCEPT_HEADER="Accept: application/vnd.github+json"
AUTHORIZATION_HEADER="Authorization: Bearer "
GITHUB_API_VERSION="X-GitHub-Api-Version: 2022-11-28"

# Github username and token exported as enviroment variables
TOKEN=$token

# input to the shell script from terminal
REPO_OWNER=$1

function github_api_get {
	local url="${API_URL}/${REPO_OWNER}/repos"
	local bearerToken="${AUTHORIZATION_HEADER}${TOKEN}"

	# Send a GET Request to fetch list of repositories from GitHub
	curl -L -H "${ACCEPT_HEADER}" -H "${bearerToken}" -H "${GITHUB_API_VERSION}" "${url}" | jq -r '.[] | .name'
}


# Calling function to be executed

# Main script

echo "Listing All Public Repositories of ${REPO_OWNER}"
github_api_get



