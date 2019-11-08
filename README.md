Vagrant Hyper-V box with `kubeadm` and related components.

## This Vagrant Box is useful for you if:
- You are on Windows 10 Pro and you want to make use of Hyper-V.
- Your internet bandwidth sucks and because of that you can't bootstrap a kubernetes cluster quick enough with `kubeadm`.
`kubeadm` need to pull couple of docker images which will take some considerable amount of time if internet speed sucks.
- You like to create a Vagrant Box from scratch or You could n't find Ubuntu 18.04 Hyper-V vagrant box.
- You are spinning up and tearing down Kubernetes cluster very frequently.

To speed up the kubernetes cluster spin up, this box has all the needed [binaries](bin/kube-install.sh) and all needed
container images for `kubeadm` with `kubeadm config images pull`

## How to build the box

```
packer.exe build -force -var 'hyperv_switchname=<Your VSwitch Name>' -on-error=ask .\hyperv-ubuntu-18.04.json
packer.exe build -force -var 'hyperv_switchname=<Your VSwitch Name>' -on-error=ask .\hyperv-ubuntu-k8s-18.04.json
```