# Welcome to Zarf

[Zarf](https://zarf.dev) is the **airgap-native package manager for Kubernetes**. It bundles
everything an application needs — container images, Helm charts, manifests, binaries — into a
single tarball that can be deployed into disconnected or intermittently connected environments.

## What you'll do in this scenario

1. Install the `zarf` CLI
2. Create a [k3d](https://k3d.io) cluster (k3s running inside Docker)
3. Download the Zarf init package
4. Run `zarf init` against the cluster — choosing which optional components to install
5. Inspect the in-cluster registry and agent that Zarf installed

Click **Start** to begin.
