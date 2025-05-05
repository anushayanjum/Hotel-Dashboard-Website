\=== Hotel Management Dashboard for Last Resort Hotels ===

Overview:
A README.txt outlining setup, features, KPIs, and dependencies for the Flask-based Hotel Management Dashboard built for Professor David Prager's Spring 2025 CS060 Class.

\=== 1. FEATURES ===

Dashboard Metrics:
• Total Revenue (all transactions)
• Meeting-Room Revenue
• Sleeping-Room Revenue
• Quarter-over-Quarter Revenue Change
• Top 5 Customers by Revenue (filtered by period)
• Most Profitable Hotel
• Maintenance Requests per Hotel
• Reservation KPIs:
– Total Reservations Count
– Average Meeting-Room Stay Length (hours)
– Average Sleeping-Room Stay Length (days)
– Weighted Overall Stay Length (days)
• Occupancy Rate (%)
• ADR (Average Daily Rate)
• Revenue per Available Room
• Cancellation Rate (%)
• Time-Series Charts: bookings, revenue, guests trends

Search & Listings:
• Room Lookup by Number
• Hotel Directory & Detail View (amenities, revenue breakdown)
• Reservation List with Status & Check-In Date
• Room List with Amenity Flags (pool, parking, gym, etc.)
• Staff Directory
• Customer Directory & Search

\=== 2. TECHNOLOGY STACK ===

Backend:
• Python 3.7+
• Flask (web framework)
• PyMySQL (MySQL connector)
• python-dateutil (date arithmetic)
• python-dotenv (environment variables)

Frontend:
• Jinja2 (templating)
• Chart.js (charts)

Database:
• MySQL 5.7+

\=== 3. PREREQUISITES ===

Ensure the following are installed on your system:
• Python 3.7 or above
• MySQL Server 5.7 or above
• git
• pip (Python package manager)

\=== 4. DEPENDENCIES ===

Install required Python packages via pip:

```bash
pip install Flask>=2.0 PyMySQL>=1.0 python-dateutil>=2.8 python-dotenv>=0.19
```

Alternatively, use the included requirements.txt:

```txt
# requirements.txt
Flask>=2.0
PyMySQL>=1.0
python-dateutil>=2.8
python-dotenv>=0.19
```

```bash
pip install -r requirements.txt
```

Chart.js is loaded via CDN in dashboard.html.

\=== 5. INSTALLATION & SETUP ===

1. Clone repository:

```bash
git clone https://github.com/anushayanjum/hotel-management-dashboard.git
cd hotel-management-dashboard
```

2. Create & activate a virtual environment:

```bash
python3 -m venv venv
# macOS/Linux:
source venv/bin/activate
# Windows:
venv\Scripts\activate
```

3. Install Python dependencies:

```bash
pip install -r requirements.txt
```

4. Database setup:
   • Create MySQL database named `hotel_management`.
   • Run SQL schema to create tables (hotel, brand, building, wing, floor, room, reservation, reservation\_status, meeting\_room\_reservation, sleeping\_room\_reservation, transaction, customer, room\_maintenance, staff, organization).
   • Optional: load sample dataset:

```bash
mysql -u root -p hotel_management < data/CompleteDatabase.sql
```

5. Environment variables:
   • Copy `.env.example` to `.env` and update with your credentials:

```ini
# .env
DB_HOST=localhost
DB_USER=root
DB_PASS=butterfly786
DB_NAME=hotel_management
```

• Ensure python-dotenv loads these in `app.py`.

\=== 6. RUNNING THE APPLICATION ===

Set environment and start Flask server:

```bash
export FLASK_APP=app.py
export FLASK_ENV=development  # debug mode
flask run
```

Access the app at [http://127.0.0.1:5000/](http://127.0.0.1:5000/).

\=== 7. PROJECT STRUCTURE ===

```
hotel-management-dashboard/
├── .env                # environment variables (DB credentials)
├── app.py              # Main Flask application
├── requirements.txt    # Python dependencies
├── data/               # SQL schema & sample data
│   └── CompleteDatabase.sql
├── templates/          # Jinja2 templates
│   ├── dashboard.html
│   ├── hotels.html
│   ├── hotel_detail.html
│   ├── reservations.html
│   ├── rooms.html
│   ├── staff.html
│   └── customer.html
└── static/
    ├── css/           # CSS files
    └── js/            # Chart.js logic
        └── dashboard.js
```

\=== 8. KPI CALCULATIONS DETAIL ===

1. Total Revenue:

```sql
SELECT IFNULL(SUM(amount),0) AS total
  FROM `transaction`
 WHERE YEAR(transactionTime)=<year>
   [AND QUARTER(transactionTime)=<quarter>];
```

2. Meeting-Room Revenue:

```sql
SELECT IFNULL(SUM(roomCost),0) AS meeting_rev
  FROM meeting_room_reservation
 WHERE YEAR(checkInDateTime)=<year>
   [AND QUARTER(checkInDateTime)=<quarter>];
```

3. Sleeping-Room Revenue:

```sql
SELECT IFNULL(SUM(roomCost),0) AS sleeping_rev
  FROM sleeping_room_reservation
 WHERE YEAR(checkInDateTime)=<year>
   [AND QUARTER(checkInDateTime)=<quarter>];
```

4. Top 5 Customers by Revenue:

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

5. Most Profitable Hotel:
   Sum meeting + sleeping revenue per hotel, pick TOP 1.

6. Maintenance Requests per Hotel:

```sql
SELECT h.hotelName, COUNT(*) AS req_count
  FROM room_maintenance m
  JOIN room->floor->wing->building->hotel
 WHERE YEAR(startDateTime)=<year>
   [AND QUARTER(startDateTime)=<quarter>]
 GROUP BY h.hotelId
 ORDER BY req_count DESC;
```

7. Reservation Counts & Average Stay:
   • Total Reservations: `COUNT(*)` on reservation.
   • Avg Meeting Stay: `AVG(TIMESTAMPDIFF(HOUR,checkInDateTime,checkOutDateTime))`.
   • Avg Sleeping Stay: `AVG(DATEDIFF(checkOutDateTime,checkInDateTime))`.
   • Weighted Overall Stay: weighted average by counts.

8. Occupancy Rate (%):

```text
(nights_sold / (total_rooms * period_days)) * 100
```

9. ADR (Average Daily Rate):

```text
sleeping_room_revenue / nights_sold
```

10. Revenue per Available Room:

```text
sleeping_room_revenue / (total_rooms * period_days)
```

11. Cancellation Rate (%):

```sql
SELECT SUM(statusId=2)/COUNT(*) * 100 AS cancellation_rate
  FROM reservation
 WHERE YEAR(reservationPlacementDate)=<year>
   [AND QUARTER(reservationPlacementDate)=<quarter>];
```

\=== 9. LICENSE & CONTACT ===

• License: MIT License
• Bugs & Requests: [https://github.com/anushayanjum/hotel-management-dashboard/issues](https://github.com/anushayanjum/hotel-management-dashboard/issues)

---

© Last Resort Hotels (Anushay, Tianshu, George and Isabella)
