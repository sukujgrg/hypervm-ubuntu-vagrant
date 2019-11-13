Vagrant Hyper-V box with `kubeadm` and related components.
---

### Purpose of this vagrant box
Spin up a kubernetes cluster on Windows 10 as much quickly as possible with Vagrant. 

### This box is for you if:
- Your internet bandwidth sucks and because of that you can't bootstrap a kubernetes cluster quick enough with `kubeadm`.
`kubeadm` need to pull couple of docker images which will take some considerable amount of time if your internet speed is low.
- You are spinning up and tearing down Kubernetes cluster very frequently (for learning purpose.)

### How to build the box

```
packer.exe build -force -var 'hyperv_switchname=<Your VSwitch Name>' -on-error=ask .\hyperv-ubuntu-18.04-kubeadm-1.15.json
```

### What all packages and docker images are baked in this vagrant box?

See scripts in [bin](bin/) folder.

### Vagrant box

https://app.vagrantup.com/sukujgrg/boxes/ubuntu-kubeadm
