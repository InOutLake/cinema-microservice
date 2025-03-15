#!/usr/bin/env bash
set -x
minikube start
kubectl apply -f ./_kubernetes_setup/