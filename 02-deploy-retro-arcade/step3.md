# Inspect and Remove

## See what Zarf knows about the package

```bash
zarf package list
```{{exec}}

You'll see two entries: `init` and `dos-games`. Zarf tracks every deploy in cluster state
so it can remove them cleanly later.

## Inspect package contents

`zarf package inspect` is now a parent command with subcommands for different views of a
package. To dump the package's `zarf.yaml`:

```bash
zarf package inspect definition oci://ghcr.io/zarf-dev/packages/dos-games:1.3.0
```{{exec}}

Or list just the container images it ships:

```bash
zarf package inspect images oci://ghcr.io/zarf-dev/packages/dos-games:1.3.0
```{{exec}}

Other useful subcommands: `sbom`, `manifests`, `values-files`. Run `zarf package inspect --help`
for the full list. None of these deploy anything.

> Inspect operations are read-only and don't run any code from the package — we already
> verified the signature with `--key` on `deploy` in step 1, which is where it matters.

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
