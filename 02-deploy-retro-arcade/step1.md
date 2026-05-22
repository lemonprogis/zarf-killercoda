# Deploy the dos-games Package

Zarf packages are distributed as either tarballs (`.tar.zst` files) or as **OCI artifacts**
pushed to a registry — the same protocol that ships container images. We'll pull this one
directly from GitHub Container Registry.

## Wait for background setup (one-time)

If `zarf init` is still running, give it a moment:

```bash
until [ -f /opt/.bg-ready ]; do echo "waiting on background init..."; sleep 5; done
echo "ready"
```{{exec}}

## Deploy the package

The `--key` flag verifies the package signature against the official Zarf cosign public key:

```bash
zarf package deploy oci://ghcr.io/zarf-dev/packages/dos-games:1.3.0 \
  --key=https://zarf.dev/cosign.pub \
  --confirm
```{{exec}}

Watch the output as Zarf:

1. Pulls the OCI artifact
2. Verifies the signature
3. Pushes the bundled `defenseunicorns/zarf-game` image to the **in-cluster** registry
4. Applies the manifests — the agent rewrites the image reference on the fly

## Confirm the deployment

```bash
kubectl get pods -n dos-games
```{{exec}}

You should see a `game-*` pod in `Running`. Click **Check** to continue.
