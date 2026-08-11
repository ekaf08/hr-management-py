from pydantic import BaseModel


class AbsensiMasuk(BaseModel):
    karyawan_id: int


class AbsensiKeluar(BaseModel):
    karyawan_id: int