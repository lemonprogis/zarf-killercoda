# Create a k3d Cluster

[k3d](https://k3d.io) runs [k3s](https://k3s.io) inside Docker containers — perfect for
local development. We use k3d here (instead of installing k3s on the host) because the
Zarf init package itself has an optional `k3s` component, and running both would conflict.

## Install kubectl

The `ubuntu` backend doesn't ship with `kubectl`. Grab the latest stable release:

```bash
KUBECTL_VERSION=$(curl -sL https://dl.k8s.io/release/stable.txt)
curl -sLO "https://dl.k8s.io/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl"
chmod +x kubectl
sudo mv kubectl /usr/local/bin/kubectl
kubectl version --client
```{{exec}}

> Heads up: Zarf also ships kubectl internally as `zarf tools kubectl`. We install the
> standalone binary here so the rest of the scenario reads like normal Kubernetes docs.

## Install k3d

```bash
curl -s https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash
```{{exec}}

## Create the cluster

```bash
k3d cluster create zarf
```{{exec}}

This will take ~30 seconds. k3d writes a kubeconfig that points `kubectl` at the new
cluster automatically.

## Confirm the cluster is up

```bash
kubectl get nodes
```{{exec}}

You should see one node in `Ready` status. Click **Check** to continue.
