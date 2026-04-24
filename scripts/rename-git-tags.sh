if [ "$#" -lt 1 ] || [ "$#" -gt 2 ]; then
        echo "Usage: $0 <new-tag-prefix> [<tag-separator>]"
        exit 1
fi

tags=$(git tag -l)
new_prefix=$1
separator=${2:-"-"} # $2 or "-"

git stash

for tag in $tags; do
        # Get the suffix from the old tag
        suffix=$(echo "$tag" | tac --separator=$separator | xargs | awk '{print $1}')
        # Create a new name and delete the old one if successful
        git tag $new_prefix-$suffix $tag && git tag -d $tag
done

git checkout master
git stash pop

echo "/!\ Remember to push and remove tags with 'git push origin --prune --tags'"
