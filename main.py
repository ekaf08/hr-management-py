from karyawan_repository import KaryawanRepository

def main():
    repo = KaryawanRepository()

    print("=== Daftar Karyawan ===")
    semua_karyawan = repo.get_all()
    for k in semua_karyawan:
        print(k)

    print("\n=== Cari Karyawan ===")
    satu_karyawan = repo.get_by_id(1)
    print(satu_karyawan)

    print("\n=== Karyawan Departemen 1 ===")
    karyawan_departemen = repo.get_by_departemen(1)
    for k in karyawan_departemen:
        print(k)


    repo.close()

if __name__ == "__main__":
    main()