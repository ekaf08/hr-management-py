import os
from dotenv import load_dotenv
import psycopg2

# 1. Load variabel dari file .env ke environment
load_dotenv()

# 2. Ambil nilai dari environment variable
db_host = os.getenv("DB_HOST")
db_port = os.getenv("DB_PORT")
db_name = os.getenv("DB_NAME")
db_user = os.getenv("DB_USER")
db_password = os.getenv("DB_PASSWORD")

# 3. Cek koneksi database
try:
    conn = psycopg2.connect(
        host=db_host,
        port=db_port,
        dbname=db_name,
        user=db_user,
        password=db_password
    )
    print("✅ Koneksi ke database berhasil !!!")

    # 4. Cek versi PostgreSQL sebagai bukti koneksi benar-benar jalan
    cursor = conn.cursor()
    cursor.execute("SELECT version();")
    hasil = cursor.fetchone()
    print("Versi PostgreSQL:", hasil[0])

    cursor.close()
    conn.close()

except Exception as e:
    print("❌ Koneksi gagal:", e)