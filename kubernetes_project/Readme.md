# README

Kubernetes Setup for Flask Python Application

# Prerequisites
Minikube, HELM, Docker

## Directory structure


```
kubernetes_project/
│
├── charts/
│   ├── app-tier/
│   │   └── templates/
│   │   └── Chart.yaml
│   │   └── values.yaml
│   ├── db-tier/
│   │   └── templates/
│   │   └── Chart.yaml
│   │   └── values.yaml
│   ├── monitoring/
│   │   └── templates/
│   │   └── Chart.yaml
│   │   └── values.yaml
│
├── executores/
│   ├── infrastructureInstall.sh
│   ├── infrastructureUninstall.sh
│
├── values/
│   ├── web-values.yml

```

## Kubernetes Resource used in this project for better infrastructure
>> Helm Charts Used in parameterized way
>> Network policies deployed for communication b/w namespaces
>> Resource Limit
>> HPA 

## CD Deployment - Automation
>> Go to executores/ path
>> HELM Deployment : Run ./infrastructureInstall.sh <namespace> 
   For example :
        ./infrastructureInstall.sh app
        ./infrastructureInstall.sh db
        ./infrastructureInstall.sh monitoring


## Prometheus and Grafana

Configure Data Source:

    Access Grafana using its service IP or hostname.
    Login to Grafana using the default admin username and password.
    Go to "Configuration" -> "Data Sources" -> "Add data source".
    Select "Prometheus" as the type.
    In the URL field, enter the URL of the Prometheus service in your Kubernetes cluster (e.g., http://prometheus-service:9090).
    Optionally, you can set the access mode to "Server (Default)" or "Browser" depending on your security requirements.
    Click "Save & Test" to verify the connection to Prometheus.

Import Dashboard JSON:

    Obtain or create a JSON file for the Grafana dashboard you want to import. You can use the simple dashboard JSON provided earlier in this conversation.
    Navigate to "Create" -> "Dashboard" -> "Import" in Grafana.
    Paste the JSON content into the "Or paste JSON" field.
    Click "Load" to load the dashboard configuration.
    Optionally, you can customize the dashboard settings and panels as needed.
    Click "Import" to import the dashboard.

View Dashboard:

    After importing the dashboard, you should see it listed in the dashboard list.
    Click on the dashboard name to view it and visualize the metrics from Prometheus.


    
