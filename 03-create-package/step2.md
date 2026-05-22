# Discover Images

Zarf packages are *self-contained* — every container image must be listed so it can be
bundled into the tarball. Hand-maintaining that list across chart upgrades is painful, so
Zarf includes a helper:

```bash
cd /root/podinfo-package && zarf dev find-images
```{{exec}}

Zarf templates the chart, scans the rendered manifests for image references, and prints
them in a paste-ready YAML block. Something like:

```yaml
- name: podinfo
  images:
    - ghcr.io/stefanprodan/podinfo:6.7.1
```

## Patch zarf.yaml

Add that block to the component. We'll use `yq`-free `sed` to keep it dependency-light:

```bash
cat > /root/podinfo-package/zarf.yaml <<'EOF'
kind: ZarfPackageConfig
metadata:
  name: podinfo
  version: 0.1.0
  description: "Deploys podinfo via its upstream Helm chart"

components:
  - name: podinfo
    required: true
    description: "Stefan Prodan's podinfo demo app"
    charts:
      - name: podinfo
        url: https://stefanprodan.github.io/podinfo
        version: 6.7.1
        namespace: podinfo
        releaseName: podinfo
    images:
      - ghcr.io/stefanprodan/podinfo:6.7.1
EOF
```{{exec}}

```bash
cat /root/podinfo-package/zarf.yaml
```{{exec}}

> In a real workflow you'd cross-check the output of `find-images` against the chart's
> `values.yaml` — it can miss images that are gated behind a flag. For podinfo's defaults
> the single image above is enough.
