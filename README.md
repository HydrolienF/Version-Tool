# Version-Tool
The goal of this tool is to have a simple versioning tool for release that look like:
`branchName.numberOfCommitFromLastBranch`
ex: `0.5.24`

## Usage

A simple action to get current version in a version.md file.

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
      uses: HydrolienF/Version-Tool@0.4.6
    - name: print
      run: cat version.md
```
