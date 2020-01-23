kubectl create namespace company1
kubectl config set-credentials employee --client-certificate=/home/employee/.certs/employee.crt  --client-key=/home/employee/.certs/employee.key
kubectl config set-context employee-context --cluster=minikube --namespace=office --user=employee
kubectl --context=employee-context get pods

kubectl create -f role-deployment-manager.yaml
kubectl create -f rolebinding-deployment-manager.yaml

# Test RBAC for Kube
kubectl --context=employee-context run --image bitnami/dokuwiki mydokuwiki
kubectl --context=employee-context get pods

# Should fail
kubectl --context=employee-context get pods --namespace=default
