#!/bin/bash
kubectl get ns dos-games >/dev/null 2>&1 || exit 1
kubectl wait --for=condition=Ready pod -l app=game -n dos-games --timeout=5s >/dev/null 2>&1
