echo $1
echo $2
echo $3

git add .
git commit -m "$1" # COMMIT MSG

if [![-z "$2"]] # REMOTE
then
    git push $2 $3 # BRANCH
fi
