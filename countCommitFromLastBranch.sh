# branchVersion=$(git symbolic-ref HEAD --short)
# | head -c -2 remove the weard special char at the end of lastBranch.
branchVersion=$($PATH_TO_SH/getLastGitBranch.sh)
branchLastVersion=""
k=true;
for i in `echo $branchVersion | tr "." " "`; do
  if [ $k = true ]; then
    k=false
    branchLastVersion=$i
  else
    if [[ $i>0 ]]; then
      branchLastVersion=$branchLastVersion"."$(($i-1))
    else
      branchLastVersion=$($PATH_TO_SH/getLastGitBranchI.sh $(($branchLastVersion-1)))

    fi
  fi
done
# echo $branchLastVersion
# echo $branchVersion
totalCommit=$(git rev-list --count origin/$branchVersion)
lastBranchTotalCommit=$(git rev-list --count origin/$branchLastVersion) || lastBranchTotalCommit=0
curentBranchCommit=$(($totalCommit-$lastBranchTotalCommit))
echo $curentBranchCommit
