i=0
s="0.1"
sol=""
while [[ ! -z $s ]]; do
  sol=$s
  s=$(git branch -r --format="%(refname)" | grep -F $i'.' | awk '{ print length, $0 }' | sort -n -s | cut -d" " -f2- | tail -q -n 1 | tail -c +21)
  i=$((i+1))
done
echo $sol
