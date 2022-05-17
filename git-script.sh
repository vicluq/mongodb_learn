# Bash script for committing and pushing to remotes

echo "COMMIT MSG: $1"
echo "REMOTE: $2"
echo "BRANCH: $3"

git add .
git commit -m "$1" # COMMIT MSG

if  [[ ! -z "$2" ]]  # REMOTE (if not zero)
then
    git push $2 $3 # BRANCH
fi
