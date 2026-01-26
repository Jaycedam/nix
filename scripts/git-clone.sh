#!/usr/bin/env bash
set -e

DIR="$1"
BRANCH="$2"

if [ -z "$DIR" ]; then
    echo "Error: Directory argument is required"
    exit 1
fi

echo "Cloning configuration repository..."
if [ -d "${DIR}/.git" ]; then
    echo "WARNING: ${DIR} already exists. If the script fails, rename or remove the existing directory."
else
    nix-shell -p git --run "git clone https://github.com/jaycem-dev/nix.git ${DIR}" >/dev/null
fi

if [ -n "$BRANCH" ]; then
    echo "Switching to branch: ${BRANCH}..."
    cd "${DIR}"
    if ! git switch "${BRANCH}" >/dev/null; then
        echo "Error: Failed to switch to branch '${BRANCH}'"
        exit 1
    fi
fi

