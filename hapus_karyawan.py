from koneksi import get_koneksi

def nonaktifkan_karyawan(id_karyawan):
    """Soft delete: ubah status jadi 'resign', data tetap ada di database."""
    conn = get_koneksi()
    cursor = conn.cursor()

    query = "UPDATE karyawan SET status = %s WHERE id = %s;"
    cursor.execute(query, ('resign', id_karyawan))

    baris_terupdate = cursor.rowcount
    conn.commit()
    cursor.close()
    conn.close()

    return baris_terupdate


if __name__ == "__main__":
    id_karyawan = input("ID Karyawan yang resign: ")
    jumlah = nonaktifkan_karyawan(id_karyawan)

    if jumlah > 0:
        print(f"✅ Karyawan ID {id_karyawan} berhasil ditandai resign.")
    else:
        print(f"⚠️ Tidak ada karyawan dengan ID {id_karyawan}.")