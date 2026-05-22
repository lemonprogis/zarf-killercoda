#!/bin/bash
# Installs zarf + k3d, creates a cluster, downloads the init package, and runs zarf init
# with explicit components so it does NOT try to install host-level k3s.

set -e

# --- kubectl ---
if ! command -v kubectl >/dev/null 2>&1; then
  KUBECTL_VERSION=$(curl -sL https://dl.k8s.io/release/stable.txt)
  curl -sL "https://dl.k8s.io/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl" -o /usr/local/bin/kubectl
  chmod +x /usr/local/bin/kubectl
fi

# --- zarf CLI ---
if ! command -v zarf >/dev/null 2>&1; then
  ZARF_VERSION=$(curl -sIX HEAD https://github.com/zarf-dev/zarf/releases/latest \
    | grep -i ^location: \
    | grep -Eo 'v[0-9]+\.[0-9]+\.[0-9]+')
  curl -sL "https://github.com/zarf-dev/zarf/releases/download/${ZARF_VERSION}/zarf_${ZARF_VERSION}_Linux_amd64" -o /usr/local/bin/zarf
  chmod +x /usr/local/bin/zarf
fi

# --- k3d ---
if ! command -v k3d >/dev/null 2>&1; then
  curl -s https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash
fi

# --- cluster ---
if ! k3d cluster list 2>/dev/null | grep -q '^zarf '; then
  k3d cluster create zarf
fi

# --- init package ---
if ! ls /tmp/zarf-init-*.tar.zst >/dev/null 2>&1; then
  zarf tools download-init --output-directory /tmp
fi

# --- zarf init (no k3s component, since we're using k3d) ---
if ! kubectl get ns zarf >/dev/null 2>&1; then
  cd /tmp && zarf init --confirm --components=git-server
fi

mkdir -p /root/podinfo-package
touch /opt/.bg-ready
