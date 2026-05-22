# Write zarf.yaml

Every Zarf package starts with a `zarf.yaml` declaring its metadata and components. A
**component** is a unit of stuff Zarf will deploy — a Helm chart, raw manifests, container
images, or files.

## Wait for background setup

```bash
until [ -f /opt/.bg-ready ]; do echo "waiting on background init..."; sleep 5; done
echo "ready"
```{{exec}}

## Create the package directory

```bash
mkdir -p /root/podinfo-package && cd /root/podinfo-package
```{{exec}}

## Write the file

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
EOF
```{{exec}}

## Take a look

```bash
cat /root/podinfo-package/zarf.yaml
```{{exec}}

Notice what's *missing*: an `images:` list. Zarf needs to know which container images to
pull and bundle — we'll discover those in the next step.
