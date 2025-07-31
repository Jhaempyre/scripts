#!/bin/bash

##run this script as it is in your machine.(this is for kind cluster only)

set -e  # Exit immediately if a command exits with a non-zero status

# Install kind
echo "Installing kind..."
KIND_VERSION="v0.27.0"
KIND_BINARY="./kind"

if [ "$(uname -m)" = "x86_64" ]; then
    curl -Lo ${KIND_BINARY} https://kind.sigs.k8s.io/dl/${KIND_VERSION}/kind-linux-amd64
    chmod +x ${KIND_BINARY}
    sudo mv ${KIND_BINARY} /usr/local/bin/kind
    echo "kind installed successfully."
else
    echo "Unsupported architecture. Only x86_64 supported in this script."
    exit 1
fi

# Install kubectl
echo "Installing kubectl..."
KUBECTL_VERSION="v1.30.0"
KUBECTL_BINARY="./kubectl"
KUBECTL_URL="https://dl.k8s.io/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl"

curl -LO "${KUBECTL_URL}"
chmod +x ${KUBECTL_BINARY}
sudo mv ${KUBECTL_BINARY} /usr/local/bin/kubectl

# Check versions
echo
kubectl version --client
kind version

echo
echo "✅ kind & kubectl installation complete."
