#!/usr/bin/env bash

echo "install kubapps"
helm repo add bitnami https://charts.bitnami.com/bitnami
helm install \
  --tls --tls-ca-cert ca.cert.pem --tls-cert helm.cert.pem --tls-key helm.key.pem \
  --set tillerProxy.tls.ca="$(cat ca.cert.pem)" \
  --set tillerProxy.tls.key="$(cat helm.key.pem)" \
  --set tillerProxy.tls.cert="$(cat helm.cert.pem)" \
  --namespace jamlab \
  bitnami/kubeapps
