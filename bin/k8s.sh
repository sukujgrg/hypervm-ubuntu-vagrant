apt-get -y update

apt-get -y install \
    apt-transport-https \
    ca-certificates \
    curl \
    vim \
    software-properties-common \
    nfs-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
curl -fsSL https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -

# add-apt-repository \
#    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
#    $(lsb_release -cs) \
#    stable"

# binoic version are not fully yet compatable with Kubernetes
add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   xenial \
   stable"

add-apt-repository \
   "deb http://apt.kubernetes.io/ \
   kubernetes-xenial \
   main"

# to list all available versions
# apt-cache madison docker-ce

apt-get install -y docker-ce=17.03.3~ce-0~ubuntu-xenial

apt-get install -y kubeadm kubelet kubectl
