curentBranchCommit=$($PATH_TO_SH/countCommitFromLastBranch.sh)
# branchVersion=$(git symbolic-ref HEAD --short)
branchVersion=$($PATH_TO_SH/getLastGitBranch.sh)
echo $branchVersion'.'$curentBranchCommit
