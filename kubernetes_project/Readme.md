# README

Kubernetes Setup for Flask Python Application

# Presequitcs
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


    