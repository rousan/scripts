#!/usr/bin/env bash

RED='\033[1;31m'
GREEN='\033[0;32m'
NC='\033[0m'

cwd=$PWD
repos=$@

if [ $# -eq 0 ]; then
	repos="${cwd}"
fi

printf "   \n"
for repo in $repos; do
	repo=$(abspath "$repo")
	if [[ -d "${repo}/.git" ]]; then
		cd $repo
		printf "   ${GREEN}$(basename "$repo")${NC}\n"
		printf "   ${NC}$(git rev-parse --abbrev-ref HEAD)${NC}\n"
		printf "   \n"
		cd $cwd
	fi
done
