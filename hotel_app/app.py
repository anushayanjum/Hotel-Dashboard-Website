## Imports 

from flask import Flask, render_template, request, redirect, url_for
import pymysql
import datetime
from collections import OrderedDict
from dateutil.relativedelta import relativedelta

app = Flask(__name__)

## Database Configuration
DB_CONFIG = {
    'host':     'localhost',
    'user':     'root',
    'password': 'butterfly786',
    'db':       'hotel_management',
    'charset':  'utf8mb4',
    'cursorclass': pymysql.cursors.DictCursor
}

## Initialization
MEETING_DATE_COL  = 'checkInDateTime'
SLEEPING_DATE_COL = 'checkInDateTime'
MAINT_DATE_COL    = 'startDateTime'

def get_connection():
    return pymysql.connect(**DB_CONFIG)

def build_where(clauses):
    return " AND ".join(clauses)


## Flask Routes
@app.route('/')
def home():
    return redirect(url_for('dashboard'))


## Dashboard
@app.route('/dashboard')
def dashboard():
    now          = datetime.datetime.now()
    current_year = now.year
    year         = request.args.get('year', current_year, type=int)
    quarter      = request.args.get('quarter', None,     type=int)

    # Determine start_date/end_date for filters
    if quarter in (1,2,3,4):
        start_month = (quarter - 1) * 3 + 1
        start_date  = datetime.date(year, start_month, 1)
        if start_month + 3 <= 12:
            end_date = datetime.date(year, start_month + 3, 1)
        else:
            end_date = datetime.date(year + 1, 1, 1)
    else:
        start_date = datetime.date(year, 1, 1)
        end_date   = datetime.date(year + 1, 1, 1)
    period_days = (end_date - start_date).days

    # Build WHERE clauses
    txn_w = ["YEAR(transactionTime) = %(year)s"]
    mrr_w = [f"YEAR(mrr.`{MEETING_DATE_COL}`) = %(year)s"]
    srr_w = [f"YEAR(srr.`{SLEEPING_DATE_COL}`) = %(year)s"]
    res_w = ["YEAR(reservationPlacementDate) = %(year)s"]
    rm_w  = [f"YEAR(m.`{MAINT_DATE_COL}`) = %(year)s"]
    params = {'year': year}
    if quarter in (1,2,3,4):
        txn_w.append("QUARTER(transactionTime) = %(quarter)s")
        mrr_w.append(f"QUARTER(mrr.`{MEETING_DATE_COL}`) = %(quarter)s")
        srr_w.append(f"QUARTER(srr.`{SLEEPING_DATE_COL}`) = %(quarter)s")
        res_w.append("QUARTER(reservationPlacementDate) = %(quarter)s")
        rm_w.append(f"QUARTER(m.`{MAINT_DATE_COL}`) = %(quarter)s")
        params['quarter'] = quarter

    mq = f"AND QUARTER(mrr.{MEETING_DATE_COL}) = %(quarter)s" if quarter in (1,2,3,4) else ""
    sq = f"AND QUARTER(srr.{SLEEPING_DATE_COL}) = %(quarter)s" if quarter in (1,2,3,4) else ""

    conn = get_connection()
    try:
        with conn.cursor() as cur:
            # Total revenue
            cur.execute(f"""
                SELECT IFNULL(SUM(amount),0) AS total
                  FROM `transaction`
                 WHERE {build_where(txn_w)}
            """, params)
            total_rev = float(cur.fetchone()['total'])

            # Meeting-room revenue
            cur.execute(f"""
                SELECT IFNULL(SUM(roomCost),0) AS meeting_rev
                  FROM meeting_room_reservation AS mrr
                 WHERE {build_where(mrr_w)}
            """, params)
            meeting_rev = float(cur.fetchone()['meeting_rev'] or 0)

            # Sleeping-room revenue
            cur.execute(f"""
                SELECT IFNULL(SUM(roomCost),0) AS sleeping_rev
                  FROM sleeping_room_reservation AS srr
                 WHERE {build_where(srr_w)}
            """, params)
            sleeping_rev = float(cur.fetchone()['sleeping_rev'] or 0)

            reservations_rev = meeting_rev + sleeping_rev

            # Top 5 customers for this period
            cur.execute(f"""
                SELECT
                  CONCAT(c.customerFirstName,' ',c.customerLastName) AS name,
                  IFNULL(SUM(t.amount),0)                      AS revenue
                FROM `transaction` AS t
                JOIN customer AS c ON t.billingPartyId = c.customerId
               WHERE {build_where(txn_w)}
               GROUP BY c.customerId
               ORDER BY revenue DESC
               LIMIT 5
            """, params)
            top_customers = cur.fetchall()

            # Most profitable hotel
            cur.execute(f"""
                SELECT
                  h.hotelId,
                  h.hotelName,
                  COALESCE(m.meeting_rev,0) + COALESCE(s.sleeping_rev,0) AS revenue
                FROM hotel AS h
           LEFT JOIN (
                    SELECT bd.hotelId, SUM(mrr.roomCost) AS meeting_rev
                      FROM meeting_room_reservation AS mrr
                      JOIN room     AS rm ON mrr.roomId   = rm.roomId
                      JOIN floor    AS fl ON rm.floorId    = fl.floorId
                      JOIN wing     AS w  ON fl.wingId     = w.wingId
                      JOIN building AS bd ON w.buildingId  = bd.buildingId
                     WHERE YEAR(mrr.{MEETING_DATE_COL}) = %(year)s
                       {mq}
                     GROUP BY bd.hotelId
                ) AS m ON m.hotelId = h.hotelId
           LEFT JOIN (
                    SELECT bd.hotelId, SUM(srr.roomCost) AS sleeping_rev
                      FROM sleeping_room_reservation AS srr
                      JOIN room     AS rm ON srr.roomId    = rm.roomId
                      JOIN floor    AS fl ON rm.floorId     = fl.floorId
                      JOIN wing     AS w  ON fl.wingId      = w.wingId
                      JOIN building AS bd ON w.buildingId   = bd.buildingId
                     WHERE YEAR(srr.{SLEEPING_DATE_COL}) = %(year)s
                       {sq}
                     GROUP BY bd.hotelId
                ) AS s ON s.hotelId = h.hotelId
                ORDER BY revenue DESC
                LIMIT 1
            """, params)
            most_profitable = cur.fetchone()

            # Maintenance per hotel
            cur.execute(f"""
                SELECT h.hotelName AS hotel, COUNT(*) AS req_count
                  FROM room_maintenance AS m
                  JOIN room     AS rm  USING(roomId)
                  JOIN floor    AS fl  ON rm.floorId    = fl.floorId
                  JOIN wing     AS w   ON fl.wingId     = w.wingId
                  JOIN building AS bd  ON w.buildingId  = bd.buildingId
                  JOIN hotel    AS h   ON bd.hotelId    = h.hotelId
                 WHERE {build_where(rm_w)}
                 GROUP BY h.hotelId
                 ORDER BY req_count DESC
            """, params)
            maint_per_hotel = cur.fetchall()

            # Reservation KPIs: counts
            cur.execute(f"""
                SELECT COUNT(*) AS cnt
                  FROM reservation
                 WHERE {build_where(res_w)}
            """, params)
            total_res = cur.fetchone()['cnt']

            # Average meeting-room duration in HOURS
            cur.execute(f"""
                SELECT AVG(
                         TIMESTAMPDIFF(
                           HOUR,
                           checkInDateTime,
                           checkOutDateTime
                         )
                       ) AS avg_meet_hours
                  FROM meeting_room_reservation AS mrr
                 WHERE {build_where(mrr_w)}
            """, params)
            avg_meet_hours = cur.fetchone()['avg_meet_hours']

            # Average sleeping stay in days
            cur.execute(f"""
                SELECT AVG(DATEDIFF(checkOutDateTime,checkInDateTime)) AS avg_sleep
                  FROM sleeping_room_reservation AS srr
                 WHERE {build_where(srr_w)}
            """, params)
            avg_sleep = cur.fetchone()['avg_sleep']

            # Weighted overall stay length
            avg_overall = None
            if avg_meet_hours is not None or avg_sleep is not None:
                cur.execute(f"""
                    SELECT COUNT(*) AS c1
                      FROM meeting_room_reservation AS mrr
                     WHERE {build_where(mrr_w)}
                """, params)
                c1 = cur.fetchone()['c1']
                cur.execute(f"""
                    SELECT COUNT(*) AS c2
                      FROM sleeping_room_reservation AS srr
                     WHERE {build_where(srr_w)}
                """, params)
                c2 = cur.fetchone()['c2']
                total_count = c1 + c2
                if total_count:
                    avg_overall = ((avg_meet_hours or 0)*c1 + (avg_sleep or 0)*c2) / total_count

            # QoQ revenue change
            pct_rev_change = None
            if quarter in (1,2,3,4):
                py, pq = year, quarter - 1
                if pq == 0:
                    py, pq = year - 1, 4
                cur.execute("""
                    SELECT IFNULL(SUM(amount),0) AS total
                      FROM `transaction`
                     WHERE YEAR(transactionTime)=%(py)s
                       AND QUARTER(transactionTime)=%(pq)s
                """, {'py': py, 'pq': pq})
                prev_total = float(cur.fetchone()['total'])
                if prev_total:
                    pct_rev_change = (total_rev - prev_total) / prev_total * 100

            ## Build chart data
            if quarter in (1,2,3,4):
                # three-month span
                quarter_start = start_date.replace(day=1)
                quarter_months = [quarter_start + relativedelta(months=i) for i in range(3)]
                labels = [dt.strftime('%b %Y') for dt in quarter_months]

                # Bookings in quarter
                cur.execute("""
                    SELECT MONTH(reservationPlacementDate) AS m, COUNT(*) AS cnt
                      FROM reservation
                     WHERE YEAR(reservationPlacementDate)=%(year)s
                       AND QUARTER(reservationPlacementDate)=%(quarter)s
                     GROUP BY MONTH(reservationPlacementDate)
                """, params)
                raw = {r['m']: r['cnt'] for r in cur.fetchall()}
                bookings_labels = labels
                bookings_data   = [raw.get(dt.month, 0) for dt in quarter_months]

                # Revenue in quarter
                cur.execute("""
                    SELECT MONTH(transactionTime) AS m, SUM(amount) AS total
                      FROM `transaction`
                     WHERE YEAR(transactionTime)=%(year)s
                       AND QUARTER(transactionTime)=%(quarter)s
                     GROUP BY MONTH(transactionTime)
                """, params)
                raw = {r['m']: float(r['total'] or 0) for r in cur.fetchall()}
                revenue_labels = labels
                revenue_data   = [raw.get(dt.month, 0.0) for dt in quarter_months]

                # Guests in quarter
                cur.execute(f"""
                    SELECT MONTH(srr.`{SLEEPING_DATE_COL}`) AS m, SUM(srr.numGuests) AS g
                      FROM sleeping_room_reservation AS srr
                     WHERE YEAR(srr.`{SLEEPING_DATE_COL}`)=%(year)s
                       AND QUARTER(srr.`{SLEEPING_DATE_COL}`)=%(quarter)s
                     GROUP BY MONTH(srr.`{SLEEPING_DATE_COL}`)
                """, params)
                raw = {r['m']: r['g'] for r in cur.fetchall()}
                guests_labels = labels
                guests_data   = [raw.get(dt.month, 0) for dt in quarter_months]

            else:
                # Full-year view: Jan–Dec of selected year
                year_months = [datetime.date(year, m, 1) for m in range(1, 13)]
                labels = [dt.strftime('%b %Y') for dt in year_months]

                # Bookings per month
                cur.execute("""
                    SELECT MONTH(reservationPlacementDate) AS m, COUNT(*) AS cnt
                      FROM reservation
                     WHERE YEAR(reservationPlacementDate)=%(year)s
                     GROUP BY MONTH(reservationPlacementDate)
                """, params)
                raw = {r['m']: r['cnt'] for r in cur.fetchall()}
                bookings_labels = labels
                bookings_data   = [raw.get(m, 0) for m in range(1, 13)]

                # Revenue per month
                cur.execute("""
                    SELECT MONTH(transactionTime) AS m, SUM(amount) AS total
                      FROM `transaction`
                     WHERE YEAR(transactionTime)=%(year)s
                     GROUP BY MONTH(transactionTime)
                """, params)
                raw = {r['m']: float(r['total'] or 0) for r in cur.fetchall()}
                revenue_labels = labels
                revenue_data   = [raw.get(m, 0.0) for m in range(1, 13)]

                # Guests per month (sleeping rooms)
                cur.execute(f"""
                    SELECT MONTH(srr.`{SLEEPING_DATE_COL}`) AS m, SUM(srr.numGuests) AS g
                      FROM sleeping_room_reservation AS srr
                     WHERE YEAR(srr.`{SLEEPING_DATE_COL}`)=%(year)s
                     GROUP BY MONTH(srr.`{SLEEPING_DATE_COL}`)
                """, params)
                raw = {r['m']: r['g'] for r in cur.fetchall()}
                guests_labels = labels
                guests_data   = [raw.get(m, 0) for m in range(1, 13)]

            # 5 most recent reservations
            cur.execute("""
                SELECT
                  r.reservationId,
                  r.reservationPlacementDate,
                  rs.statusName  AS status,
                  c.customerFirstName,
                  c.customerLastName
                  FROM reservation AS r
             LEFT JOIN reservation_status     AS rs  USING(statusId)
             JOIN customer                    AS c   ON r.customerId = c.customerId
             ORDER BY r.reservationPlacementDate DESC
             LIMIT 5
            """)
            recent_reservations = cur.fetchall()

            # Occupancy Rate, ADR, Revenue per Available Room, Cancellation Rate
            cur.execute("SELECT COUNT(*) AS total_rooms FROM sleeping_room")
            total_rooms = cur.fetchone()['total_rooms']
            nights_available = total_rooms * period_days

            cur.execute("""
                SELECT IFNULL(SUM(DATEDIFF(checkOutDateTime,checkInDateTime)),0) AS nights_sold
                  FROM sleeping_room_reservation
                 WHERE checkInDateTime >= %s
                   AND checkInDateTime <  %s
            """, (start_date, end_date))
            nights_sold = float(cur.fetchone()['nights_sold'])

            occupancy_rate = (nights_sold / nights_available * 100) if nights_available else None
            adr            = (sleeping_rev   / nights_sold) if nights_sold else None
            revenue_per_available_room = (sleeping_rev / nights_available) if nights_available else None

            cur.execute(f"""
                SELECT
                  SUM(statusId = 2) AS cancels,
                  COUNT(*)         AS total
                  FROM reservation
                 WHERE {build_where(res_w)}
            """, params)
            row               = cur.fetchone()
            cancels           = row['cancels']
            total_bookings    = row['total']
            cancellation_rate = (cancels / total_bookings * 100) if total_bookings else None

    finally:
        conn.close()

    return render_template(
        'dashboard.html',
        year=year,
        quarter=quarter,
        current_year=current_year,
        total_rev=total_rev,
        meeting_rev=meeting_rev,
        sleeping_rev=sleeping_rev,
        reservations_rev=reservations_rev,
        top_customers=top_customers,
        most_profitable=most_profitable,
        maint_per_hotel=maint_per_hotel,
        total_res=total_res,
        avg_meet_hours=avg_meet_hours,
        avg_sleep=avg_sleep,
        avg_overall=avg_overall,
        pct_rev_change=pct_rev_change,
        occupancy_rate=occupancy_rate,
        adr=adr,
        revenue_per_available_room=revenue_per_available_room,
        cancellation_rate=cancellation_rate,
        bookings_labels=bookings_labels,
        bookings_data=bookings_data,
        revenue_labels=revenue_labels,
        revenue_data=revenue_data,
        guests_labels=guests_labels,
        guests_data=guests_data,
        recent_reservations=recent_reservations
    )


## Room Search Mechanism
@app.route('/search')
def search_rooms():
    query = request.args.get('query', '').strip()
    rooms = []
    if query:
        sql = "SELECT roomId, roomNum FROM room WHERE roomNum LIKE %s"
        conn = get_connection()
        try:
            with conn.cursor() as cur:
                cur.execute(sql, (f"%{query}%",))
                rooms = cur.fetchall()
        finally:
            conn.close()
    return render_template('search.html', query=query, rooms=rooms)


## Hotel page
@app.route('/hotels')
def hotel_list():
    conn = get_connection()
    try:
        with conn.cursor() as cur:
            cur.execute("""
                SELECT
                  h.hotelId,
                  h.hotelName,
                  b.brandName,
                  h.address
                FROM hotel AS h
                JOIN brand AS b USING(brandId)
                ORDER BY h.hotelName
            """)
            hotels = cur.fetchall()
    finally:
        conn.close()
    return render_template('hotels.html', hotels=hotels)


## Hotel details
@app.route('/hotels/<int:hotel_id>')
def hotel_detail(hotel_id):
    now          = datetime.datetime.now()
    current_year = now.year
    year         = request.args.get('year', current_year, type=int)
    quarter      = request.args.get('quarter', None,     type=int)

    params = {'hotel_id': hotel_id, 'year': year}
    if quarter in (1,2,3,4):
        params['quarter'] = quarter

    conn = get_connection()
    try:
        with conn.cursor() as cur:
            cur.execute("""
                SELECT hotelId, hotelName, address
                  FROM hotel
                 WHERE hotelId=%(hotel_id)s
            """, {'hotel_id': hotel_id})
            hotel = cur.fetchone()

            cur.execute(f"""
                SELECT IFNULL(SUM(mrr.roomCost),0) AS meeting_rev
                  FROM meeting_room_reservation AS mrr
                  JOIN room     AS rm   USING(roomId)
                  JOIN floor    AS fl   USING(floorId)
                  JOIN wing     AS w    USING(wingId)
                  JOIN building AS bd   USING(buildingId)
                 WHERE bd.hotelId=%(hotel_id)s
                   AND YEAR(mrr.checkInDateTime)=%(year)s
                   {('AND QUARTER(mrr.checkInDateTime)=%(quarter)s') if quarter in (1,2,3,4) else ''}
            """, params)
            meeting_rev = float(cur.fetchone()['meeting_rev'])

            cur.execute(f"""
                SELECT IFNULL(SUM(srr.roomCost),0) AS sleeping_rev
                  FROM sleeping_room_reservation AS srr
                  JOIN room     AS rm   USING(roomId)
                  JOIN floor    AS fl   USING(floorId)
                  JOIN wing     AS w    USING(wingId)
                  JOIN building AS bd   USING(buildingId)
                 WHERE bd.hotelId=%(hotel_id)s
                   AND YEAR(srr.checkInDateTime)=%(year)s
                   {('AND QUARTER(srr.checkInDateTime)=%(quarter)s') if quarter in (1,2,3,4) else ''}
            """, params)
            sleeping_rev = float(cur.fetchone()['sleeping_rev'])

            total_rev = meeting_rev + sleeping_rev

            cur.execute("""
                SELECT rm.roomNum,
                       rm.handicapAccess,
                       rm.closeToPool,
                       rm.closeToRestaurant,
                       rm.closeToParking,
                       rm.closeToGym,
                       rm.smoking
                  FROM room     AS rm
                  JOIN floor    AS fl USING(floorId)
                  JOIN wing     AS w  USING(wingId)
                  JOIN building AS bd USING(buildingId)
                 WHERE bd.hotelId=%s
            """, (hotel_id,))
            rooms = cur.fetchall()
    finally:
        conn.close()

    return render_template(
        'hotel_detail.html',
        hotel=hotel,
        rooms=rooms,
        year=year,
        quarter=quarter,
        current_year=current_year,
        meeting_rev=meeting_rev,
        sleeping_rev=sleeping_rev,
        total_rev=total_rev
    )


## Reservation page
@app.route('/reservations')
def list_reservations():
    conn = get_connection()
    try:
        with conn.cursor() as cur:
            cur.execute("""
                SELECT
                  r.reservationId,
                  c.customerFirstName,
                  c.customerLastName,
                  r.reservationPlacementDate,
                  rs.statusName                       AS status,
                  COALESCE(srr.checkInDateTime,
                           mrr.checkInDateTime)       AS checkInDate,
                  h.hotelName                         AS hotel
                  FROM reservation AS r
             LEFT JOIN reservation_status     AS rs  USING(statusId)
             LEFT JOIN customer               AS c   ON r.customerId = c.customerId
             LEFT JOIN sleeping_room_reservation AS srr ON r.reservationId = srr.reservationId
             LEFT JOIN meeting_room_reservation  AS mrr ON r.reservationId = mrr.reservationId
             LEFT JOIN room                      AS rm  ON COALESCE(srr.roomId,mrr.roomId)=rm.roomId
             LEFT JOIN floor                     AS fl  ON rm.floorId    = fl.floorId
             LEFT JOIN wing                      AS w   ON fl.wingId     = w.wingId
             LEFT JOIN building                  AS bd  ON w.buildingId  = bd.buildingId
             LEFT JOIN hotel                     AS h   ON bd.hotelId    = h.hotelId
             ORDER BY r.reservationPlacementDate DESC
            """)
            reservations = cur.fetchall()
    finally:
        conn.close()

    return render_template('reservations.html', reservations=reservations)


## Room page
@app.route('/rooms')
def list_rooms():
    conn = get_connection()
    try:
        with conn.cursor() as cur:
            cur.execute("""
                SELECT roomId, roomNum, floorId, handicapAccess,
                       closeToPool, closeToRestaurant, closeToParking,
                       closeToGym, smoking
                  FROM room
            """)
            rooms = cur.fetchall()
    finally:
        conn.close()

    return render_template('rooms.html', rooms=rooms)


## Staff lookup
@app.route('/staff')
def staff_list():
    conn = get_connection()
    try:
        with conn.cursor() as cur:
            cur.execute("""
                SELECT staffId, staffFirstName, staffLastName, department
                  FROM staff
            """)
            staff = cur.fetchall()
    finally:
        conn.close()

    return render_template('staff.html', staff=staff)


## Customer lookup
@app.route('/customers')
def customer_search():
    q = request.args.get('q', '').strip()
    conn = get_connection()
    try:
        with conn.cursor() as cur:
            if q:
                like_q = f"%{q}%"
                cur.execute("""
                  SELECT
                    c.customerId,
                    c.customerFirstName,
                    c.customerLastName,
                    c.customerPhoneNumber,
                    c.customerEmail,
                    o.organizationName,
                    c.cardOnFile,
                    c.requiresAdvanceDeposit,
                    c.confidentialWhereabouts
                  FROM customer AS c
             LEFT JOIN organization AS o
                    ON c.organizationId = o.organizationId
                 WHERE CONCAT(c.customerFirstName,' ',c.customerLastName) LIKE %s
                    OR c.customerFirstName LIKE %s
                    OR c.customerLastName LIKE %s
              ORDER BY c.customerLastName, c.customerFirstName
                """, (like_q, like_q, like_q))
            else:
                cur.execute("""
                  SELECT
                    c.customerId,
                    c.customerFirstName,
                    c.customerLastName,
                    c.customerPhoneNumber,
                    c.customerEmail,
                    o.organizationName,
                    c.cardOnFile,
                    c.requiresAdvanceDeposit,
                    c.confidentialWhereabouts
                  FROM customer AS c
             LEFT JOIN organization AS o
                    ON c.organizationId = o.organizationId
              ORDER BY c.customerLastName, c.customerFirstName
                """)
            customers = cur.fetchall()
    finally:
        conn.close()

    return render_template('customer.html', query=q, customers=customers)


## Main run
if __name__ == '__main__':
    app.run(debug=True)


## Checked by Anushay 