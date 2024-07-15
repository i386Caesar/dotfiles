#!/bin/bash
git filter-branch --env-filter '
CORRECT_NAME="i386Caesar"
CORRECT_EMAIL="x86Caesar@protonmail.com"
export GIT_COMMITTER_NAME="i386Caesar"
export GIT_COMMITTER_EMAIL="x86Caesar@protonmail.com"
export GIT_AUTHOR_NAME="i386Caesar"
export GIT_AUTHOR_EMAIL="x86Caesar@protonmail.com"
' --tag-name-filter cat -- --branches --tags

