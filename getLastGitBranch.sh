i=0
s="0.1"
sol=""
while [[ ! -z $s ]]; do
  sol=$s
  s=$($PATH_TO_SH/getLastGitBranchI.sh $i)
  i=$((i+1))
done
echo $sol
