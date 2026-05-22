# Initialize the Cluster

`zarf init` deploys the init package — the components that turn a stock Kubernetes cluster
into a Zarf-ready cluster:

- An in-cluster **container registry** that hosts the images Zarf pushes during deploys
- The **Zarf agent**, a mutating webhook that rewrites image references to point at that registry
- An optional **git server**, **logging stack**, and (on Linux) a host-level **k3s** install

## Run init (interactive)

We're going to run this **without** `--confirm` so you see the component prompts. Zarf
auto-finds the init package you downloaded in `/tmp`.

```bash
cd /tmp && zarf init
```{{exec}}

When prompted:

| Prompt | Answer |
|--------|--------|
| `Confirm this Zarf package install?` | **`y`** |
| `Deploy the k3s component?` | **`n`** ← we already have k3d running |
| `Deploy the logging component?` | up to you (`n` is fine) |
| `Deploy the git-server component?` | up to you (`y` to keep it) |

> ⚠️ Saying **yes** to k3s on a host that already runs Kubernetes (kubeadm, k3s, k3d, etc.)
> will fail — k3s tries to bind ports already in use. Always decline k3s when you brought
> your own cluster.

## Confirm

When init finishes, Zarf's components live in the `zarf` namespace:

```bash
kubectl get pods -n zarf
```{{exec}}

You should see `zarf-docker-registry-*` and `agent-hook-*` pods in `Running`. Click
**Check** to continue.
