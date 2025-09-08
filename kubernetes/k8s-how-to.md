# **How to Build and Configure Kubernetes YAML Files**

Kubernetes YAML files define and manage cluster resources declaratively. Understanding **how to build these files** with proper **configuration options** is crucial for deploying and managing applications efficiently.

---

## **1. Basic YAML Structure**

Every Kubernetes resource file follows this general structure:

```yaml
apiVersion: <API version>
kind: <Resource type>
metadata:
  name: <Name of the resource>
  labels:
    <key>: <value>
spec: <Resource-specific configuration>
```

Let's go deeper into each resource and its **configuration options**.

---

## **2. Kubernetes Pod Configuration**

### **2.1 Basic Pod YAML**

A **Pod** is the smallest deployable unit in Kubernetes.

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: my-pod
  labels:
    app: my-app
spec:
  containers:
    - name: my-container
      image: nginx
      ports:
        - containerPort: 80
```

### **Key Configurations for Pods**

| Field        | Description                                           |
| ------------ | ----------------------------------------------------- |
| `containers` | Defines the container(s) running in the pod.          |
| `image`      | Specifies the container image (e.g., `nginx:latest`). |
| `ports`      | Defines which ports to expose inside the container.   |
| `labels`     | Metadata used for selection and organization.         |

---

## **3. Deployments Configuration**

A **Deployment** ensures that the desired number of Pods are always running.

### **3.1 Deployment YAML**

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: my-deployment
spec:
  replicas: 3
  selector:
    matchLabels:
      app: my-app
  template:
    metadata:
      labels:
        app: my-app
    spec:
      containers:
        - name: my-container
          image: nginx
          ports:
            - containerPort: 80
```

### **Key Configurations for Deployments**

| Field                      | Description                                           |
| -------------------------- | ----------------------------------------------------- |
| `replicas`                 | Number of Pod instances to maintain.                  |
| `selector.matchLabels`     | Defines which Pods belong to this Deployment.         |
| `template.spec.containers` | Specifies the container details (image, ports, etc.). |

---

## **4. Service Configuration**

A **Service** exposes and connects Pods to external users or other services.

### **4.1 Service YAML**

```yaml
apiVersion: v1
kind: Service
metadata:
  name: my-service
spec:
  selector:
    app: my-app
  ports:
    - protocol: TCP
      port: 80
      targetPort: 8080
  type: LoadBalancer
```

### **Service Types & Configurations**

| Type           | Description                                        |
| -------------- | -------------------------------------------------- |
| `ClusterIP`    | Default. Internal communication only.              |
| `NodePort`     | Exposes service on a static port across all nodes. |
| `LoadBalancer` | Provides an external IP for global access.         |

---

## **5. ConfigMap Configuration**

A **ConfigMap** stores configuration data separately from the application.

### **5.1 ConfigMap YAML**

```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: my-config
data:
  APP_ENV: "production"
  LOG_LEVEL: "debug"
```

### **Mounting a ConfigMap in a Pod**

```yaml
spec:
  containers:
    - name: my-container
      image: nginx
      envFrom:
        - configMapRef:
            name: my-config
```

---

## **6. Secret Configuration**

A **Secret** stores sensitive data like passwords and API keys securely.

### **6.1 Secret YAML**

```yaml
apiVersion: v1
kind: Secret
metadata:
  name: my-secret
type: Opaque
data:
  DB_PASSWORD: cGFzc3dvcmQ= # Base64 encoded 'password'
```

### **Using a Secret in a Pod**

```yaml
spec:
  containers:
    - name: my-container
      image: nginx
      env:
        - name: DB_PASSWORD
          valueFrom:
            secretKeyRef:
              name: my-secret
              key: DB_PASSWORD
```

---

## **7. Persistent Volume Configuration**

A **PersistentVolume (PV)** provides storage that persists beyond Pod lifecycle.

### **7.1 Persistent Volume YAML**

```yaml
apiVersion: v1
kind: PersistentVolume
metadata:
  name: my-pv
spec:
  capacity:
    storage: 5Gi
  accessModes:
    - ReadWriteOnce
  hostPath:
    path: "/mnt/data"
```

### **7.2 Persistent Volume Claim (PVC) YAML**

```yaml
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: my-pvc
spec:
  accessModes:
    - ReadWriteOnce
  resources:
    requests:
      storage: 1Gi
```

---

## **8. Ingress Configuration**

An **Ingress** manages external access to services inside a cluster.

### **8.1 Ingress YAML**

```yaml
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: my-ingress
spec:
  rules:
    - host: myapp.example.com
      http:
        paths:
          - path: /
            pathType: Prefix
            backend:
              service:
                name: my-service
                port:
                  number: 80
```

---

## **9. Applying & Managing Kubernetes YAML Files**

### **Creating Resources**

```sh
kubectl apply -f myfile.yaml
```

### **Viewing Resources**

```sh
kubectl get all
kubectl get pods
kubectl get services
kubectl get deployments
kubectl get ingress
```

### **Describing & Debugging Resources**

```sh
kubectl describe pod my-pod
kubectl logs my-pod
kubectl get events
```

### **Deleting Resources**

```sh
kubectl delete -f myfile.yaml
kubectl delete pod my-pod
kubectl delete deployment my-deployment
```

---

## **10. Best Practices for Kubernetes YAML Files**

✅ **Use Labels & Selectors** → Organize and manage resources easily.  
✅ **Separate Configurations** → Use ConfigMaps and Secrets instead of hardcoding values.  
✅ **Use Namespaces** → Separate environments (e.g., dev, test, prod).  
✅ **Define Resource Limits** → Set CPU/memory limits to optimize performance.  
✅ **Version Control Your YAML Files** → Store them in **Git** for better management.

---

### **Conclusion**

Mastering **Kubernetes YAML files** allows you to **define, deploy, and manage** applications efficiently. 🚀 Let me know if you want a **customized YAML setup** for your use case!
