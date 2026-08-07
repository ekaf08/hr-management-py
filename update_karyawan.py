from koneksi import get_koneksi

def update_karyawan(id_karyawan, nama_lengkap, email, departemen_id):
    conn = get_koneksi()
    cursor = conn.cursor()

    query = """
        UPDATE karyawan
        SET nama_lengkap = %s, email = %s, departemen_id = %s
        WHERE id = %s;
    """

    cursor.execute(query, (nama_lengkap, email, departemen_id, id_karyawan))

    #   cursor.rowcount = jumlah baris yang terpengaruh oleh query UPDATE. Jika rowcount > 0, berarti update berhasil.
    baris_terupdate = cursor.rowcount

    conn.commit()
    cursor.close()
    conn.close()

    return baris_terupdate

if __name__ == "__main__":
    # Input manual dari terminal untuk mengupdate data karyawan
    id_karyawan = int(input("Masukkan ID Karyawan yang ingin diupdate: "))
    nama_lengkap = input("Masukkan Nama Lengkap baru: ")
    email = input("Masukkan Email baru: ")
    departemen_id = int(input("Masukkan ID Departemen baru: "))

    baris_terupdate = update_karyawan(id_karyawan, nama_lengkap, email, departemen_id)

    if baris_terupdate > 0:
        print(f"Data karyawan dengan ID {id_karyawan} berhasil diupdate.")
    else:
        print(f"Tidak ada data karyawan dengan ID {id_karyawan} yang ditemukan atau tidak ada perubahan yang dilakukan.")   
