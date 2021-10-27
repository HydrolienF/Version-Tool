# branchVersion=$(git symbolic-ref HEAD --short)
# | head -c -2 remove the weard special char at the end of lastBranch.
branchVersion=$(./getLastGitBranch.sh)
branchLastVersion=""
k=true;
for i in `echo $branchVersion | tr "." " "`; do
  if [ $k = true ]; then
    k=false
    branchLastVersion=$i
  else
    branchLastVersion=$branchLastVersion"."$(($i-1))
  fi
done
# echo $branchLastVersion
# echo $branchVersion
totalCommit=$(git rev-list --count origin/$branchVersion)
lastBranchTotalCommit=$(git rev-list --count origin/$branchLastVersion) || lastBranchTotalCommit=0
curentBranchCommit=$(($totalCommit-$lastBranchTotalCommit))
echo $curentBranchCommit