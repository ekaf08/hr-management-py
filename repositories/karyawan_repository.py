from core.database import get_koneksi

class KaryawanRepository:
    """
    Class ini bertugas khusus untuk operasi database terkait karyawan.
    Pola ini disebut 'Repository Pattern' - memisahkan logika akses data
    dari logika bisnis lainnya.
    """

    def __init__(self):
        self.conn = get_koneksi()

    def get_all(self):
        cursor = self.conn.cursor()
        cursor.execute("SELECT id, nik, nama_lengkap, email, tanggal_masuk ,status, departemen_id FROM karyawan ORDER BY id DESC;")
        hasil = cursor.fetchall()
        cursor.close()
        return hasil

    def get_by_id(self, id_karyawan):
        cursor = self.conn.cursor()
        cursor.execute("SELECT id, nik, nama_lengkap, email, status FROM karyawan WHERE id = %s;", (id_karyawan,))
        hasil = cursor.fetchone()
        cursor.close()
        return hasil

    def create(self, nik, nama_lengkap, email, tanggal_masuk, departemen_id):
        cursor = self.conn.cursor()
        query = """
            INSERT INTO karyawan (nik, nama_lengkap, email, tanggal_masuk, departemen_id)
            VALUES (%s, %s, %s, %s, %s)
            RETURNING id;
        """
        cursor.execute(query, (nik, nama_lengkap, email, tanggal_masuk, departemen_id))
        id_baru = cursor.fetchone()['id']
        self.conn.commit()
        cursor.close()
        return id_baru

    def update(self, id_karyawan, nama_lengkap, email, departemen_id):
        cursor = self.conn.cursor()
        query = """
            UPDATE karyawan
            SET nama_lengkap = %s, email = %s, departemen_id = %s
            WHERE id = %s;
        """
        cursor.execute(query, (nama_lengkap, email, departemen_id, id_karyawan))
        baris_terupdate = cursor.rowcount
        self.conn.commit()
        cursor.close()
        return baris_terupdate

    def nonaktifkan(self, id_karyawan):
        cursor = self.conn.cursor()
        query = "UPDATE karyawan SET status = %s WHERE id = %s;"
        cursor.execute(query, ('resign', id_karyawan))
        baris_terupdate = cursor.rowcount
        self.conn.commit()
        cursor.close()
        return baris_terupdate

    def get_by_departemen(self, departemen_id):
        cursor = self.conn.cursor()
        query = "SELECT id, nik, nama_lengkap, email, tanggal_masuk,status FROM karyawan WHERE departemen_id = %s ORDER BY tanggal_masuk;"
        cursor.execute(query, (departemen_id,))
        hasil = cursor.fetchall()
        cursor.close()
        return hasil

    def close(self):
        """"Menutup koneksi database. Panggil ini saat repository tidak lagi digunakan."""
        self.conn.close()