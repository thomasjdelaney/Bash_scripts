#/bin/bash
git add -A
git commit -m "$1"
git pull origin main
git push origin main
