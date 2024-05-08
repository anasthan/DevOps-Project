###### Python Folder README

Local Docker Setup for Flask Python Application

# Presequitcs
Docker

## Directory structure


```
python_project/
│
├── app/
│   ├── app.py
│   ├── requirements.txt

├── docker/
│   ├── mongo/
│   │   └── Dockerfile
│   ├── web
│   │   └── Dockerfile
│   │   └── .env
│
├── docker-compose.yml

```

## CD Deployment - Automation

>> Go path docker/mongo or docker/app path and to destroy 
   docker-compose down
>> Go path docker/mongo or docker/app path and to deploy
   docker-compose up –build


## Output:
curl http://localhost:5000/ping
{"id":"663a1c20c3e83b4fa36b2941","message":"Ping recorded"}

python_project-web-1    | {"event": "PingReceived", "id": "663a1c20c3e83b4fa36b2941", "timestamp": "2024-05-07T12:18:40.744800"}
python_project-web-1    | 172.22.0.1 - - [07/May/2024 12:18:40] "GET /ping HTTP/1.1" 200 –




###### Kubernetes Folder README

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


    

