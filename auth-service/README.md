
#### Command to generate keycloak-realm-config.yaml from keycloak-data.
kubectl create configmap keycloak-realm-config \
--from-file=realm-export.json=./keycloak-data/realm-export.json \
--dry-run=client -o yaml > keycloak-realm-config.yaml