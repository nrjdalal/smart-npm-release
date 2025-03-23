echo "PACKAGE_MANAGER=npm" >>$GITHUB_OUTPUT
if [ -z "$(which node)" ] || [ "$(which node)" = "/usr/local/bin/node" ]; then
  echo "INSTALL_NODE=true" >>$GITHUB_OUTPUT
fi
if [ -f "bun.lock" ] || [ -f "bun.lockb" ]; then
  if ! command -v bun &>/dev/null; then
    echo "PACKAGE_MANAGER=bun" >>$GITHUB_OUTPUT
    echo "INSTALL_BUN=true" >>$GITHUB_OUTPUT
  fi
fi
if [ -f "pnpm-lock.yaml" ]; then
  if ! command -v pnpm &>/dev/null; then
    echo "PACKAGE_MANAGER=pnpm" >>$GITHUB_OUTPUT
    echo "INSTALL_PNPM=true" >>$GITHUB_OUTPUT
  fi
fi
