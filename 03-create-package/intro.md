# Create Your First Zarf Package

A Zarf package is described by a single `zarf.yaml` file. From that, `zarf package create`
produces a self-contained tarball — images, charts, manifests, binaries — that can be
deployed anywhere, including disconnected environments.

In this scenario you'll build a small package that deploys [**podinfo**](https://github.com/stefanprodan/podinfo)
(a tidy demo HTTP service maintained by Stefan Prodan) from its upstream Helm chart.

## What's been done for you

The background script installed `zarf` and `k3d`, created a cluster, and ran `zarf init`
(without the host k3s component). The cluster is ready.

Click **Start**.
