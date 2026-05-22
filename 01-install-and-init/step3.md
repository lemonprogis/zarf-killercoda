# Inspect the Zarf Deployment

Now that the cluster is initialized, let's explore what Zarf installed.

## List deployed packages

Zarf tracks every package it has deployed:

```bash
zarf package list
```{{exec}}

The `init` package shows up here as `init`.

## Open the live cluster monitor

Zarf ships with a built-in [k9s](https://k9scli.io/)-style TUI:

```bash
zarf tools monitor
```{{exec}}

Press `0` to view all namespaces. Use `Ctrl+C` to exit when done.

## Peek at the registry credentials

The in-cluster registry is private. Zarf stores its credentials and exposes them via:

```bash
zarf tools get-creds
```{{exec}}

You'll see push/pull credentials for the registry, plus credentials for the git server and
logging stack if you installed those components.

## Optional: tear it all down

If you want to start fresh:

```bash
zarf destroy --confirm
```

(Don't run this now — the next scenarios assume an initialized cluster.)
