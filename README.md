# Prerequisites
Minikube, HELM, Docker

Please follow below steps :

   ## Install Docker:

  sudo yum update -y
  sudo yum install -y docker
  sudo service docker start
  sudo usermod -a -G docker ec2-user

   ## Install Minikube:

curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube
minikube start --driver=none

  ##  Install Helm:

curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash

  ##  Docker Login to DockerHub:

docker login
# You'll be prompted to enter your DockerHub credentials (username and password)


###### Python Folder README

Local Docker Setup for Flask Python Application

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
# Response -->
{"id":"663a1c20c3e83b4fa36b2941","message":"Ping recorded"}

# Docker Log --->
python_project-web-1    | {"event": "PingReceived", "id": "663a1c20c3e83b4fa36b2941", "timestamp": "2024-05-07T12:18:40.744800"}
python_project-web-1    | 172.22.0.1 - - [07/May/2024 12:18:40] "GET /ping HTTP/1.1" 200 –




###### Kubernetes Folder README

Kubernetes Setup for Flask Python Application


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

#### Features
###### 1. Helm Charts Used in parameterized way
###### 2. Network policies deployed for communication b/w namespaces - app, web and monitoring
###### 3. Resource Limit
###### 4. HPA 

#### CD Deployment - Automation
###### Go to executores/ path
###### HELM Deployment : Run ./infrastructureInstall.sh <namespace> 
   ###### For example :
     # ./infrastructureInstall.sh app
     #   ./infrastructureInstall.sh db
     #   ./infrastructureInstall.sh monitoring

#### Note : All Screenshot placed under Screenshots/ directory ( step 1, 2, 3 )


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




    

