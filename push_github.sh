#/bin/bash
git add -A
git commit -m "$1"
git pull github_origin master
git push github_origin master
