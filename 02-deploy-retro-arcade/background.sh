#!/bin/bash
# Killercoda runs this in the background while the intro renders.
# Installs zarf and runs zarf init so the user can jump straight to deploying.

set -e

if ! command -v zarf >/dev/null 2>&1; then
  ZARF_VERSION=$(curl -sIX HEAD https://github.com/zarf-dev/zarf/releases/latest \
    | grep -i ^location: \
    | grep -Eo 'v[0-9]+\.[0-9]+\.[0-9]+')
  curl -sL "https://github.com/zarf-dev/zarf/releases/download/${ZARF_VERSION}/zarf_${ZARF_VERSION}_Linux_amd64" -o /usr/local/bin/zarf
  chmod +x /usr/local/bin/zarf
fi

if ! kubectl get ns zarf >/dev/null 2>&1; then
  zarf init --confirm
fi

touch /opt/.bg-ready
