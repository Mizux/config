#!/usr/bin/env bash
set -euxo pipefail

# Create main branch
for i in *; do
  if [[ -d $i ]]; then
    echo "Migrate $i to main..."
    pushd "$(pwd)"
    cd "$i"
    (git checkout -b main && git push --set-upstream github main && git branch -d master) || true
    popd
    echo "Migrate $i to main...DONE"
  fi
done

# Delete master branch
for i in *; do
  if [[ -d $i ]]; then
    echo "Delete $i master..."
    pushd "$(pwd)"
    cd "$i"
    git push github :master || true
    popd
    echo "Delete $i master...DONE"
  fi
done
