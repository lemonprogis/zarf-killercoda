# Zarf Killercoda Scenarios

Interactive [Killercoda](https://killercoda.com) scenarios for learning [Zarf](https://zarf.dev),
the airgap-native package manager for Kubernetes.

## Scenarios

1. **[`01-install-and-init/`](01-install-and-init/)** — install the Zarf CLI, run `zarf init`, inspect the in-cluster registry and agent
2. **[`02-deploy-retro-arcade/`](02-deploy-retro-arcade/)** — deploy the signed `dos-games` OCI package and connect to it in your browser
3. **[`03-create-package/`](03-create-package/)** — author a `zarf.yaml`, discover images, build a `.tar.zst`, and deploy it

Each scenario is self-contained — scenarios 2 and 3 use a `background.sh` to install Zarf
and initialize the cluster while the user reads the intro, so you don't have to do scenario
1 first.

## Anatomy of a scenario

Killercoda scenarios are folders with a fixed layout:

```text
<scenario>/
├── index.json          # title, description, step list, backend image
├── intro.md            # rendered before step 1
├── background.sh       # optional - runs at launch, doesn't block UI
├── step1.md            # step instructions; `{{exec}}` makes commands clickable
├── step1-verify.sh     # optional - exit 0 = step passes
├── ...
└── finish.md           # rendered after the last step
```

Backend image used: **`ubuntu`**. The scenarios install [k3d](https://k3d.io) and create a
cluster inside Docker, then run `zarf init` against it. We avoid Killercoda's prebuilt
`kubernetes-kubeadm-1node` image because Zarf's init package includes an optional host k3s
component that conflicts with an already-running kubeadm cluster.

## Hosting these scenarios

Killercoda renders scenarios directly from a GitHub repo. To publish:

1. Push this repo to GitHub
2. Sign in at [killercoda.com/creators](https://killercoda.com/creators)
3. Add the repo under your creator profile
4. Scenarios become available at `killercoda.com/<your-handle>/scenario/<folder-name>`

See the [Killercoda creator docs](https://killercoda.com/creators) for the full spec.

## Reference

- [Zarf docs](https://docs.zarf.dev)
- [Killercoda scenario examples](https://github.com/killercoda/scenario-examples)
