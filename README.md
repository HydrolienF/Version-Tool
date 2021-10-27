# Version-Tool
The goal of this tool is to have a simple versioning tool for release that look like:
`branchName.numberOfCommitFromLastBranch`
ex: `0.5.24`

## Usage

Download all the .sh of this repository.
Add an action as this one :

```yml
# .github/workflows/version.yml
name: updateVersion

on:
  pull_request:
    branches: [ master ]

jobs:
  updateVersionJob:
    runs-on: ubuntu-latest
    steps:
    - name: checkout
      uses: actions/checkout@v2
      
    - name: Version-Tool
      uses: HydrolienF/Version-Tool@0.5.5
      id: version
      
    - name: print
      run: echo ${{ steps.version.outputs.version }}
```
