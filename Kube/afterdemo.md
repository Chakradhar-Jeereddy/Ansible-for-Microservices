vim /etc/hostname
add .sensai.exfo.com
vim /etc/hosts > vim into line 4
vim /etc/cloud/templates/hosts.debian.tmpl
add ip address and dns name here eg below
10.22.104.173 teja-vm.sensai.exfo.com
reboot

Get Latest of all:

DOCKER
sudo apt update
sudo apt install snapd
snap refresh
snap install docker
snap services docker
or
apt install docker.io
systemctl start docker
systemctl status docker
sudo apt-get purge docker.io
first install go if docker doesn't install and then try

docker run --rm -d --volume gitlab-runner-config:/etc/gitlab-runner gitlab/gitlab-runner register --access-level="not_protected" --docker-image "busybox:latest" --docker-volumes "/var/run/docker.sock:/var/run/docker.sock" --executor "docker" --locked="false" --name "system-test-runner-2" --non-interactive --registration-token "GR1348941zCLQbzVjUSXyCgAuviRu" --run-untagged="false" --docker-privileged --tag-list "system-test" --url "https://gitlab.com"

docker run --rm -d --volume gitlab-runner-config:/etc/gitlab-runner --volume /var/run/docker.sock:/var/run/docker.sock gitlab/gitlab-runner



PYTHON & GO
apt install python3
snap install go --classic


HELM:
HELM_VERSION=v3.13.1
curl https://get.helm.sh/helm-$HELM_VERSION-linux-amd64.tar.gz -o helm.tar.gz
tar -xzvf helm.tar.gz
mv linux-amd64/helm /usr/local/bin/helm
or
curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash (on the fly)


GITLAB REGISTRY LOGIN
docker login registry.gitlab.com

KUBECTL
https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/ (Check for the latest version)
KUBECTL=v1.30.0
wget -O /usr/local/bin/kubectl https://storage.googleapis.com/kubernetes-release/release/${KUBECTL}/bin/linux/amd64/kubectl
chmod +x /usr/local/bin/kubectl

KIND:
wget -O /usr/local/bin/kind https://github.com/kubernetes-sigs/kind/releases/download/v0.19.0/kind-linux-amd64
wget -O /usr/local/bin/kind https://github.com/kubernetes-sigs/kind/releases/download/v0.20.0/kind-linux-amd64
wget -O /usr/local/bin/kind https://github.com/kubernetes-sigs/kind/releases/download/v0.23.0/kind-linux-amd64
v0.23.0
chmod +x /usr/local/bin/kind

./mc config host add minio http://minio-server.sensai.exfo.com:9000 minioadmin ExFoAdmin


docker system prune -a
snap remove docker --purge
htop
vim ~/.kube/config (to check which flavour of k8s is running)

sudo apt purge snapd
sudo apt autoremove
