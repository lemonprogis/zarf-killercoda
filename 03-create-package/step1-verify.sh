#!/bin/bash
[ -f /root/podinfo-package/zarf.yaml ] || exit 1
grep -q "name: podinfo" /root/podinfo-package/zarf.yaml
