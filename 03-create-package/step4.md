# Deploy Your Package

Same `zarf package deploy` command you'd use against any package — it just takes a local
file path instead of an OCI reference.

```bash
cd /root/podinfo-package && zarf package deploy zarf-package-podinfo-amd64-0.1.0.tar.zst --confirm
```{{exec}}

## Verify the deployment

```bash
kubectl get pods -n podinfo
```{{exec}}

Wait for the pod to reach `Running`, then hit the service directly:

```bash
kubectl port-forward -n podinfo svc/podinfo 9898:9898 >/dev/null 2>&1 &
sleep 3
curl -s http://localhost:9898/version
echo
```{{exec}}

You should see a JSON blob with podinfo's version. That's your package, running from a
tarball *you* built.

## Clean up (optional)

```bash
pkill -f "kubectl port-forward" || true
zarf package remove podinfo --confirm
```{{exec}}
