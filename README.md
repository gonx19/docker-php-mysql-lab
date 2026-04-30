# 🐳 Infraestructura web containerizada con Docker, Kubernetes y CI/CD

## 📌 Descripción
Proyecto de infraestructura web containerizada con PHP y MySQL, evolucionada
progresivamente desde un entorno básico hasta un pipeline CI/CD completo
con Kubernetes y monitorización con Prometheus y Grafana.

---

## ⚙️ Arquitectura

- **app (PHP 8.2 + Apache)** — 2 réplicas en Kubernetes
- **mysql (MySQL 8)** — con healthcheck y persistencia
- **Prometheus + Grafana** — monitorización del cluster con Helm
- **GitHub Actions** — CI/CD automatizado hacia Docker Hub

---

## 🧰 Tecnologías utilizadas

- Docker y Docker Compose
- Kubernetes (minikube)
- Helm
- GitHub Actions
- Prometheus + Grafana
- PHP 8.2 (Apache)
- MySQL 8
- Linux (Ubuntu Server)

---

## 🚀 Cómo ejecutar el proyecto

### Desarrollo
```bash
docker compose -f docker-compose.dev.yml up -d --build
```
Accede en: http://localhost:8080

### Producción
```bash
docker compose -f docker-compose.prod.yml up -d --build
```
Accede en: http://localhost:80

---

## ☸️ Despliegue en Kubernetes

```bash
minikube start
kubectl apply -f k8s/
kubectl get pods
```

Accede a la app:
```bash
minikube service app-service --url
```

---

## 📊 Monitorización con Prometheus y Grafana

```bash
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update
helm install monitoring prometheus-community/kube-prometheus-stack \
  --namespace monitoring --create-namespace
```

Obtén la contraseña de Grafana:
```bash
kubectl --namespace monitoring get secrets monitoring-grafana \
  -o jsonpath="{.data.admin-password}" | base64 -d ; echo
```

Accede a Grafana:
```bash
kubectl --namespace monitoring port-forward service/monitoring-grafana \
  3000:80 --address 0.0.0.0
```
Abre: http://localhost:3000 — usuario: `admin`

---

## 🔄 CI/CD

Cada `git push` a `main` dispara automáticamente GitHub Actions:
1. Build de la imagen de producción
2. Push a Docker Hub

imagen pública: [hub.docker.com/r/gonx19/docker-php-mysql-lab](https://hub.docker.com/r/gonx19/docker-php-mysql-lab)
