# Hotel Management Dashboard foe the Last Resort Hotels

A Flask‑based web application for visualizing and managing hotel operations.  
It provides an interactive dashboard with key performance indicators (KPIs), trends, and lists of hotels, rooms, reservations, staff, and customers.


##  Features

- **Dashboard**  
  - Total, meeting‑room, and sleeping‑room revenue  
  - Quarter‑over‑quarter revenue change  
  - Top customers by revenue  
  - Most profitable hotel  
  - Maintenance requests per hotel  
  - Reservation KPIs: counts, average stay length (meeting, sleeping, weighted overall)  
  - Occupancy rate, ADR (Average Daily Rate), RevPAR (Revenue per Available Room)  
  - Cancellation and no‑show rates  
  - Time‑series charts

- **Search & Listings**  
  - Room lookup by room number  
  - Hotel list and detailed hotel view (amenities, revenue breakdown, room list)  
  - Reservation list with status and check‑in date  
  - Room list with amenity flags (pool, parking, gym, etc.)  
  - Staff directory  
  - Customer search and directory  

- **Tech Stack**  
  - **Backend**: Python 3 + Flask  
  - **Database**: MySQL (via PyMySQL)  
  - **Templating**: Jinja2 (Flask’s built‑in)  
  - **Charts**: Chart.js  
  - **Date handling**: python‑dateutil  


# HOW TO RUN

## 📋 Prerequisites

- Python 3.7 or newer  
- MySQL server (5.7+)  
- `pip`  


## Installation & Setup

1. **Clone the repository**  
   git clone https://github.com/your‑username/hotel‑management‑dashboard.git
   cd hotel‑management‑dashboard

2. **Create & activate a virtual environment**

   python3 -m venv venv
   source venv/bin/activate     # Linux / macOS
   venv\Scripts\activate        # Windows

3. **Install Python dependencies**

4. **Initialize the database**

   * Create a new MySQL database named `hotel_management`.
   * Run your SQL schema to create tables (`hotel`, `room`, `reservation`, etc.).
   * OR load our sample data from CompleteDatabase.sql dump.
    - It shows data for Q1 and Q2 of 2024

5. **Configure database credentials**
   Open `app.py` and update the `DB_CONFIG` block at the top with your MySQL host, user, password, and database name:

   python
   DB_CONFIG = {
       'host':     'localhost',
       'user':     'root',
       'password': 'your_mysql_password',
       'db':       'hotel_management',
       'charset':  'utf8mb4',
       'cursorclass': pymysql.cursors.DictCursor
   }
   

## Running the Application

export FLASK_APP=app.py
export FLASK_ENV=development     # enables debug mode
flask run



## Project Structure

hotel-management-dashboard/
│
├── app.py                # Main Flask application
│
├── templates/            # Jinja2 HTML templates
│   ├── dashboard.html
│   ├── search.html
│   ├── hotels.html
│   ├── hotel_detail.html
│   ├── reservations.html
│   ├── rooms.html
│   ├── staff.html
│   └── customer.html
│
├── static/
│   ├── css/              # CSS 
│   └── js/
│       └── dashboard.js  # Chart.js setup and DOM logic
│
└── data/               # SQL schema & migrations
    └── CompleteDatabase.sql


