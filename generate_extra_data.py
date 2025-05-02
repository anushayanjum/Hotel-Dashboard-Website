#!/usr/bin/env python3
import random
from faker import Faker
from datetime import datetime, timedelta

fake = Faker()

# Configuration
hotels = [101, 102, 103, 104, 105]
departments = ["Front Desk", "Housekeeping", "Maintenance", "Security", "Management"]
transaction_types    = [1, 2]       # 1=payment, 2=refund
transaction_statuses = [1, 2, 3]    # 1=Completed, 2=Pending, 3=Failed

start_year = datetime.now().year - 4
years      = list(range(start_year, start_year + 5))
quarters   = {
    1: (1, 3),
    2: (4, 6),
    3: (7, 9),
    4: (10, 12),
}

def random_datetime(year, start_month, end_month):
    """Random datetime between first of start_month and last of end_month."""
    start = datetime(year, start_month, 1)
    # first of month after end_month
    nm    = datetime(year + (end_month // 12), ((end_month % 12) + 1), 1)
    end   = nm - timedelta(days=1)
    return fake.date_time_between(start_date=start, end_date=end)

# --- Staff
print("-- Staff")
print("INSERT INTO staff (staffId, staffFirstName, staffLastName, department) VALUES")
staff_rows = []
for sid in range(11, 11 + 20):
    first = fake.first_name()
    last  = fake.last_name()
    dept  = random.choice(departments)
    staff_rows.append(f"  ({sid}, '{first}', '{last}', '{dept}')")
print(",\n".join(staff_rows) + ";")
print()

# --- Staff Cards
print("-- Staff Cards")
print("INSERT INTO staff_card (staffCardNumber, staffId) VALUES")
card_rows = []
for cardnum, sid in enumerate(range(11, 11 + 20), start=11):
    card_rows.append(f"  ({cardnum}, {sid})")
print(",\n".join(card_rows) + ";")
print()

# --- Transactions (SQL Server needs [transaction], not `transaction`)
print("-- Transactions")
print("INSERT INTO [transaction] (transactionTypeId, billingPartyId, amount, transactionTime, transactionStatus) VALUES")
txn_rows = []
for hotel in hotels:
    for year in years:
        for q, (sm, em) in quarters.items():
            for _ in range(5):
                ttype  = random.choice(transaction_types)
                cust   = random.randint(1, 75)
                amount = round(random.uniform(100, 5000), 2)
                ts     = random_datetime(year, sm, em).strftime("%Y-%m-%d %H:%M:%S")
                status = random.choice(transaction_statuses)
                txn_rows.append(f"  ({ttype}, {cust}, {amount}, '{ts}', {status})")
print(",\n".join(txn_rows) + ";")
print()

# --- Room Maintenance
print("-- Room Maintenance")
print("INSERT INTO room_maintenance (roomId, startDateTime, endDateTime, maintenanceTypeId, maintenanceNotes) VALUES")
maint_rows = []
for year in years:
    for q, (sm, em) in quarters.items():
        for _ in range(10):
            room     = random.randint(1001, 1070)
            start_dt = random_datetime(year, sm, em)
            end_dt   = start_dt + timedelta(hours=random.randint(1, 8))
            mtype    = random.randint(1, 4)
            sstr     = start_dt.strftime("%Y-%m-%d %H:%M:%S")
            estr     = end_dt.strftime("%Y-%m-%d %H:%M:%S")
            maint_rows.append(
                f"  ({room}, '{sstr}', '{estr}', {mtype}, 'Auto-generated maintenance')"
            )
print(",\n".join(maint_rows) + ";")
print()
