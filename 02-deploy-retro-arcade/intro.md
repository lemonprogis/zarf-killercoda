# Deploy the Retro Arcade

In this scenario you'll deploy [`dos-games`](https://github.com/zarf-dev/zarf/tree/main/examples/dos-games)
— a Zarf package containing js-dos and a handful of MS-DOS classics — into a real
Kubernetes cluster, then connect to it from your browser.

## What's already set up

While you were reading, a background script:

- Installed the `zarf` CLI to `/usr/local/bin/zarf`
- Installed `k3d` and created a Kubernetes cluster (`k3d cluster create zarf`)
- Downloaded the Zarf init package to `/tmp`
- Ran `zarf init --confirm --components=git-server` (no host k3s — we're on k3d)

If you want to do all that by hand instead, run scenario **01-install-and-init** first.

Ready? Click **Start**.
