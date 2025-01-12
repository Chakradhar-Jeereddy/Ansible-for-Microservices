k9s

node
enter
d
ns
escape

kubectl get nodes

kubectl get po -n default
kubect get nodes
kubectl get svc -n default
kubectl get ing

 118  kubectl delete ns chakri
  119  kubectl list namespace
  120  kubectl get namespace
  121  kubectl get ns
  122  kubectl get po
  123  kubectl get no
  124  kubectl get nsvc
  125  kubectl get svc
  126  kubectl get ing
  127  kubectl get ing -n ingress-nginx
  128  history


  kind.sh
  #!/bin/sh
set -o errexit

# kind version
if [ -z "$1" ]; then
  kindversion=""
else
  kindversion="--image kindest/node:$1"
fi

# create a cluster with the local registry enabled in containerd
cat <<EOF | kind create cluster --name=kind $kindversion --config=-
kind: Cluster
apiVersion: kind.x-k8s.io/v1alpha4
nodes:
- role: control-plane
  kubeadmConfigPatches:
  - |
    kind: InitConfiguration
    nodeRegistration:
      kubeletExtraArgs:
        node-labels: "ingress-ready=true"
  extraPortMappings:
  - containerPort: 80
    hostPort: 80
    protocol: TCP
  - containerPort: 443
    hostPort: 443
    protocol: TCP
  - containerPort: 30005
    hostPort: 30005
    protocol: TCP
  - containerPort: 30007
    hostPort: 30007
    protocol: TCP
  - containerPort: 30024
    hostPort: 30024
    protocol: TCP
  - containerPort: 30089
    hostPort: 30089
    protocol: TCP
  - containerPort: 30079
    hostPort: 30079
    protocol: TCP
  - containerPort: 30009
    hostPort: 30009
    protocol: TCP
  - containerPort: 30008
    hostPort: 30008
    protocol: TCP
  - containerPort: 30086
    hostPort: 30086
    protocol: TCP
  - containerPort: 30020
    hostPort: 30020
    protocol: TCP
  - containerPort: 30880
    hostPort: 30880
    protocol: TCP
  - containerPort: 30882
    hostPort: 30882
    protocol: TCP
  - containerPort: 30080
    hostPort: 30080
    protocol: TCP
  - containerPort: 30082
    hostPort: 30082
    protocol: TCP
  - containerPort: 30081
    hostPort: 30081
    protocol: TCP
  - containerPort: 30090
    hostPort: 30090
    protocol: TCP
  - containerPort: 30083
    hostPort: 30083
    protocol: TCP
  - containerPort: 30091
    hostPort: 30091
    protocol: TCP
  - containerPort: 30888
    hostPort: 30888
    protocol: TCP
  - containerPort: 30026
    hostPort: 30026
    protocol: TCP
  - containerPort: 30002
    hostPort: 30002
    protocol: TCP
  - containerPort: 30102
    hostPort: 30102
    protocol: TCP
  - containerPort: 30103
    hostPort: 30103
    protocol: TCP
  - containerPort: 30104
    hostPort: 30104
    protocol: TCP
  - containerPort: 30094
    hostPort: 30094
    protocol: TCP
  - containerPort: 30095
    hostPort: 30095
    protocol: TCP
  - containerPort: 30096
    hostPort: 30096
    protocol: TCP
  - containerPort: 30021
    hostPort: 30021
    protocol: TCP
  - containerPort: 30017
    hostPort: 30017
    protocol: TCP
  - containerPort: 30025
    hostPort: 30025
    protocol: TCP
  - containerPort: 30028
    hostPort: 30028
    protocol: TCP
  - containerPort: 30029
    hostPort: 30029
    protocol: TCP
  - containerPort: 30019
    hostPort: 30019
    protocol: TCP
  - containerPort: 30032
    hostPort: 30032
    protocol: TCP
  - containerPort: 30034
    hostPort: 30034
    protocol: TCP
  - containerPort: 30031
    hostPort: 30031
    protocol: TCP
  - containerPort: 30033
    hostPort: 30033
    protocol: TCP
  - containerPort: 30018
    hostPort: 30018
    protocol: TCP
  - containerPort: 30023
    hostPort: 30023
    protocol: TCP
  - containerPort: 30027
    hostPort: 30027
    protocol: TCP
  - containerPort: 30006
    hostPort: 30006
    protocol: TCP
  - containerPort: 30068
    hostPort: 30068
    protocol: TCP
  - containerPort: 30066
    hostPort: 30066
    protocol: TCP
  - containerPort: 30067
    hostPort: 30067
    protocol: TCP
  - containerPort: 31082
    hostPort: 31082
    protocol: TCP
  - containerPort: 31081
    hostPort: 31081
    protocol: TCP
  - containerPort: 31090
    hostPort: 31090
    protocol: TCP
  - containerPort: 31083
    hostPort: 31083
    protocol: TCP
  - containerPort: 31091
    hostPort: 31091
    protocol: TCP
  - containerPort: 31888
    hostPort: 31888
    protocol: TCP
  - containerPort: 30901
    hostPort: 30901
    protocol: TCP
  - containerPort: 31183
    hostPort: 31183
    protocol: TCP
  - containerPort: 31191
    hostPort: 31191
    protocol: TCP
  - containerPort: 30037
    hostPort: 30037
    protocol: TCP
  - containerPort: 30127
    hostPort: 30127
    protocol: TCP
  - containerPort: 30022
    hostPort: 30022
    protocol: TCP
  - containerPort: 30041
    hostPort: 30041
    protocol: TCP
  - containerPort: 30035
    hostPort: 30035
    protocol: TCP
  - containerPort: 30433
    hostPort: 30433
    protocol: TCP


- role: worker
- role: worker
EOF

kubectl get storageclass standard -o yaml | sed 's/standard/local-path/g' | kubectl create -f -
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/3476232f5c38383dd157ddaff3b4c7cebd57284e/deploy/static/provider/kind/deploy.yaml
