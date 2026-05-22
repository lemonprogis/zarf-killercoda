# Initialize the Cluster

`zarf init` deploys the **init package** — a small set of components that turn a stock
Kubernetes cluster into a Zarf-ready cluster:

- An in-cluster **container registry** that hosts the images Zarf pushes during deploys
- The **Zarf agent**, a mutating webhook that rewrites image references to point at that registry
- An optional **Git server** for GitOps tooling

The init package will be pulled from the official OCI registry on first run.

## Run init

We'll pass `--confirm` so the prompts are skipped — the same effect as answering `y` interactively.

```bash
zarf init --confirm
```{{exec}}

This takes 1–2 minutes. Zarf will:

1. Download the init package to `/tmp`
2. Push its bundled images into the cluster registry
3. Apply the manifests for the registry, agent, and (optionally) the git server

## Check the namespace

When it finishes, Zarf's components live in the `zarf` namespace:

```bash
kubectl get pods -n zarf
```{{exec}}

You should see `zarf-docker-registry-*` and `agent-hook-*` pods in `Running` state. Click
**Check** to continue.
