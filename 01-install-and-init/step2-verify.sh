#!/bin/bash
kubectl get nodes 2>/dev/null | grep -q ' Ready '
