#!/bin/bash

CURR_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
[ -d "$CURR_DIR" ] || { echo "FATAL: no current dir (maybe running in zsh?)";  exit 1; }

# shellcheck source=./common.sh
source "$CURR_DIR/common.sh"

configfile=./assets/k3d-config-registry.yaml

section "Create a Cluster with a registry from config file"
printf "${CYA}********************${END}\n$(cat $configfile)\n${CYA}********************${END}\n"
info_pause_exec "Create the cluster & registry" "k3d cluster create --config $configfile"

# Create in-memory shell variable holding the YAML for the development pod
pod_yaml=./assets/dev-container-pod.yaml

section "PREVIEW Pod and Volume Claim definition..."
printf "${CYA}********************${END}\n$(cat $pod_yaml)\n${CYA}********************${END}\n"

# Create the development pod
section "Start the development pod"
info_pause_exec_options "CREATE Pod and Volume Claim definition..." "kubectl apply --filename $pod_yaml"
