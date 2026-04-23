# 🐳 Entorno Docker con PHP y MySQL

## 📌 Descripción

Proyecto de entorno de aplicación web containerizado utilizando Docker.  
Simula una arquitectura backend básica compuesta por una aplicación en PHP y una base de datos MySQL comunicadas mediante red interna.

Este proyecto ha sido desarrollado como práctica de administración de sistemas y despliegue de servicios en contenedores.

---

## ⚙️ Arquitectura

El entorno está compuesto por dos servicios principales:

- **app (PHP + Apache)**
- **mysql (MySQL 8)**

Ambos servicios se comunican a través de una red interna de Docker definida en `docker-compose.yml`.

---

## 🧰 Tecnologías utilizadas

- Docker
- Docker Compose
- PHP 8.2 (Apache)
- MySQL 8
- Linux (Ubuntu Server)

---

## 🚀 Funcionalidades

- Despliegue automatizado con Docker Compose
- Comunicación entre contenedores en red interna
- Conexión de PHP con MySQL mediante mysqli
- Persistencia de datos mediante volúmenes Docker
- Imagen personalizada de PHP con extensión MySQL habilitada

---

## 🧪 Cómo ejecutar el proyecto

```bash
git clone git@github.com:gonx19/docker-php-mysql-lab.git
cd docker-php-mysql-lab
docker compose up -d --build
