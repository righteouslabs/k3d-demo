# Reference: https://github.com/devcontainers/images/blob/main/src/typescript-node/.devcontainer/Dockerfile
# Tag List: https://mcr.microsoft.com/v2/devcontainers/python/tags/list
# Debian package list: https://packages.debian.org/stable/

FROM mcr.microsoft.com/devcontainers/python:3.11

###############################################################################

# Install make (https://www.gnu.org/software/make/)
RUN sudo apt-get update && sudo apt-get install -y make

# Install Tilt (https://docs.tilt.dev/install.html#linux)
RUN curl -fsSL https://raw.githubusercontent.com/tilt-dev/tilt/master/scripts/install.sh | bash

# Install Azure CLI (https://learn.microsoft.com/en-ca/cli/azure/install-azure-cli-linux)
RUN curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Install kubelogin (https://azure.github.io/kubelogin/install.html)
RUN sudo az aks install-cli

ARG K8S_ISTIO_VERSION="1.17.2"
RUN curl -L https://istio.io/downloadIstio | sudo bash \
    && sudo cp "istio-$K8S_ISTIO_VERSION/bin/istioctl" "/usr/local/bin/istioctl"

# Install k3d (https://k3d.io/#installation)
RUN curl -s https://raw.githubusercontent.com/rancher/k3d/main/install.sh | sudo bash

# Install helm (https://helm.sh/docs/intro/install/)
RUN curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 \
    && sudo chmod 700 get_helm.sh \
    && sudo ./get_helm.sh

###############################################################################

# [Optional] Uncomment this section to install additional OS packages.
# RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
#     && apt-get -y install --no-install-recommends <your-package-list-here>
