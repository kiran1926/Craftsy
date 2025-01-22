# ![Craftsy Logo](https://github.com/kiran1926/Craftsy/blob/main/src/main/webapp/pub/images/forgit/file.png?raw=true) Craftsy

## 📖 Overview
Welcome to **"Craftsy- handmade with love"** a dedicated online marketplace for cultural and traditional handicrafts. The platform connects **artisans** with a global audience, offering a diverse range of products, including pottery, bamboo artifacts, paintings, sculptures, wall hangings, and other unique creations that celebrate heritage and craftsmanship.

**Craftsy** is built on a foundation of **clean architecture and industry best practices,** ensuring a structured, maintainable, and efficient system. With robust validation mechanisms, secure transactions, and built on **MVC** architecture giving an intuitive user interface, the platform delivers a seamless experience for both buyers and sellers.

Whether you are **an artisan showcasing your work** or **a customer exploring authentic handicrafts**, Craftsy is designed to meet your needs with reliability and professionalism.

## 🏗️ Technologies Used
 **Backend:**  Java 21, Spring/Spring Boot(combined of MVC model & RESTful API), Hibernate, Spring Security
                ,Spring Data JPA, Lombok

**Frontend:** HTML5, CSS3, JavaScript(jQuery), JSP, Bootstrap

**Database:** MySQL

**Security:** Spring Security, BCrypt for secure password hashing

**Testing:** JUnit

**Build & Deployment:** Maven

## ER Diagram 
![ER-Diag](https://github.com/kiran1926/Craftsy/blob/main/src/main/webapp/pub/images/forgit/ER-diag.png?raw=true)

## ✨ Features
### 🔑 Authentication & User Management
- **Login, Sign Up, and Logout** with proper validation
- Role-based access: **ARTISAN**, **CUSTOMER**, and **ADMIN** roles
- **Admins** can:
    - View platform statistics
    - Manage users (promote to ARTISAN or ADMIN, deactivate, activate, delete users)
    - Manage products (create, delete or update Product categories, products)

### 🛒 Product Management
#### For Artisans:
- **Create handmade products** to sell with details like name, category, description, price, stock quantity, and an image
- **Edit existing products**
- **Delete products**

#### For Customers:
- **Browse products by category or search by name**
- **View product details**
- **Add products to cart**
- **Purchase products securely**

### 🛠️ Admin Panel
- **Admin Dashboard :**
- Products categories and status
- Order Reports with status as **CART** or **PLACED**
- Product listing and sales statistics
- Number of active/inactive users

### ✅ Custom Validations
- Unique email check during registration
- Form validation with regex patterns (e.g., passwords, emails)
- Input validation to prevent empty or invalid submissions

### 🖼️ Artisan Can:
**Artisan** is a seller of traditional handicrafts. They can:
- Create products to sell
- Edit their existing products
- Delete products that are no longer available

### Screenshots : 
- **Homepage:**
  - ![Homepage](https://github.com/kiran1926/Craftsy/blob/main/src/main/webapp/pub/images/forgit/homepage.png?raw=true)
  
- **Homepage1:**
  - ![Homepage](https://github.com/kiran1926/Craftsy/blob/main/src/main/webapp/pub/images/forgit/homepage-2.png?raw=true)

- **Products:**
  - ![products](https://github.com/kiran1926/Craftsy/blob/main/src/main/webapp/pub/images/forgit/products.png?raw=true)

- **View-Product:**
  - ![product-details](https://github.com/kiran1926/Craftsy/blob/main/src/main/webapp/pub/images/forgit/product-view.png?raw=true)

- **Cart:**
  - ![cart](https://github.com/kiran1926/Craftsy/blob/main/src/main/webapp/pub/images/forgit/cart.png?raw=true)
  
- **Checkout:**
    - ![checkout](https://github.com/kiran1926/Craftsy/blob/main/src/main/webapp/pub/images/forgit/checkout.png?raw=true)

- **Admin Dashboard:**
  - ![admin](https://github.com/kiran1926/Craftsy/blob/main/src/main/webapp/pub/images/forgit/admin-dashboard.png?raw=true)
## 🚀 Setup Instructions
1. Clone this repository:
   ```bash
   git clone <repository-url>
   cd craftsy
