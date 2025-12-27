# Smart Budget Manager - Cloud Deployment Project 💰☁️

![Docker](https://img.shields.io/badge/Docker-2496ED?style=for-the-badge&logo=docker&logoColor=white)
![Azure](https://img.shields.io/badge/Microsoft_Azure-0089D6?style=for-the-badge&logo=microsoft-azure&logoColor=white)
![Laravel](https://img.shields.io/badge/Laravel-FF2D20?style=for-the-badge&logo=laravel&logoColor=white)
![React](https://img.shields.io/badge/React-20232A?style=for-the-badge&logo=react&logoColor=61DAFB)
![MySQL](https://img.shields.io/badge/MySQL-005C84?style=for-the-badge&logo=mysql&logoColor=white)

A full-stack personal finance management application deployed on Microsoft Azure using containerized microservices architecture. This project demonstrates modern cloud computing practices including containerization, orchestration, and distributed systems design.

## 📋 Table of Contents

- [Project Overview](#-project-overview)
- [Architecture](#-architecture)
- [Cloud Infrastructure](#️-cloud-infrastructure)
- [Features](#-features)
- [Technology Stack](#-technology-stack)
- [Prerequisites](#-prerequisites)
- [Local Development](#-local-development)
- [Deployment](#-deployment)
- [API Documentation](#-api-documentation)
- [Project Structure](#-project-structure)
- [Contributing](#-contributing)
- [License](#-license)

## 🎯 Project Overview

Smart Budget Manager is a comprehensive personal finance application that helps users track their spending, manage budgets, and gain insights into their financial habits. The application is built using a microservices architecture with separate frontend and backend services, containerized using Docker and deployed on Microsoft Azure.

### Key Objectives

- **Budget Tracking**: Create and monitor budgets across different categories
- **Transaction Management**: Record and categorize income and expenses
- **Financial Analytics**: Visualize spending patterns with interactive charts
- **Forecasting**: Predict future spending based on historical data
- **Multi-Account Support**: Manage multiple bank accounts and cards
- **Secure Authentication**: JWT-based authentication with Laravel Sanctum

## 🏗️ Architecture

The application follows a **3-tier microservices architecture**:

```
┌─────────────────────────────────────────────────────────────┐
│                    Client Layer (Browser)                    │
└─────────────────────────────────────────────────────────────┘
                              │
                              ▼
┌─────────────────────────────────────────────────────────────┐
│              Frontend Service (React + Vite)                 │
│                    Port: 5173                                │
│  - Clean Architecture (Domain, Data, Presentation)           │
│  - Context API for State Management                          │
│  - Responsive UI with Tailwind CSS                           │
└─────────────────────────────────────────────────────────────┘
                              │
                              ▼
┌─────────────────────────────────────────────────────────────┐
│              Backend Service (Laravel API)                   │
│                    Port: 8000                                │
│  - RESTful API with Laravel 12                               │
│  - Domain-Driven Design (DDD)                                │
│  - Repository Pattern                                        │
│  - Laravel Sanctum Authentication                            │
└─────────────────────────────────────────────────────────────┘
                              │
                              ▼
┌─────────────────────────────────────────────────────────────┐
│              Database Service (MySQL 8.0)                    │
│                    Port: 3306                                │
│  - Persistent Volume Storage                                 │
│  - Health Checks & Auto-recovery                             │
└─────────────────────────────────────────────────────────────┘
```

### Design Patterns Implemented

- **Clean Architecture**: Separation of concerns with Domain, Data, and Presentation layers
- **Repository Pattern**: Abstraction of data access logic
- **Domain-Driven Design (DDD)**: Business logic encapsulated in domain entities and use cases
- **Service Layer**: Business logic separated from controllers
- **DTO Pattern**: Data Transfer Objects for API communication

## ☁️ Cloud Infrastructure

### Microsoft Azure Services Used

This project is deployed on **Microsoft Azure** utilizing the following services:

#### 1. **Azure Container Instances (ACI)** / **Azure Kubernetes Service (AKS)**
- Hosts the containerized frontend, backend, and database services
- Provides automatic scaling and load balancing
- Ensures high availability with health checks

#### 2. **Azure Container Registry (ACR)**
- Private Docker registry for storing application images
- Secure image management with role-based access control
- Integration with CI/CD pipelines

#### 3. **Azure Database for MySQL** (Production)
- Managed MySQL database service
- Automated backups and point-in-time restore
- Built-in high availability and security

#### 4. **Azure Virtual Network (VNet)**
- Isolated network environment for services
- Private communication between containers
- Network security groups for access control

#### 5. **Azure Load Balancer**
- Distributes incoming traffic across multiple instances
- Ensures application availability and reliability

#### 6. **Azure Monitor & Application Insights**
- Real-time monitoring of application performance
- Log aggregation and analysis
- Alerts for critical issues

### Infrastructure Highlights

- **Containerization**: All services packaged as Docker containers for consistency across environments
- **Orchestration**: Docker Compose for local development, Azure orchestration for production
- **Scalability**: Horizontal scaling capabilities for handling increased load
- **Security**: Network isolation, secure environment variables, and encrypted connections
- **High Availability**: Health checks and automatic container restart on failure

## ✨ Features

### User Management
- ✅ Secure user registration and authentication
- ✅ JWT token-based session management
- ✅ Password reset functionality
- ✅ Email verification

### Account Management
- ✅ Create and manage multiple accounts (bank, card, cash)
- ✅ Multi-currency support
- ✅ Real-time balance tracking
- ✅ Account notes and categorization

### Transaction Tracking
- ✅ Record income and expenses
- ✅ Categorize transactions
- ✅ Recurring transaction support
- ✅ Transaction history with filtering
- ✅ Search and sort capabilities

### Budget Management
- ✅ Create budgets by category
- ✅ Set time-based budget periods
- ✅ Track budget utilization
- ✅ Visual budget progress indicators
- ✅ Budget alerts and notifications

### Analytics & Reporting
- ✅ Interactive spending charts (Recharts)
- ✅ Category-wise expense breakdown
- ✅ Monthly/yearly spending trends
- ✅ Export reports to PDF
- ✅ Financial forecasting based on historical data

### User Experience
- ✅ Responsive design for mobile and desktop
- ✅ Modern UI with Tailwind CSS
- ✅ Smooth animations with Framer Motion
- ✅ Real-time toast notifications
- ✅ Dark mode support (optional)

## 🛠️ Technology Stack

### Frontend (React Application)
```json
{
  "framework": "React 19",
  "build_tool": "Vite 6.3",
  "styling": "Tailwind CSS 4.1",
  "routing": "React Router DOM 7.5",
  "state_management": "Context API",
  "http_client": "Axios 1.9",
  "charts": "Recharts 2.15",
  "forms": "Formik 2.4 + Yup 1.6",
  "animations": "Framer Motion 12.9",
  "notifications": "React Hot Toast 2.5",
  "pdf_generation": "jsPDF 3.0 + html2canvas 1.4"
}
```

### Backend (Laravel API)
```json
{
  "framework": "Laravel 12",
  "php_version": "8.2",
  "authentication": "Laravel Sanctum 4.1",
  "database_orm": "Eloquent ORM",
  "testing": "PHPUnit 11.5",
  "code_quality": "Laravel Pint 1.13",
  "api_testing": "Laravel Breeze"
}
```

### Database
- **MySQL 8.0**: Relational database for data persistence
- **Schema**: Users, Accounts, Transactions, Budgets, Categories, Recurring Transactions

### DevOps & Infrastructure
- **Docker**: Containerization platform
- **Docker Compose**: Multi-container orchestration
- **Azure**: Cloud hosting platform
- **Git**: Version control
- **GitHub**: Code repository and collaboration

## 📦 Prerequisites

Before running this project locally, ensure you have the following installed:

- **Docker Desktop** (v20.10 or higher)
- **Docker Compose** (v2.0 or higher)
- **Git** (v2.30 or higher)
- **Node.js** (v18 or higher) - for local frontend development
- **PHP** (v8.2 or higher) - for local backend development
- **Composer** (v2.0 or higher) - for PHP dependency management

## 🚀 Local Development

### 1. Clone the Repository

```bash
git clone https://github.com/HossamAladin/Cloud-Project.git
cd Cloud-Project
```

### 2. Environment Configuration

#### Backend Configuration
Create a `.env` file in the `Smart-Budget-Manager-main` directory:

```env
APP_NAME="Smart Budget Manager"
APP_ENV=local
APP_KEY=base64:YOUR_APP_KEY_HERE
APP_DEBUG=true
APP_URL=http://localhost:8000

DB_CONNECTION=mysql
DB_HOST=mysql
DB_PORT=3306
DB_DATABASE=smartbudgetmanager
DB_USERNAME=smartbudget
DB_PASSWORD=SmartBudget2024!

SANCTUM_STATEFUL_DOMAINS=localhost:5173
SESSION_DRIVER=cookie
```

#### Frontend Configuration
Create a `.env` file in the `Cloud-project` directory:

```env
VITE_API_URL=http://localhost:8000/api
```

### 3. Build and Run with Docker Compose

```bash
# Build all containers
docker-compose build

# Start all services
docker-compose up -d

# View logs
docker-compose logs -f

# Check service status
docker-compose ps
```

### 4. Database Setup

```bash
# Access the backend container
docker-compose exec backend bash

# Run migrations
php artisan migrate

# (Optional) Seed the database
php artisan db:seed

# Exit container
exit
```

### 5. Access the Application

- **Frontend**: http://localhost:5173
- **Backend API**: http://localhost:8000/api
- **MySQL Database**: localhost:3306

### 6. Stop the Application

```bash
# Stop all services
docker-compose down

# Stop and remove volumes (⚠️ deletes database data)
docker-compose down -v
```

## 🌐 Deployment

### Azure Deployment Steps

#### 1. **Prepare Azure Resources**

```bash
# Login to Azure
az login

# Create resource group
az group create --name smart-budget-rg --location eastus

# Create Azure Container Registry
az acr create --resource-group smart-budget-rg \
  --name smartbudgetacr --sku Basic

# Login to ACR
az acr login --name smartbudgetacr
```

#### 2. **Build and Push Docker Images**

```bash
# Tag images for ACR
docker tag cloud-project-frontend:latest smartbudgetacr.azurecr.io/frontend:latest
docker tag cloud-project-backend:latest smartbudgetacr.azurecr.io/backend:latest

# Push images to ACR
docker push smartbudgetacr.azurecr.io/frontend:latest
docker push smartbudgetacr.azurecr.io/backend:latest
```

#### 3. **Deploy to Azure Container Instances**

```bash
# Deploy frontend
az container create \
  --resource-group smart-budget-rg \
  --name frontend \
  --image smartbudgetacr.azurecr.io/frontend:latest \
  --dns-name-label smart-budget-frontend \
  --ports 5173

# Deploy backend
az container create \
  --resource-group smart-budget-rg \
  --name backend \
  --image smartbudgetacr.azurecr.io/backend:latest \
  --dns-name-label smart-budget-backend \
  --ports 8000 \
  --environment-variables \
    DB_HOST=<azure-mysql-host> \
    DB_DATABASE=smartbudgetmanager \
    DB_USERNAME=<username> \
    DB_PASSWORD=<password>
```

#### 4. **Configure Azure Database for MySQL**

```bash
# Create MySQL server
az mysql flexible-server create \
  --resource-group smart-budget-rg \
  --name smart-budget-mysql \
  --admin-user adminuser \
  --admin-password <secure-password> \
  --sku-name Standard_B1ms \
  --tier Burstable \
  --version 8.0

# Create database
az mysql flexible-server db create \
  --resource-group smart-budget-rg \
  --server-name smart-budget-mysql \
  --database-name smartbudgetmanager
```

### Continuous Deployment

For automated deployments, you can set up GitHub Actions or Azure DevOps pipelines:

1. **Build** Docker images on code push
2. **Test** application with automated tests
3. **Push** images to Azure Container Registry
4. **Deploy** updated containers to Azure
5. **Monitor** deployment health and rollback if needed

## 📚 API Documentation

### Authentication Endpoints

| Method | Endpoint | Description |
|--------|----------|-------------|
| POST | `/api/register` | Register a new user |
| POST | `/api/login` | Login and receive token |
| POST | `/api/logout` | Logout and invalidate token |
| POST | `/api/forgot-password` | Request password reset |
| POST | `/api/reset-password` | Reset password with token |

### Account Endpoints

| Method | Endpoint | Description | Auth Required |
|--------|----------|-------------|---------------|
| GET | `/api/accounts` | Get all user accounts | ✅ |
| GET | `/api/accounts/{id}` | Get specific account | ✅ |
| POST | `/api/accounts` | Create new account | ✅ |
| PUT | `/api/accounts/{id}` | Update account | ✅ |
| DELETE | `/api/accounts/{id}` | Delete account | ✅ |

### Transaction Endpoints

| Method | Endpoint | Description | Auth Required |
|--------|----------|-------------|---------------|
| GET | `/api/transactions` | Get all transactions | ✅ |
| GET | `/api/transactions/{id}` | Get specific transaction | ✅ |
| POST | `/api/transactions` | Create transaction | ✅ |
| PUT | `/api/transactions/{id}` | Update transaction | ✅ |
| DELETE | `/api/transactions/{id}` | Delete transaction | ✅ |

### Budget Endpoints

| Method | Endpoint | Description | Auth Required |
|--------|----------|-------------|---------------|
| GET | `/api/budgets` | Get all budgets | ✅ |
| GET | `/api/budgets/{id}` | Get specific budget | ✅ |
| POST | `/api/budgets` | Create budget | ✅ |
| PUT | `/api/budgets/{id}` | Update budget | ✅ |
| DELETE | `/api/budgets/{id}` | Delete budget | ✅ |
| GET | `/api/forecast` | Get spending forecast | ✅ |
| GET | `/api/categories` | Get all categories | ✅ |

### Request/Response Examples

#### Register User
```bash
POST /api/register
Content-Type: application/json

{
  "name": "John Doe",
  "email": "john@example.com",
  "password": "SecurePass123!",
  "password_confirmation": "SecurePass123!"
}
```

#### Create Transaction
```bash
POST /api/transactions
Authorization: Bearer {token}
Content-Type: application/json

{
  "account_id": 1,
  "category_id": 2,
  "type": "expense",
  "amount": 50.00,
  "description": "Grocery shopping",
  "date": "2025-12-27"
}
```

## 📁 Project Structure

```
Cloud-Project/
├── Cloud-project/                    # Frontend React Application
│   ├── src/
│   │   ├── Context/                  # React Context for state management
│   │   │   ├── authContext.js        # Authentication context
│   │   │   └── BudgetContext.js      # Budget state management
│   │   ├── domain/                   # Domain layer (Clean Architecture)
│   │   │   ├── entities/             # Business entities
│   │   │   ├── repositories/         # Repository interfaces
│   │   │   └── useCases/             # Business use cases
│   │   ├── data/                     # Data layer
│   │   │   └── repositories/         # Repository implementations
│   │   ├── infrastructure/           # Infrastructure layer
│   │   │   └── services/             # External services (API, etc.)
│   │   ├── presentation/             # Presentation layer
│   │   │   ├── components/           # Reusable UI components
│   │   │   ├── pages/                # Page components
│   │   │   │   ├── Login.jsx
│   │   │   │   ├── Register.jsx
│   │   │   │   ├── Dashbord.jsx
│   │   │   │   ├── Transactions.jsx
│   │   │   │   ├── Wallet.jsx
│   │   │   │   ├── Budget.jsx
│   │   │   │   ├── Report.jsx
│   │   │   │   └── FRC.jsx          # Forecast page
│   │   │   ├── hooks/                # Custom React hooks
│   │   │   └── Routes/               # Route configuration
│   │   ├── utilis/                   # Utility functions
│   │   ├── App.jsx                   # Main App component
│   │   └── main.jsx                  # Entry point
│   ├── Dockerfile                    # Frontend container configuration
│   ├── package.json                  # Node dependencies
│   ├── vite.config.js                # Vite configuration
│   └── tailwind.config.js            # Tailwind CSS configuration
│
├── Smart-Budget-Manager-main/        # Backend Laravel API
│   ├── app/
│   │   ├── Application/              # Application layer (DDD)
│   │   │   ├── Auth/                 # Authentication logic
│   │   │   ├── DTOs/                 # Data Transfer Objects
│   │   │   └── Services/             # Application services
│   │   ├── Domain/                   # Domain layer (DDD)
│   │   │   ├── Entities/             # Domain entities
│   │   │   ├── Repositories/         # Repository interfaces
│   │   │   └── User/                 # User domain logic
│   │   ├── Infrastructure/           # Infrastructure layer
│   │   │   └── Repositories/         # Repository implementations
│   │   ├── Http/
│   │   │   ├── Controllers/          # API controllers
│   │   │   ├── Middleware/           # HTTP middleware
│   │   │   └── Requests/             # Form requests
│   │   └── Models/                   # Eloquent models
│   │       ├── User.php
│   │       ├── Account.php
│   │       ├── Transaction.php
│   │       ├── Budget.php
│   │       ├── Category.php
│   │       └── RecurringTransaction.php
│   ├── database/
│   │   ├── migrations/               # Database migrations
│   │   └── seeders/                  # Database seeders
│   ├── routes/
│   │   ├── api.php                   # API routes
│   │   └── web.php                   # Web routes
│   ├── Dockerfile                    # Backend container configuration
│   ├── composer.json                 # PHP dependencies
│   └── smartbudgetmanager.sql        # Database schema
│
├── docker-compose.yml                # Multi-container orchestration
└── README.md                         # This file
```

## 🤝 Contributing

Contributions are welcome! Please follow these steps:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

### Development Guidelines

- Follow PSR-12 coding standards for PHP
- Use ESLint configuration for JavaScript/React
- Write meaningful commit messages
- Add tests for new features
- Update documentation as needed

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 👥 Authors

- **Hossam Aladin** - [GitHub Profile](https://github.com/HossamAladin)

## 🙏 Acknowledgments

- Laravel Framework for the robust backend API
- React and Vite for the modern frontend experience
- Docker for containerization simplicity
- Microsoft Azure for reliable cloud infrastructure
- Open source community for amazing libraries and tools


