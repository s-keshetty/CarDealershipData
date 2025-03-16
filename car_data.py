import mysql.connector
from mysql.connector import Error

def create_connection():
    try:
        conn = mysql.connector.connect(
            host='localhost',
            user='root',
            password='',  # Leave blank if no password
            database='cardb'
        )
        if conn.is_connected():
            print("Connected successfully!")
        return conn
    except Error as e:
        print(f"Error: {e}")
        return None

def execute_query(conn, query, values=None):
    try:
        cursor = conn.cursor()
        if values:
            cursor.execute(query, values)
        else:
            cursor.execute(query)
        conn.commit()
        print("Query executed successfully!")
    except Error as e:
        print(f"Error: {e}")

def fetch_data(conn, query):
    try:
        cursor = conn.cursor()
        cursor.execute(query)
        rows = cursor.fetchall()
        for row in rows:
            print(row)
    except Error as e:
        print(f"Error: {e}")

def main():
    conn = create_connection()
    if conn:
        fetch_data(conn, "SELECT * FROM cars;")
        insert_query = """
        INSERT INTO cars (car_id, make, fuel_id, engine_id, price) VALUES 
        (31, 'Toyota Corolla', 1, 2, 22000)
        ON DUPLICATE KEY UPDATE price = VALUES(price);
        """
        execute_query(conn, insert_query)
        conn.close()

if __name__ == "__main__":
    main()
