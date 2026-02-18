# 🛒 SalesSavvy

> A Full-Stack eCommerce Application built with Spring Boot, React & Docker

SalesSavvy is a production-style eCommerce platform built using **Spring Boot (Java 17)**, **React (Vite)**, and **MySQL**.  
The application follows a REST-based layered architecture and is fully containerized using **Docker** and orchestrated via **Docker Compose**.

It includes authentication, cart management, payment integration, admin analytics, and AWS cloud storage integration.

---

## 🚀 Tech Stack

| Layer        | Technology Used |
|-------------|-----------------|
| Backend     | Spring Boot (Java 17) |
| Frontend    | React (Vite) + NGINX |
| Database    | MySQL 8 |
| Auth        | JWT (JSON Web Token) |
| Payments    | Razorpay API (UPI & Online) |
| Storage     | AWS S3 (Product Images) |
| DevOps      | Docker & Docker Compose |

---

## 🧱 Architecture

- RESTful API communication
- Layered Architecture:
  - Controller Layer
  - Service Layer
  - Repository Layer
- JWT-based Authentication & Authorization
- Separate modules for:
  - 👤 Customer Services
  - 🛠️ Admin Services
- AWS S3 for image storage
- Docker Compose for multi-container orchestration

---

## 👤 Customer Features

- User Registration & Login
- JWT Authentication
- View & Filter Products
- Add to Cart
- Place Orders
- Razorpay Payment Integration
- UPI & Online Payments
- Order History Tracking

---

## 🛠️ Admin Features

- Add / Update Products
- Modify Pricing
- Upload Product Images (AWS S3)
- Monthly Sales Monitoring
- Customer Purchase Insights
- Sales Growth Analytics Dashboard

---

# 📸 Project Screenshots

---

## 🔐 Admin Module

### Admin Login
<p align="center">
  <img src="https://raw.githubusercontent.com/Soumyajit-Paramanick/SalesSavvy/main/screenshots/admin_login.png" width="75%" />
</p>

### Admin Dashboard
<p align="center">
  <img src="https://raw.githubusercontent.com/Soumyajit-Paramanick/SalesSavvy/main/screenshots/admindashboard1.png" width="45%" />
  <img src="https://raw.githubusercontent.com/Soumyajit-Paramanick/SalesSavvy/main/screenshots/admindashboard2.png" width="45%" />
</p>

---

## 👤 Customer Module

### Registration & Login
<p align="center">
  <img src="https://raw.githubusercontent.com/Soumyajit-Paramanick/SalesSavvy/main/screenshots/customer_registration.png" width="45%" />
  <img src="https://raw.githubusercontent.com/Soumyajit-Paramanick/SalesSavvy/main/screenshots/customer_login.png" width="45%" />
</p>

### Customer Home
<p align="center">
  <img src="https://raw.githubusercontent.com/Soumyajit-Paramanick/SalesSavvy/main/screenshots/customerhome.png" width="75%" />
</p>

### Cart & Orders
<p align="center">
  <img src="https://raw.githubusercontent.com/Soumyajit-Paramanick/SalesSavvy/main/screenshots/UserCartPage.png" width="45%" />
  <img src="https://raw.githubusercontent.com/Soumyajit-Paramanick/SalesSavvy/main/screenshots/order_history.png" width="45%" />
</p>

---

## 💳 Payment Flow

### Payment Processing
<p align="center">
  <img src="https://raw.githubusercontent.com/Soumyajit-Paramanick/SalesSavvy/main/screenshots/confirming_payment.png" width="75%" />
</p>

### Successful Payment
<p align="center">
  <img src="https://raw.githubusercontent.com/Soumyajit-Paramanick/SalesSavvy/main/screenshots/successfull_payment.png" width="75%" />
</p>

---

## 🐳 Docker Setup

### Docker Compose Running
<p align="center">
  <img src="https://raw.githubusercontent.com/Soumyajit-Paramanick/SalesSavvy/main/screenshots/docker-setup.png" width="75%" />
</p>

### Docker Hub Image
<p align="center">
  <img src="https://raw.githubusercontent.com/Soumyajit-Paramanick/SalesSavvy/main/screenshots/docker_hub_setup.png" width="75%" />
</p>

---

## 🐳 Docker Images

Backend:
```
soumyajitparamanick96419/salessavvy-backend:v4
```

Frontend:
```
soumyajitparamanick96419/salessavvy-frontend:latest
```

---

## 📂 Project Structure

```
SalesSavvy/
├── Sales_Savvy_Backend/
├── Sales_Savvy_Frontend/
├── Sales_Savvy_Database/
├── docker-compose.yml
└── README.md
```

---

# 🧪 Running The Project

### 1️⃣ Clone Repository

```
git clone https://github.com/Soumyajit-Paramanick/SalesSavvy.git
cd SalesSavvy
```

---

### 2️⃣ Clean Docker Environment (Optional)

```
docker compose down -v
docker system prune -f
```

---

### 3️⃣ Build & Run

Foreground:
```
docker compose up --build
```

Background:
```
docker compose up -d --build
```

Stop:
```
docker compose down
```

---

## 🌐 Access Application

Frontend:
```
http://localhost:5173
```

Backend API:
```
http://localhost:8080
```

---

## 🔐 REST API Design

- Spring Boot REST Controllers
- Business Logic in Service Layer
- Repository Layer with JPA
- JWT Filter for secured endpoints
- Separate Admin & Customer APIs

---

## ☁️ Cloud & Payment Integration

- Product images stored securely in AWS S3
- Razorpay API used for payment processing
- Supports UPI & Online transactions
- Secure backend-side payment verification

---

## 👨‍💻 Author

**Soumyajit Paramanick**  
Full Stack Developer | Java | Spring Boot | React | Docker | AWS
