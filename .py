import mysql.connector
from mysql.connector import Error

def connect_to_mysql():
    try:
        # Connect to the MySQL database
        connection = mysql.connector.connect(
            host='127.0.0.1',         
            database='cappuchino_db',  
            user='root',              
            password='Kanyariri001',  
            port=3600                  
        )

        if connection.is_connected():
            print("✅ Successfully connected to the database!")
            # Fetch database info
            db_info = connection.get_server_info()
            print("MySQL Server version:", db_info)

            # Execute a query
            cursor = connection.cursor()
            cursor.execute("SELECT DATABASE();")
            record = cursor.fetchone()
            print("You're connected to the database:", record[0])

    except Error as e:
        print("❌ Error while connecting to MySQL:", e)

    finally:
        # Close the connection
        if 'connection' in locals() and connection.is_connected():
            cursor.close()
            connection.close()
            print("🔒 MySQL connection closed.")

# Run the function
if __name__ == "__main__":
    connect_to_mysql()
