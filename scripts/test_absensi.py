from repositories.absensi_repository import AbsensiRepository

def main():
    repo = AbsensiRepository()

    print("=== Catat Masuk Karyawan ===")
    try:
        id_absensi = repo.catat_masuk(karyawan_id=1)
        print(f"Absensi masuk dicatat dengan ID: {id_absensi}")
    except ValueError as e:
        print(f"⚠️  {e}")

    print("\n=== Catat Keluar Karyawan ===")
    baris_terupdate = repo.catat_keluar(karyawan_id=1)
    print(f"Jumlah baris yang terupdate saat catat keluar: {baris_terupdate}")

    print("\n=== Ambil Absensi Bulanan ===")
    absensi_bulanan = repo.get_by_bulan(karyawan_id=1, bulan=8, tahun=2026)
    for a in absensi_bulanan:
        print(f"[{a['id']}] Tanggal: {a['tanggal']}, Jam Masuk: {a['jam_masuk']}, Jam Keluar: {a['jam_keluar']}, Status: {a['status']}")

    repo.close()

if __name__ == "__main__":
    main()