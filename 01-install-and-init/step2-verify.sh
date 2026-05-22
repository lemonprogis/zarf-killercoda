#!/bin/bash
kubectl get ns zarf >/dev/null 2>&1 || exit 1
kubectl get pods -n zarf -l app=docker-registry --field-selector=status.phase=Running 2>/dev/null | grep -q docker-registry
