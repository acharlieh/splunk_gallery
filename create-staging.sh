#!/usr/bin/env sh
# Script used to create the staging environment
# 
CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)
if [ "${CURRENT_BRANCH}" = "HEAD" ]; then
    CURRENT_BRANCH=$(git rev-parse HEAD)
fi

WORKING_BRANCHES=$(git for-each-ref refs/remotes/origin --no-merged refs/remotes/origin/prod --no-contains refs/remotes/origin/staging --format "%(objectname:short)")

git remote update -p
git checkout origin/prod
git merge --no-ff -m "Staging Build $(date)" ${WORKING_BRANCHES}
git push --force-with-lease origin HEAD:staging

git checkout ${CURRENT_BRANCH}
