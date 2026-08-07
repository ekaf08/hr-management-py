from koneksi import get_koneksi

def tambah_karyawan(nik, nama_lengkap, email, tanggal_masuk, departemen_id):
    conn = get_koneksi()
    cursor = conn.cursor()

    query = """
        INSERT INTO karyawan (nik, nama_lengkap, email, tanggal_masuk, departemen_id)
        VALUES (%s, %s, %s, %s, %s)
        RETURNING id;
    """

    cursor.execute(query, (nik, nama_lengkap, email, tanggal_masuk, departemen_id))

    # Ambil id yang baru dibuat (dari RETURNING id)
    id_baru = cursor.fetchone()[0]

    # PENTING: Harus commit, kalau tidak, perubahan tidak akan tersimpan di database
    conn.commit()

    cursor.close()
    conn.close()

    return id_baru

if __name__ == "__main__":
    # Input manual dari terminal untuk menambahkan karyawan baru
    nik = input("Masukkan NIK: ")
    nama_lengkap = input("Masukkan Nama Lengkap: ")
    email = input("Masukkan Email: ")
    tanggal_masuk = input("Masukkan Tanggal Masuk (YYYY-MM-DD): ")
    departemen_id = int(input("Masukkan ID Departemen: "))

    id_baru = tambah_karyawan(nik, nama_lengkap, email, tanggal_masuk, departemen_id)
    print(f"Karyawan baru berhasil ditambahkan dengan ID: {id_baru}") 