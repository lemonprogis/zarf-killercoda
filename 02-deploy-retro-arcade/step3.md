# Inspect and Remove

## See what Zarf knows about the package

```bash
zarf package list
```{{exec}}

You'll see two entries: `init` and `dos-games`. Zarf tracks every deploy in cluster state
so it can remove them cleanly later.

## Inspect package contents

```bash
zarf package inspect oci://ghcr.io/zarf-dev/packages/dos-games:1.3.0 \
  --key=https://zarf.dev/cosign.pub
```{{exec}}

This prints the package's `zarf.yaml` — its components, images, and manifests — without
deploying anything.

## Stop the port-forward

```bash
pkill -f "zarf connect" || true
```{{exec}}

## Remove the package

```bash
zarf package remove dos-games --confirm
```{{exec}}

Zarf will tear down the manifests **and** clean up the bundled images from the in-cluster
registry. Verify:

```bash
kubectl get ns dos-games 2>&1 || echo "namespace gone"
zarf package list
```{{exec}}

Click **Check** when finished.
