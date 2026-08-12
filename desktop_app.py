import tkinter as tk
from tkinter import ttk, messagebox
import requests

API_URL = "http://127.0.0.1:8000"  # Replace with your actual API 

class HRApp:
    def __init__(self, root):
        self.root = root
        self.root.title("HR Management - Data Karyawan")
        self.root.geometry("600x400")

        self.tree = ttk.Treeview(
            root, columns=("id", "nik", "nama", "email", "status"), show="headings"
        )
        self.tree.heading("id", text="ID")
        self.tree.heading("nik", text="NIK")
        self.tree.heading("nama", text="Nama")
        self.tree.heading("email", text="Email")
        self.tree.heading("status", text="Status")
        self.tree.pack(fill=tk.BOTH, expand=True, padx=10, pady=10)

        # Frame untuk kumpulan tombol, biar rapi sejajar horizontal
        frame_tombol = ttk.Frame(root)
        frame_tombol.pack(pady=5)

        btn_refresh = ttk.Button(frame_tombol, text="Refresh Data", command=self.load_karyawan)
        btn_refresh.grid(row=0, column=0, padx=5)

        btn_tambah = ttk.Button(frame_tombol, text="Tambah Karyawan", command=self.buka_form_tambah)
        btn_tambah.grid(row=0, column=1, padx=5)

        self.load_karyawan()

    def load_karyawan(self):
        # Kosongkan tabel dulu sebelum load ulang
        for item in self.tree.get_children():
            self.tree.delete(item)

        try:
            response = requests.get(f"{API_URL}/karyawan")
            response.raise_for_status()
            data = response.json()

            for k in data:
                self.tree.insert("", tk.END, values=(
                    k["id"], k["nik"], k["nama_lengkap"], k["email"], k["status"]
                ))

        except requests.exceptions.RequestException as e:
            messagebox.showerror("Error", f"Gagal mengambil data: {e}")

    def buka_form_tambah(self):
        """Buka window baru untuk menambah data karyawan."""
        form = tk.Toplevel(self.root)
        form.title("Tambah Data Karyawan")
        form.geometry("350x300")

        # Label + Input NIK
        ttk.Label(form, text="NIK").pack(pady=(10, 0))
        entry_nik = ttk.Entry(form, width=40)
        entry_nik.pack()

        # Label + Input Nama
        ttk.Label(form, text="Nama Lengkap").pack(pady=(10, 0))
        entry_nama = ttk.Entry(form, width=40)
        entry_nama.pack()

        # Label + Input Email
        ttk.Label(form, text="Email").pack(pady=(10, 0))
        entry_email = ttk.Entry(form, width=40)
        entry_email.pack()

        # Label + Input Tanggal Masuk
        ttk.Label(form, text="Tanggal Masuk (YYYY-MM-DD)").pack(pady=(10, 0))
        entry_tanggal = ttk.Entry(form, width=40)
        entry_tanggal.pack()

        # Label + Input Departemen ID
        ttk.Label(form, text="ID Departemen").pack(pady=(10, 0))
        entry_departemen = ttk.Entry(form, width=40)
        entry_departemen.pack()

        def simpan():
            payload = {
                "nik": entry_nik.get(),
                "nama_lengkap": entry_nama.get(),
                "email": entry_email.get(),
                "tanggal_masuk": entry_tanggal.get(),
                "departemen_id": entry_departemen.get(),
            }

            try:
                response = requests.post(f"{API_URL}/karyawan", json=payload)
                response.raise_for_status()

                messagebox.showinfo("Sukses", "Karyawan berhasil ditambahkan!")
                form.destroy()          # tutup window form
                self.load_karyawan()    # refresh tabel di window utama

            except requests.exceptions.HTTPError as e:
                # Ambil detail pesan error dari response API (dari HTTPException FastAPI)
                detail = response.json().get("detail", str(e))
                messagebox.showerror("Gagal", f"Terjadi kesalahan: {detail}")
            except requests.exceptions.RequestException as e:
                messagebox.showerror("Error", f"Tidak bisa terhubung ke server: {e}")

        btn_simpan = ttk.Button(form, text="Simpan", command=simpan)
        btn_simpan.pack(pady=15)

        
if __name__ == "__main__":
    root = tk.Tk()
    app = HRApp(root)
    root.mainloop()