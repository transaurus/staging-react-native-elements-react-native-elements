#!/usr/bin/env bash
set -euo pipefail

# Rebuild script for react-native-elements/react-native-elements
# Runs on existing source tree (no clone). Assumes CWD is the docusaurusRoot (website/).
# Installs deps and builds the Docusaurus site.

echo "[INFO] Node version: $(node -v)"
echo "[INFO] npm version: $(npm -v)"

# Enable corepack for yarn version management
corepack enable

echo "[INFO] Yarn version: $(yarn --version)"

echo "[INFO] Installing dependencies..."
yarn install

echo "[INFO] Building..."
yarn build

if [ -d "build" ] && [ -n "$(ls -A build)" ]; then
    BUILD_COUNT=$(find build -type f | wc -l)
    echo "[INFO] Build succeeded! $BUILD_COUNT files in build/."
else
    echo "[ERROR] build/ directory missing or empty"
    exit 1
fi

echo "[DONE] Build complete."
