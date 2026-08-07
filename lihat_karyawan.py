from koneksi import get_koneksi

def tampilkan_semua_karyawan():
    conn = get_koneksi()
    cursor = conn.cursor()

    cursor.execute("SELECT id, nik, nama_lengkap, email, status FROM karyawan;")
    hasil = cursor.fetchall()

    if not hasil:
        print("Tidak ada data karyawan yang ditemukan.")
    else:
        print(f"Total karyawan: {len(hasil)}\n")
        for baris in hasil:
            id, nik, nama_lengkap, email, status = baris
            print(f"[{id}] {nik} - {nama_lengkap} ({email}) - Status: {status}")

    cursor.close()
    conn.close()

if __name__ == "__main__":
    tampilkan_semua_karyawan()
    