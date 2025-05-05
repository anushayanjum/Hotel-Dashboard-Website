# Hotel Management Dashboard for Last Resort Hotels

[![Python Version](https://img.shields.io/badge/python-3.7%2B-blue)](https://www.python.org/)  

A Flask-based dashboard for Professor David Prager’s Spring 2025 CS060 class at NYU. It provides key performance indicators, interactive charts, and search/listing features for a hotel management system.

---

## Table of Contents

1. [Features](#features)  
2. [Technology Stack](#technology-stack)  
3. [Prerequisites](#prerequisites)  
4. [Installation & Setup](#installation--setup)  
5. [Running the Application](#running-the-application)  
6. [Project Structure](#project-structure)  
7. [KPI Calculations Detail](#kpi-calculations-detail)  
8. [Contact](#contact)  

---

## Features

### Dashboard Metrics
- **Total Revenue** (all transactions)  
- **Meeting-Room Revenue**  
- **Sleeping-Room Revenue**  
- **Quarter-over-Quarter Change**  
- **Top 5 Customers by Revenue**  
- **Most Profitable Hotel**  
- **Maintenance Requests per Hotel**  
- **Reservation KPIs**  
  - Total Reservations Count  
  - Average Meeting-Room Stay (hours)  
  - Average Sleeping-Room Stay (days)  
  - Weighted Overall Stay (days)  
- **Occupancy Rate (%)**  
- **ADR (Average Daily Rate)**  
- **Revenue per Available Room**  
- **Cancellation Rate (%)**  
- **Time-Series Charts**: bookings, revenue, guest trends  

### Search & Listings
- **Room Lookup** by number  
- **Hotel Directory & Detail View** (amenities, revenue breakdown)  
- **Reservation List** with status & check-in date  
- **Room List** with amenity flags (pool, parking, gym, etc.)  
- **Staff Directory**  
- **Customer Directory & Search**  

---

## Technology Stack

| Component   | Tools & Libraries                               |
|-------------|-------------------------------------------------|
| **Backend** | Python 3.7+, Flask, PyMySQL, python-dateutil, python-dotenv |
| **Frontend**| Jinja2, Chart.js (via CDN)                      |
| **Database**| MySQL 5.7+                                       |

---

## Prerequisites

Make sure you have the following installed:

- Python 3.7 or above  
- MySQL Server 5.7 or above  
- git  
- pip (Python package manager)  

---

## Installation & Setup

1. **Clone the repository**  
   ```bash
   git clone https://github.com/anushayanjum/hotel-management-dashboard.git
   cd hotel-management-dashboard
````

2. **Create & activate a virtual environment**

   ```bash
   python3 -m venv venv
   # macOS/Linux:
   source venv/bin/activate
   # Windows:
   venv\Scripts\activate
   ```

3. **Install Python dependencies**

   ```bash
   pip install -r requirements.txt
   ```

4. **Database setup**

   * Create a MySQL database named `hotel_management`.
   * Run the provided schema to create all tables:

     ```bash
     mysql -u root -p hotel_management < data/CompleteDatabase.sql
     ```
   * *(Optional)* Load sample data if available.

5. **Environment variables**

   * Copy `.env.example` to `.env` and update with your credentials:

     ```ini
     DB_HOST=localhost
     DB_USER=root
     DB_PASS=butterfly786
     DB_NAME=hotel_management
     ```
   * Ensure `python-dotenv` loads these in `app.py`.

---

## Running the Application

Set environment variables and start the Flask server:

```bash
export FLASK_APP=app.py
export FLASK_ENV=development   # enable debug mode
flask run
```

Open your browser to [http://127.0.0.1:5000/](http://127.0.0.1:5000/).

---

## Project Structure

```text
hotel-management-dashboard/
├── .env                    # environment variables (DB credentials)
├── app.py                  # main Flask application
├── requirements.txt        # Python dependencies
├── data/                   # SQL schema & sample data
│   └── CompleteDatabase.sql
├── templates/              # Jinja2 templates
│   ├── dashboard.html
│   ├── hotels.html
│   ├── hotel_detail.html
│   ├── reservations.html
│   ├── rooms.html
│   ├── staff.html
│   └── customer.html
└── static/
    ├── css/                # CSS files
    └── js/                 # JavaScript (Chart.js logic)
        └── dashboard.js
```

---

## KPI Calculations Detail

1. **Total Revenue**

   ```sql
   SELECT IFNULL(SUM(amount),0) AS total
     FROM `transaction`
    WHERE YEAR(transactionTime)=<year>
      [AND QUARTER(transactionTime)=<quarter>];
   ```

2. **Meeting-Room Revenue**

   ```sql
   SELECT IFNULL(SUM(roomCost),0) AS meeting_rev
     FROM meeting_room_reservation
    WHERE YEAR(checkInDateTime)=<year>
      [AND QUARTER(checkInDateTime)=<quarter>];
   ```

3. **Sleeping-Room Revenue**

   ```sql
   SELECT IFNULL(SUM(roomCost),0) AS sleeping_rev
     FROM sleeping_room_reservation
    WHERE YEAR(checkInDateTime)=<year>
      [AND QUARTER(checkInDateTime)=<quarter>];
   ```

4. **Top 5 Customers by Revenue**

   ```sql
   SELECT CONCAT(c.first, ' ', c.last) AS name,
          IFNULL(SUM(t.amount),0)        AS revenue
     FROM transaction t
     JOIN customer c ON t.billingPartyId=c.customerId
    WHERE YEAR(t.transactionTime)=<year>
      [AND QUARTER(t.transactionTime)=<quarter>]
    GROUP BY c.customerId
    ORDER BY revenue DESC
    LIMIT 5;
   ```

5. **Most Profitable Hotel**
   Sum meeting + sleeping revenue per hotel and pick the top one.

6. **Maintenance Requests per Hotel**

   ```sql
   SELECT h.hotelName, COUNT(*) AS req_count
     FROM room_maintenance m
     JOIN room    r ON m.roomId = r.roomId
     JOIN floor   f ON r.floorId = f.floorId
     JOIN wing    w ON f.wingId = w.wingId
     JOIN building b ON w.buildingId = b.buildingId
     JOIN hotel   h ON b.hotelId = h.hotelId
    WHERE YEAR(startDateTime)=<year>
      [AND QUARTER(startDateTime)=<quarter>]
    GROUP BY h.hotelId
    ORDER BY req_count DESC;
   ```

7. **Reservation Counts & Average Stay**

   * Total Reservations: `COUNT(*)` on `reservation`.
   * Avg Meeting Stay:

     ```sql
     AVG(TIMESTAMPDIFF(HOUR, checkInDateTime, checkOutDateTime))
     ```
   * Avg Sleeping Stay:

     ```sql
     AVG(DATEDIFF(checkOutDateTime, checkInDateTime))
     ```
   * Weighted Overall Stay: weighted average by counts.

8. **Occupancy Rate (%)**

   ```text
   (nights_sold / (total_rooms * period_days)) * 100
   ```

9. **ADR (Average Daily Rate)**

   ```text
   sleeping_room_revenue / nights_sold
   ```

10. **Revenue per Available Room**

    ```text
    sleeping_room_revenue / (total_rooms * period_days)
    ```

11. **Cancellation Rate (%)**

    ```sql
    SELECT SUM(statusId=2)/COUNT(*) * 100 AS cancellation_rate
      FROM reservation
     WHERE YEAR(reservationPlacementDate)=<year>
       [AND QUARTER(reservationPlacementDate)=<quarter>];
    ```

---

## Contact

* **Bugs & Feature Requests:**
  [https://github.com/anushayanjum/hotel-management-dashboard/issues](https://github.com/anushayanjum/hotel-management-dashboard/issues)


