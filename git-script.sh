git add .
git commit -m "$1" # COMMIT MSG

if $2 # REMOTE
then
    git push $2 $3 # BRANCH
fi
