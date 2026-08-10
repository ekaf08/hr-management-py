from pydantic import BaseModel, EmailStr
from datetime import date

class KaryawanCreate(BaseModel):
    nik: str
    nama_lengkap: str
    email: EmailStr
    tanggal_masuk: date
    departemen_id: int

class KaryawanUpdate(BaseModel):
    nama_lengkap: str
    email: EmailStr
    departemen_id: int

class Karyawan(BaseModel):
    id: int
    nik: str
    nama_lengkap: str
    email: EmailStr
    tanggal_masuk: date
    departemen_id: int
    status: str

class AbsensiMasuk(BaseModel):
    karyawan_id: int

class AbsensiKeluar(BaseModel):
    karyawan_id: int

    class Config:
        from_attributes = True