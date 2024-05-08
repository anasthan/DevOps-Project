#!/bin/bash

# Function to check if a namespace exists
namespace_exists() {
    local namespace="$1"
    kubectl get namespace "$namespace" &> /dev/null
}

# Function to create a namespace
create_namespace() {
    local namespace="$1"
    kubectl create namespace "$namespace"
}

# Function to install or upgrade Helm charts based on namespace
install_or_upgrade_charts() {
    local namespace="$1"
    local charts=()

    case "$namespace" in
        "app")
            charts=("../charts/app-tier --values ../values/web-values.yaml")
            ;;
        "db")
            charts=("../charts/db-tier")
            ;;
        "monitoring")
            charts=("../charts/monitoring/prometheus" "../charts/monitoring/grafana" "../charts/monitoring/elasticsearch" "../charts/monitoring/filebeat" "../charts/monitoring/kibana")
            ;;
        *)
            echo "Namespace $namespace is not supported."
            exit 1
            ;;
    esac

    for chart in "${charts[@]}"; do
        local release_name="$(basename "$chart")"
        # local values_file="values.yaml"  # Replace with the path to your Helm values file

        if helm status "$release_name" --namespace "$namespace" &> /dev/null; then
            echo "Upgrading Helm chart $chart in namespace $namespace..."
            helm upgrade "$release_name" "$chart" --namespace "$namespace"
        else
            echo "Installing Helm chart $chart in namespace $namespace..."
            helm install "$release_name" "$chart" --namespace "$namespace"
        fi
    done
}

# Main script

# Check if namespace name is provided as an argument
if [ $# -ne 1 ]; then
    echo "Usage: $0 <namespace>"
    exit 1
fi

namespace="$1"

# Check if the namespace exists
if namespace_exists "$namespace"; then
    echo "Namespace $namespace already exists."
else
    echo "Namespace $namespace does not exist. Creating..."
    create_namespace "$namespace"
fi

# Install or upgrade Helm charts based on namespace
install_or_upgrade_charts "$namespace"
