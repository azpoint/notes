# Complete List of `kubectl` Commands with Explanations

## Overview

`kubectl` is the command-line tool for interacting with Kubernetes clusters. It allows you to deploy applications, inspect resources, manage cluster components, and troubleshoot issues.

## General Syntax

```sh
kubectl [COMMAND] [TYPE] [NAME] [FLAGS]
```

- `COMMAND`: The action you want to perform (e.g., get, describe, delete).
- `TYPE`: The resource type (e.g., pod, deployment, service).
- `NAME`: The name of the resource (optional).
- `FLAGS`: Additional options for fine-tuning commands.

To see the full list of commands, run:

```sh
kubectl --help
```

---

## **1. Basic Kubernetes Commands**

| Command                | Description                                | Example                       |
| ---------------------- | ------------------------------------------ | ----------------------------- |
| `kubectl version`      | Display client and server version          | `kubectl version --short`     |
| `kubectl cluster-info` | Display cluster information                | `kubectl cluster-info`        |
| `kubectl get`          | List resources                             | `kubectl get pods`            |
| `kubectl describe`     | Show detailed information about a resource | `kubectl describe pod my-pod` |
| `kubectl delete`       | Delete resources                           | `kubectl delete pod my-pod`   |
| `kubectl explain`      | Show API documentation for a resource      | `kubectl explain pod`         |

---

## **2. Pod and Deployment Management**

| Command             | Description                                   | Example                                                                |
| ------------------- | --------------------------------------------- | ---------------------------------------------------------------------- |
| `kubectl run`       | Create a new pod                              | `kubectl run my-pod --image=nginx`                                     |
| `kubectl expose`    | Expose a resource as a new Kubernetes service | `kubectl expose deployment my-app --port=80 --target-port=8080`        |
| `kubectl scale`     | Scale the number of pod replicas              | `kubectl scale deployment my-app --replicas=3`                         |
| `kubectl autoscale` | Set up autoscaling for a deployment           | `kubectl autoscale deployment my-app --min=2 --max=5 --cpu-percent=80` |

---

## **3. Interacting with Running Pods**

| Command                | Description                                      | Example                                       |
| ---------------------- | ------------------------------------------------ | --------------------------------------------- |
| `kubectl logs`         | Fetch logs from a pod                            | `kubectl logs my-pod`                         |
| `kubectl exec`         | Run a command inside a pod                       | `kubectl exec -it my-pod -- /bin/sh`          |
| `kubectl attach`       | Attach to a running pod’s process                | `kubectl attach my-pod -i`                    |
| `kubectl cp`           | Copy files between a container and local machine | `kubectl cp my-pod:/path/to/file ./localfile` |
| `kubectl port-forward` | Forward local port to a pod port                 | `kubectl port-forward my-pod 8080:80`         |
| `kubectl top`          | Display CPU and memory usage of pods             | `kubectl top pod`                             |

---

## **4. Node and Cluster Management**

| Command             | Description                   | Example                                            |
| ------------------- | ----------------------------- | -------------------------------------------------- |
| `kubectl get nodes` | List nodes in the cluster     | `kubectl get nodes -o wide`                        |
| `kubectl cordon`    | Mark a node as unschedulable  | `kubectl cordon my-node`                           |
| `kubectl uncordon`  | Mark a node as schedulable    | `kubectl uncordon my-node`                         |
| `kubectl drain`     | Safely evict pods from a node | `kubectl drain my-node --ignore-daemonsets`        |
| `kubectl taint`     | Add or remove taints on nodes | `kubectl taint nodes my-node key=value:NoSchedule` |

---

## **5. Configuration and Context Management**

| Command                          | Description                         | Example                                                      |
| -------------------------------- | ----------------------------------- | ------------------------------------------------------------ |
| `kubectl config view`            | Display current kubeconfig settings | `kubectl config view`                                        |
| `kubectl config current-context` | Show the active context             | `kubectl config current-context`                             |
| `kubectl config use-context`     | Switch to another context           | `kubectl config use-context my-cluster`                      |
| `kubectl config set-context`     | Set a new context                   | `kubectl config set-context my-context --cluster=my-cluster` |
| `kubectl config delete-context`  | Remove a context                    | `kubectl config delete-context my-context`                   |

---

## **6. Service and Networking Commands**

| Command                    | Description                              | Example                           |
| -------------------------- | ---------------------------------------- | --------------------------------- |
| `kubectl get services`     | List services                            | `kubectl get svc`                 |
| `kubectl describe service` | Show details of a service                | `kubectl describe svc my-service` |
| `kubectl delete service`   | Delete a service                         | `kubectl delete svc my-service`   |
| `kubectl get endpoints`    | Display the endpoints of a service       | `kubectl get endpoints`           |
| `kubectl proxy`            | Run a proxy to access the Kubernetes API | `kubectl proxy --port=8001`       |

---

## **7. Security and RBAC (Role-Based Access Control)**

| Command                      | Description                                       | Example                                                                 |
| ---------------------------- | ------------------------------------------------- | ----------------------------------------------------------------------- |
| `kubectl auth can-i`         | Check if user has permission to perform an action | `kubectl auth can-i delete pods`                                        |
| `kubectl create role`        | Create a new role                                 | `kubectl create role pod-reader --verb=get --verb=list --resource=pods` |
| `kubectl create rolebinding` | Bind a role to a user or group                    | `kubectl create rolebinding read-pods --role=pod-reader --user=my-user` |
| `kubectl get roles`          | List available roles                              | `kubectl get roles -n my-namespace`                                     |
| `kubectl get rolebindings`   | List role bindings                                | `kubectl get rolebindings -n my-namespace`                              |

---

## **8. Debugging & Troubleshooting**

| Command            | Description                                | Example                                    |
| ------------------ | ------------------------------------------ | ------------------------------------------ |
| `kubectl describe` | Show detailed information about a resource | `kubectl describe pod my-pod`              |
| `kubectl logs`     | Fetch logs from a pod                      | `kubectl logs my-pod`                      |
| `kubectl events`   | Show recent cluster events                 | `kubectl get events`                       |
| `kubectl debug`    | Create a debugging container in a pod      | `kubectl debug my-pod -it --image=busybox` |

---

## **Conclusion**

This document provides a comprehensive list of `kubectl` commands with explanations. Kubernetes is powerful, and mastering these commands will help you efficiently manage and troubleshoot clusters. 🚀
