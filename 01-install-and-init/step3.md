# Download the Init Package

`zarf init` can pull the init package from an OCI registry on demand, but for airgapped
workflows you'd usually pre-stage it. We'll mirror that pattern here by downloading the
init package as a standalone tarball first.

## Download

```bash
zarf tools download-init --output-directory /tmp
```{{exec}}

Zarf picks the init package version that matches your CLI.

## Check what landed

```bash
ls -lh /tmp/zarf-init-*.tar.zst
```{{exec}}

That single `.tar.zst` contains everything Zarf needs to bootstrap a cluster: the
registry image, the agent webhook, optional components like the git server and (on Linux)
a host k3s install.

Click **Check** when ready.
