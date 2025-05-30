# K8s networking lab

## About

Each service type folder + ingress contain diffs regarding the routing and netfilter rules for each node in the cluster created via minikube.

Before configuration is applied and after configuration is applied is diff'd.

The purpose of the diffs is to see what an original setup looks like for any given node (Control Plane or Data Plane) and the differences when services are running.

## Cluster setup

The cluster was set up via minikube on a Debian 12 machine running kernel 6.1.0-35-amd64 (64-bit).

```console
minikube start --driver=docker -n 2 -p networking-lab
```

## Ingress setup

For ingress, the addon was enabled via minikube:

```console
minikube addons enable ingress
```

And, a rule in `/etc/hosts` was added:

```
192.168.49.2    networking.lab  # used with minikube
```

Where `192.168.49.2` is the IP allocated in the subnet bridged on the host to the cluster. It is the IP of the first node of the cluster (`networking-lab`) which is a Control Plane node that also has the nginx ingress listener running.
