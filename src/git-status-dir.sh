#!/usr/bin/env bash

RED='\033[1;31m'
GREEN='\033[0;32m'
NC='\033[0m'

cwd=$PWD
repos=$@

printf "   \n"
for repo in $repos; do
	repo=$(abspath "$repo")
	if [[ -d "${repo}/.git" ]]; then
		cd $repo
		if [[ -n $(git status --porcelain) ]]; then
			printf "   ${RED}x${NC} $(basename "$repo")\n"
		else
			printf "   ${GREEN}✓${NC} $(basename "$repo")\n"
		fi
		cd $cwd
	fi
done
