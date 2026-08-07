from fastapi import FastAPI, HTTPException

from karyawan_repository import KaryawanRepository
from schemas import Karyawan, KaryawanCreate, KaryawanUpdate

app = FastAPI(title="HR Management API", version="1.0.0")

@app.get("/karyawan")
def list_karyawan():
    repo = KaryawanRepository()
    data = repo.get_all()
    repo.close()
    return data

@app.get("/karyawan/{id_karyawan}")
def get_karyawan(id_karyawan: int):
    repo = KaryawanRepository()
    data = repo.get_by_id(id_karyawan)
    repo.close()

    if data is None:
        raise HTTPException(status_code=404, detail="Karyawan tidak ditemukan")
    return data

@app.post("/karyawan", status_code=201)
def create_karyawan(payload: KaryawanCreate):
    repo = KaryawanRepository()
    id_baru = repo.create(
        payload.nik,
        payload.nama_lengkap,
        payload.email,
        payload.tanggal_masuk,
        payload.departemen_id
    )
    repo.close()
    return {"id": id_baru, "message": "Karyawan berhasil ditambahkan"}

@app.put("/karyawan/{id_karyawan}")
def update_karyawan(id_karyawan: int, payaload: KaryawanUpdate):
    repo = KaryawanRepository()
    jumlah = repo.update(
        id_karyawan,
        payaload.nama_lengkap,
        payaload.email,
        payaload.departemen_id
    )
    repo.close()

    if jumlah == 0:
        raise HTTPException(status_code=404, detail="Karyawan tidak ditemukan")
    return {"message": "Karyawan berhasil diperbarui"}

@app.delete("/karyawan/{id_karyawan}")
def resign_karyawan(id_karyawan: int):
    repo = KaryawanRepository()
    jumlah = repo.nonaktifkan(id_karyawan)
    repo.close()

    if jumlah == 0:
        raise HTTPException(status_code=404, detail="Karyawan tidak ditemukan")
    return {"message": "Karyawan berhasil dinonaktifkan"}


