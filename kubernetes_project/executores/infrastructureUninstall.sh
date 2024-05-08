#!/bin/bash

# Function to check if a namespace exists
namespace_exists() {
    local namespace="$1"
    kubectl get namespace "$namespace" &> /dev/null
}

# Function to uninstall Helm charts based on namespace
uninstall_charts() {
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

        if helm status "$release_name" --namespace "$namespace" &> /dev/null; then
            echo "Uninstalling Helm chart $chart from namespace $namespace..."
            helm uninstall "$release_name" --namespace "$namespace"
        else
            echo "Helm chart $chart is not installed in namespace $namespace."
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
if ! namespace_exists "$namespace"; then
    echo "Namespace $namespace does not exist. Please create the namespace first."
    exit 1
fi

# Uninstall Helm charts based on namespace
uninstall_charts "$namespace"
