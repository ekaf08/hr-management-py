from karyawan_repository import KaryawanRepository

def main():
    repo = KaryawanRepository()

    print("=== Daftar Karyawan ===")
    semua_karyawan = repo.get_all()
    for k in semua_karyawan:
        print(f"[{k['id']}] {k['nik']} - {k['nama_lengkap']} ({k['status']})")

    print("\n=== Cari Karyawan ===")
    satu_karyawan = repo.get_by_id(1)
    print(f"[{satu_karyawan['id']}] {satu_karyawan['nik']} - {satu_karyawan['nama_lengkap']}")

    print("\n=== Karyawan Departemen 1 ===")
    karyawan_departemen = repo.get_by_departemen(1)
    for k in karyawan_departemen:
        print(f"[{k['id']}] {k['nik']} - {k['nama_lengkap']} - {k['tanggal_masuk']} ({k['status']})")


    repo.close()

if __name__ == "__main__":
    main()