# 🎓 PNZP EduTrack v1.0

<p align="center">
  <h3 align="center">School Management System</h3>
  <p align="center">
    A comprehensive web-based School Management System developed using Java, Servlets, JSP, JDBC, and MySQL to simplify academic and administrative operations.
  </p>
</p>

---

# 📖 Overview

**PNZP EduTrack v1.0** is a full-featured School Management System designed to digitize and streamline day-to-day school operations. The application provides a centralized platform for managing students, teachers, departments, classes, examinations, marks, and fee records while following the MVC architecture for clean code organization.

The system reduces manual paperwork, improves administrative efficiency, and enables secure data management through role-based modules and MySQL database integration.

---

# 🚀 Key Features

### 👨‍🎓 Student Management

* Add, Update, Delete and View Student Details
* Student Profile Management
* Department & Class Assignment

### 👩‍🏫 Teacher Management

* Manage Teacher Records
* Department Allocation
* Teacher Information Management

### 🏫 Department & Class Management

* Department Creation
* Class Management
* Student-Class Mapping

### 📝 Examination & Marks

* Create Exams
* Manage Student Marks
* View Academic Performance

### 💰 Fee Management

* Student Fee Records
* Fee Status Tracking
* Payment History

### 🔐 Authentication

* Secure Login System
* Session Management
* Authentication using Servlets

### 📊 Dashboard

* Overview of School Statistics
* Quick Navigation
* User-friendly Interface

### 🗄 Database Integration

* JDBC Connectivity
* CRUD Operations
* PreparedStatement Implementation

---

# 🛠️ Technology Stack

## 💻 Programming Language

![Java](https://img.shields.io/badge/Java-17-orange?style=for-the-badge&logo=openjdk)

---

## 🎨 Frontend

![HTML5](https://img.shields.io/badge/HTML5-E34F26?style=for-the-badge&logo=html5&logoColor=white)
![CSS3](https://img.shields.io/badge/CSS3-1572B6?style=for-the-badge&logo=css3&logoColor=white)
![Bootstrap](https://img.shields.io/badge/Bootstrap-7952B3?style=for-the-badge&logo=bootstrap&logoColor=white)
![JSP](https://img.shields.io/badge/JSP-Java_Server_Pages-orange?style=for-the-badge)

---

## ⚙️ Backend

![Java Servlet](https://img.shields.io/badge/Java-Servlet-blue?style=for-the-badge)
![JDBC](https://img.shields.io/badge/JDBC-Database_Connectivity-red?style=for-the-badge)

---

## 🗄️ Database

![MySQL](https://img.shields.io/badge/MySQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white)

---

## 🛠️ IDE & Server

![Eclipse IDE](https://img.shields.io/badge/Eclipse_IDE-2C2255?style=for-the-badge&logo=eclipseide&logoColor=white)
![Apache Tomcat](https://img.shields.io/badge/Apache_Tomcat-F8DC75?style=for-the-badge&logo=apachetomcat&logoColor=black)

---

## 🔧 Version Control

![Git](https://img.shields.io/badge/Git-F05032?style=for-the-badge&logo=git&logoColor=white)
![GitHub](https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=github&logoColor=white)

---

# 🏗 Architecture

The project follows the **MVC (Model-View-Controller)** Architecture.

```
Client (Browser)
        │
        ▼
      JSP Pages
        │
        ▼
   Servlet Controllers
        │
        ▼
 Business Logic Layer
        │
        ▼
      JDBC Layer
        │
        ▼
      MySQL Database
```

---

# 📂 Project Structure

```
EduTrack/
│
├── src/
│   ├── controller/
│   ├── dao/
│   ├── model/
│   ├── utility/
│   └── servlet/
│
├── WebContent/
│   ├── jsp/
│   ├── css/
│   ├── js/
│   ├── images/
│   └── WEB-INF/
│
├── database/
│   └── schema.sql
│
├── lib/
│
└── README.md
```

---

# 🗄 Database Tables

* Department
* Classes
* Student
* Teacher
* Subject
* Enrollment
* Exam
* Marks
* Fees

---

# ✨ Core Functionalities

* Student Registration
* Teacher Registration
* Department Management
* Class Management
* Subject Management
* Student Enrollment
* Examination Management
* Marks Management
* Fee Management
* CRUD Operations
* Session Handling
* Form Validation
* Responsive User Interface

---

# 🔒 Security Features

* Session-Based Authentication
* Login Validation
* PreparedStatement (SQL Injection Prevention)
* MVC Architecture
* Exception Handling
* Input Validation

---

# 📈 Future Enhancements

* Attendance Management
* Parent Portal
* Teacher Portal
* Student Portal
* Report Card Generation
* Email Notifications
* SMS Alerts
* PDF Report Generation
* Spring Boot Migration
* REST API Integration

---

# 💻 Installation

### Clone Repository

```bash
git clone https://github.com/YOUR_USERNAME/EduTrack.git
```

### Import Project

* Open Eclipse IDE
* Import Existing Dynamic Web Project
* Configure Apache Tomcat Server

### Database Setup

* Install MySQL
* Create Database

```sql
CREATE DATABASE tellabadu_school_db;
```

* Execute the provided SQL script.

### Run Application

* Start Apache Tomcat
* Deploy Project
* Open Browser

```
http://localhost:8080/EduTrack
```

---

# 🎯 Learning Outcomes

Through this project, I gained hands-on experience in:

* Core Java
* Advanced Java (Servlets & JSP)
* JDBC
* MVC Architecture
* MySQL Database Design
* CRUD Operations
* Session Management
* Bootstrap Responsive UI
* Git & GitHub Version Control

---

# 👨‍💻 Developer

## Yaswanth Gurindapalli

**Java Full Stack Developer**

📧 Email: [yashvarmagurindapalli@gmail.com](mailto:yashvarmagurindapalli@gmail.com)

🔗 GitHub: https://github.com/Yash8127

---

# ⭐ If you found this project helpful, consider giving it a Star on GitHub!

Thank you for visiting my repository!
