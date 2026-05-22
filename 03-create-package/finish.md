# You've Built a Zarf Package

Recap of what you just did:

1. Declared a Zarf package in `zarf.yaml` using only metadata + one chart component
2. Used `zarf dev find-images` to discover the images the chart pulls
3. Ran `zarf package create` to bundle the chart, images, and metadata into a tarball
4. Deployed that tarball into your cluster with `zarf package deploy`

That tarball is the whole point of Zarf — it's the artifact you can ship to an airgapped
environment, hand to a customer, or store in your own OCI registry.

## Where to go next

- **Variables and templating** — make your package configurable at deploy time
- **Signing** — `cosign` integration so deployers can verify provenance
- **Bundling** — combine multiple packages into a higher-level "bundle" with `uds-cli`

Full docs: [docs.zarf.dev](https://docs.zarf.dev)
