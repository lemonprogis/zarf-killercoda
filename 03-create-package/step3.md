# Build the Package

Time to turn `zarf.yaml` into a deployable tarball.

```bash
cd /root/podinfo-package && zarf package create . --confirm
```{{exec}}

Zarf will:

1. Fetch the podinfo Helm chart and pin it
2. Pull `ghcr.io/stefanprodan/podinfo:6.7.1` and embed it
3. Compute a SHA256 of every artifact and write a manifest
4. Compress everything into a `.tar.zst` file

## Look at the result

```bash
ls -lh /root/podinfo-package/*.tar.zst
```{{exec}}

You should see something like `zarf-package-podinfo-amd64-0.1.0.tar.zst`.

## Peek inside without deploying

```bash
zarf package inspect /root/podinfo-package/zarf-package-podinfo-amd64-0.1.0.tar.zst
```{{exec}}

This is what makes Zarf packages portable — copy that `.tar.zst` to an airgapped machine
and `zarf package deploy` will run with no network access required.
