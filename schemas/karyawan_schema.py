
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