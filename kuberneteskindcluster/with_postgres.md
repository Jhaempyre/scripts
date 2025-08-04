# kind-config.yaml(create this file adn then try)
kind: Cluster
apiVersion: kind.x-k8s.io/v1alpha4
nodes:
- role: control-plane
  extraPortMappings:
  - containerPort: 30432
    hostPort: 30432
    protocol: TCP
  - containerPort: 30433
    hostPort: 30433
    protocol: TCP



# this is needed because we are here assuming to be connected with a ceratin ip . 
# after this 

kubectl get all -n backend -o yaml > postgres-backup.yaml
kind delete cluster
kind create cluster --config=kind-config.yaml

kubectl apply -f postgres.yaml


now firewall configuration 

sudo ufw allow 22
sudo ufw allow [ports]
sudo ufw enable
sudo ufw stauts

/## you are very much ready to connect 


