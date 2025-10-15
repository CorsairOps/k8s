# Production Deployment
This directory contains Kubernetes manifests for deploying the aproduction-ready instance of the application. The setup includes:
- **Namespace**: Isolates the application resources.
- **Secrets**: Manages sensitive information like database credentials.
- **ConfigMaps**: Stores non-sensitive configuration data.
- **PersistentVolumeClaims**: Ensures data persistence for the database.
- **Deployments**: Defines the desired state for application and database pods.
- **Services**: Exposes the application and database within the cluster.
- **Ingress**: Manages external access to the application.

## Prerequisites
- A running Kubernetes cluster (version 1.18 or higher).
- `kubectl` configured to interact with your cluster.
- A domain name pointing to your cluster's ingress controller.
- An ingress controller (e.g., NGINX Ingress Controller) installed in your cluster.
- Cert-Manager installed for managing SSL/TLS certificates.

## Deployment Steps
1. **Create Namespace**: Apply the namespace manifest to create a dedicated namespace for the application
2. **Create Secrets**: Create all `.env` files with the necessary environment variables and run the `./apply-secrets.sh` script to auto apply all of them as secrets.
3. From the root of `k8s` directory run: `kubectl apply -f ./ --recursive` to apply all manifests.
4. Monitor the deployment using `kubectl get pods -n <namespace>` and ensure all pods are running successfully.
5. Follow steps in the `nginx-config` directory to set up NGINX as the ingress controller and obtain SSL certificates using Certbot.
6. Access the application at corsairops.com.x