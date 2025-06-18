# 🎬 Movie-Ticket-Booking-System-using-MySQL-Workbench

The **Movie Ticket Booking System** is a relational database project built using **MySQL Workbench** to model and manage the operations of a movie theater booking platform. It includes complete schema creation, sample data insertion, and real-world SQL queries for customer behavior, bookings, and showtime insights.

This system is designed to efficiently manage **movie schedules**, **customer bookings**, and **theater operations**. It comprises six interrelated tables—**Movies**, **Theaters**, **Screens**, **Showtimes**, **Customers**, and **Bookings**—that represent the core entities in a typical cinema environment. The project demonstrates essential **SQL concepts** such as data organization, relational integrity, and advanced querying techniques, offering a practical approach to understanding **database management in real-world entertainment scenarios**.

---

## 📦 Project Highlights

- Models a real-world cinema system with **6 relational tables**
- Implements **foreign key relationships** and data normalization
- Provides **practical SQL queries** for movie trends, bookings, and theater analytics
- Includes **sample data** to simulate realistic operations
- Offers a **view** for summarized booking insights

---

## 🧱 Database Schema Design

The database includes the following tables:

| Table        | Description                                      |
|--------------|--------------------------------------------------|
| `Movies`     | Stores movie titles, genre, release year, and duration |
| `Theaters`   | Contains theater names and their locations       |
| `Screens`    | Tracks screens under each theater                |
| `Showtimes`  | Maps movies to specific screens and time slots   |
| `Customers`  | Customer registration details                    |
| `Bookings`   | Records seat bookings with showtime link         |

---

## 💾 Files in This Repository

| File Name                              | Description                              |
|----------------------------------------|------------------------------------------|
| `Movie Ticket Booking System.sql`      | Main SQL file: schema + inserts + queries|
| `Movie Ticket Booking System.mwb`      | MySQL Workbench ER model (visual design) |
| `README.md`                            | Documentation and project overview       |
| `Movie Ticket Booking Database System (SQL).md` | Optional write-up or extended notes |

---

## 🧠 Sample SQL Use Cases

Here are some of the insightful queries included:

- 🎟️ Find most booked movies and their booking counts  
- 🗓️ List customers who booked less than 5 seats  
- 🕔 Show all movie titles with their respective showtimes and theaters  
- 🛑 Identify theaters with no scheduled shows  
- 👥 Group movies by genre with count  
- 🧾 Create a view: `BookingDetails` showing customer + movie + seat info  

---

## ✅ Getting Started

### 1. Open MySQL Workbench  
   - Load the `.mwb` file to view/edit the schema diagram

### 2. Run the SQL Script  
   - Open `Movie Ticket Booking System.sql`  
   - Execute to create tables, insert sample data, and test queries

### 3. Explore  
   - Run SELECT statements, JOINs, views, and analytics queries  
   - Customize or extend based on real-world scenarios

---

## 📚 Learning Outcomes

- 📘 Strong command over DDL (Data Definition Language)  
- 📊 Data analysis using SQL (GROUP BY, HAVING, JOINs, VIEWS)  
- 🔁 Realistic simulation of a movie ticket booking process  
- 🧠 Good foundation for building database-backed applications

---


