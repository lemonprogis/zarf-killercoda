#!/bin/bash
# Pass once the dos-games namespace is gone (cleanly removed).
! kubectl get ns dos-games >/dev/null 2>&1
