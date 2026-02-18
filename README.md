# 🛒 SalesSavvy

SalesSavvy is a full-stack eCommerce application built using **Spring Boot**, **React**, and **MySQL**.  
The system follows a REST-based architecture and is fully containerized using **Docker** and orchestrated with **Docker Compose** for seamless multi-container deployment.

It demonstrates real-world eCommerce functionality including authentication, cart management, payment integration, admin analytics, and cloud storage integration.

---

## 🚀 Tech Stack

- **Backend:** Spring Boot (Java 17)
- **Frontend:** React (Vite) + NGINX
- **Database:** MySQL 8
- **Authentication:** JWT (JSON Web Token)
- **Containerization:** Docker & Docker Compose
- **Cloud Storage:** AWS S3 (Product Images)
- **Payment Gateway:** Razorpay API (UPI & Online Payments)

---

## 🧱 Architecture Overview

- REST APIs used for frontend-backend communication
- Layered architecture:
  - Controller Layer
  - Service Layer
  - Repository Layer
- Separate service modules for:
  - Admin
  - Customer
- JWT-based authentication and authorization
- MySQL for transactional data
- AWS S3 for storing product images
- Docker Compose manages backend, frontend, and database containers

---

## 👤 Customer Features

- User Registration & Login
- JWT Authentication
- View Products
- Category Filtering
- Add Products to Cart
- Place Orders
- Multiple Payment Options:
  - UPI
  - Razorpay Payment Gateway
- Order Tracking

---

## 🛠️ Admin Features

- Add New Products
- Modify Product Cost
- Upload Product Images (Stored in AWS S3)
- View Monthly Sales
- Track Customer Purchases
- Monitor Sales Growth Over Time
- Business Performance Analytics Dashboard

---

## 🐳 Docker Images

**Backend Image**
```
soumyajitparamanick96419/salessavvy-backend:v4
```

**Frontend Image**
```
soumyajitparamanick96419/salessavvy-frontend:latest
```
---

## 📂 Project Structure
```
SalesSavvy/
│
├── Sales_Savvy_Backend/
├── Sales_Savvy_Frontend/
├── Sales_Savvy_Database/
├── docker-compose.yml
└── README.md
```
---

# 🧪 Running The Project

## 1️⃣ Clone Repository
```
git clone https://github.com/Soumyajit-Paramanick/SalesSavvy.git

cd SalesSavvy
```
---

## 2️⃣ Clean Docker Environment (Recommended)
```
Stop and remove containers, networks, and volumes:

docker compose down -v

Remove unused images:

docker system prune -f
```
---

## 3️⃣ Build & Run (Foreground Mode)

```
docker compose up --build
```
---

## 4️⃣ Run In Background (Detached Mode)
```
docker compose up -d --build
```
---

## 5️⃣ Stop Containers
```
docker compose down
```
---

## 🌐 Access The Application

Frontend:

http://localhost:5173

Backend API:

http://localhost:8080

---

## 🔐 REST API Design

- RESTful endpoints implemented using Spring Boot
- Controllers handle HTTP requests
- Service layer manages business logic
- Repository layer interacts with MySQL
- JWT filter secures protected endpoints
- Separate endpoints for Admin and Customer modules

---

## ☁️ Cloud & Payment Integration

- Product images securely stored in AWS S3 bucket
- Payment processing handled via Razorpay API
- Supports UPI and online payment methods
- Secure backend-side payment verification

---

## 👨‍💻 Author

**Soumyajit Paramanick**  
Full Stack Developer | Java | Spring Boot | React | Docker | AWS

