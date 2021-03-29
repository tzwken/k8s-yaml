#!/bin/bash
kubectl create secret generic alertmanager-main --from-file=alertmanager.yaml=alert-config.txt --dry-run --type=Opaque -oyaml -n monitoring > alertmanager-secret.yaml
kubectl apply -f alertmanager-secret.yaml
