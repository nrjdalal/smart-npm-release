# Smart NPM Release

This GitHub Action automates the process of releasing a new version of your NPM package. It detects the package manager, checks if the package exists in the NPM registry, determines the next version, and publishes the package. Optionally, it can also set the status with the release link for the commit if a GitHub token is provided.

## Inputs

- `NPM_TOKEN` (required): The NPM token used for authentication.
  Permissions required: `id-token: write`
- `GITHUB_TOKEN` (optional): The GitHub token used for setting the status with the release link.
  Permissions required: `contents: write` and `statuses: write`
- `TAG` (optional): The release tag. If not provided, the minor version will be bumped and released.

## Usage

```yaml
name: Publish NPM Package
on:
  push:
    branches:
      - main

jobs:
  release:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout code
        uses: actions/checkout@v4
        with:
          fetch-depth: 0

      - name: Setup Node.js
        uses: actions/setup-node@v4
        with:
          node-version: "22"

      - name: Smart NPM Release
        uses: nrjdalal/smart-npm-release@v1
        with:
          NPM_TOKEN: ${{ secrets.NPM_TOKEN }}
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
          TAG: "canary"
```
