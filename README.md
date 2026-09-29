# Smart NPM Release

This GitHub Action automates the process of releasing a new version of your NPM package. It detects the package manager, checks if the package exists in the NPM registry, determines the next version, and publishes the package. Optionally, it can also set the status with the release link for the commit if a GitHub token is provided.

## Inputs

- `NPM_TOKEN` (optional): The NPM token used for authentication. Omit it to publish via [npm Trusted Publishing](https://docs.npmjs.com/trusted-publishers) (OIDC): add this repository and workflow as the package's trusted publisher on npmjs.com, and run on npm >= 11.5.1 (Node 24, which the action installs when the runner's own Node is in use).
  - Permissions required: `id-token: write`
- `GITHUB_TOKEN` (optional): The GitHub token used for setting the status with the release link.
  - Permissions required: `contents: write` and `statuses: write`
- `TAG` (optional): The release tag. If not provided, the package.json version is used.

## Usage

```yaml
name: Publish NPM Package
on:
  push:
    branches:
      - main

permissions:
  contents: write
  id-token: write
  statuses: write

jobs:
  release:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout Repository
        uses: actions/checkout@v4
        with:
          fetch-depth: 0
      - name: Smart NPM Release
        uses: nrjdalal/smart-npm-release@v1
        with:
          TAG: "canary"
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
```

With a trusted publisher configured on npm the workflow needs no `NPM_TOKEN` secret; to publish with a token instead, add `NPM_TOKEN: ${{ secrets.NPM_TOKEN }}` under `with`.
