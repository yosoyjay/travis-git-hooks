#!/bin/bash 
#
# Updates Travis build badge in README.md to current git user and branch.
#
# To enable this hook, rename the file to "pre-commit" and place in .git/hooks


# Get current branch
branch=`git rev-parse --abbrev-ref HEAD`

# Get remote account + repo
remote_url=`git remote get-url origin`
account=$(basename `dirname $remote_url`)
remote_repo=`basename $remote_url`
repo=${remote_repo%.git}

# Print status
# echo "Remote URL: $remote_url"
# echo "Remote account: $account"
# echo "Remote name: $repo"

# Replace badge details
badge_url="[![Build Status](https://travis-ci.org/$account/$repo.svg?branch=$branch)](https://travis-ci.org/$account/$repo)"
line_num=`grep -n '[!Build Status]' README.md | awk -F: '{print $1}'`
awk -v var="$badge_url" 'NR==1 {$0=var} 1' README.md > tmp && mv tmp README.md 
