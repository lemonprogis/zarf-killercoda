#!/bin/bash
# Pass if podinfo was deployed at any point (namespace exists or zarf knows about it).
kubectl get ns podinfo >/dev/null 2>&1 || zarf package list 2>/dev/null | grep -q podinfo
