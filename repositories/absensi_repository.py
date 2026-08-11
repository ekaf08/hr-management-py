from  datetime import date, datetime

import psycopg2
from core.database import get_koneksi

class AbsensiRepository:
    def __init__(self):
        self.conn = get_koneksi()

    def catat_masuk(self, karyawan_id, tanggal=None, jam_masuk=None):
        """
        Catat jam masuk karyawan ke dalam tabel absensi. Jika tanggal atau jam_masuk tidak diberikan, maka akan menggunakan tanggal dan jam saat ini.
        """

        if tanggal is None:
            tanggal = date.today()
        if jam_masuk is None:
            jam_masuk = datetime.now().time()

        cursor = self.conn.cursor()
        try:
            cursor.execute(
                """
                INSERT INTO absensi (karyawan_id, tanggal, jam_masuk, status)
                VALUES (%s, %s, %s, %s)
                RETURNING id;
                """,
                (karyawan_id, tanggal, jam_masuk, 'hadir')
            )
            id_baru = cursor.fetchone()['id']
            self.conn.commit()
            return id_baru

        except psycopg2.errors.UniqueViolation:
            self.conn.rollback()
            print(f"⚠️ Karyawan ID {karyawan_id} sudah absen pada tanggal {tanggal}.")
            return None

        finally:
            cursor.close()

    def catat_keluar(self, karyawan_id, tanggal=None, jam_keluar=None):
        """
        Catat jam keluar karyawan ke dalam tabel absensi. Jika tanggal atau jam_keluar tidak diberikan, maka akan menggunakan tanggal dan jam saat ini.
        """

        if tanggal is None:
            tanggal = date.today()
        if jam_keluar is None:
            jam_keluar = datetime.now().time()

        cursor = self.conn.cursor()
        cursor.execute(
            """
            UPDATE absensi
            SET jam_keluar = %s
            WHERE karyawan_id = %s AND tanggal = %s;
            """,
            (jam_keluar, karyawan_id, tanggal)
        )
        baris_terupdate = cursor.rowcount
        self.conn.commit()
        cursor.close()
        return baris_terupdate

    def get_by_bulan(self, karyawan_id, bulan, tahun):
        """
        Ambil data absensi karyawan berdasarkan bulan dan tahun tertentu.
        """
        cursor = self.conn.cursor()
        query = """
            SELECT id, karyawan_id, tanggal, jam_masuk, jam_keluar, status
            FROM absensi
            WHERE karyawan_id = %s 
                AND EXTRACT(MONTH FROM tanggal) = %s 
                AND EXTRACT(YEAR FROM tanggal) = %s
            ORDER BY tanggal;
        """
        cursor.execute(query, (karyawan_id, bulan, tahun))
        hasil = cursor.fetchall()
        cursor.close()
        return hasil

    def close(self):
        self.conn.close()