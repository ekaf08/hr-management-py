import tkinter as tk
from tkinter import ttk, messagebox
import requests

API_URL = "http://127.0.0.1:8000"  # Replace with your actual API


class HRApp:
    def __init__(self, root):
        self.root = root
        self.root.title("HR Management - Data Karyawan")
        self.root.geometry("1000x600")

        # PENTING: semua kolom yang ingin ditampilkan/di-set heading-nya
        # harus didaftarkan di parameter columns=(...) ini.
        self.tree = ttk.Treeview(
            root,
            columns=("id", "nik", "nama", "email", "status", "departemen_id", "tanggal_masuk"),
            show="headings"
        )
        self.tree.heading("id", text="ID")
        self.tree.heading("nik", text="NIK")
        self.tree.heading("nama", text="Nama")
        self.tree.heading("email", text="Email")
        self.tree.heading("status", text="Status")
        self.tree.heading("departemen_id", text="Departemen ID")
        self.tree.heading("tanggal_masuk", text="Tanggal Masuk")
        self.tree.pack(fill=tk.BOTH, expand=True, padx=10, pady=10)

        # Frame untuk kumpulan tombol, biar rapi sejajar horizontal
        frame_tombol = ttk.Frame(root)
        frame_tombol.pack(pady=5)

        btn_refresh = ttk.Button(frame_tombol, text="Refresh Data", command=self.load_karyawan)
        btn_refresh.grid(row=0, column=0, padx=5)

        btn_tambah = ttk.Button(frame_tombol, text="Tambah Karyawan", command=self.buka_form_tambah)
        btn_tambah.grid(row=0, column=1, padx=5)

        btn_edit = ttk.Button(frame_tombol, text="Edit Karyawan", command=self.buka_form_edit)
        btn_edit.grid(row=0, column=2, padx=5)

        btn_hapus = ttk.Button(frame_tombol, text="Resign Karyawan", command=self.hapus_karyawan)
        btn_hapus.grid(row=0, column=3, padx=5)

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
                    k["id"],
                    k["nik"],
                    k["nama_lengkap"],
                    k["email"],
                    k["status"],
                    k["departemen_id"],
                    k["tanggal_masuk"],
                ))

        except requests.exceptions.RequestException as e:
            messagebox.showerror("Error", f"Gagal mengambil data: {e}")

    def buka_form_tambah(self):
        """Buka window baru untuk menambah data karyawan."""
        form = tk.Toplevel(self.root)
        form.title("Tambah Data Karyawan")
        form.geometry("400x400")

        ttk.Label(form, text="NIK").pack(pady=(10, 0))
        entry_nik = ttk.Entry(form, width=40)
        entry_nik.pack()

        ttk.Label(form, text="Nama Lengkap").pack(pady=(10, 0))
        entry_nama = ttk.Entry(form, width=40)
        entry_nama.pack()

        ttk.Label(form, text="Email").pack(pady=(10, 0))
        entry_email = ttk.Entry(form, width=40)
        entry_email.pack()

        ttk.Label(form, text="Tanggal Masuk (YYYY-MM-DD)").pack(pady=(10, 0))
        entry_tanggal = ttk.Entry(form, width=40)
        entry_tanggal.pack()

        ttk.Label(form, text="ID Departemen").pack(pady=(10, 0))
        entry_departemen = ttk.Entry(form, width=40)
        entry_departemen.pack()

        def simpan():
            nik = entry_nik.get().strip()
            nama = entry_nama.get().strip()
            email = entry_email.get().strip()
            tanggal = entry_tanggal.get().strip()
            departemen = entry_departemen.get().strip()

            # Validasi sederhana: cek wajib tidak kosong
            if not nik or not nama or not email or not tanggal or not departemen:
                messagebox.showwarning("Peringatan", "Semua field harus diisi!")
                return

            payload = {
                "nik": nik,
                "nama_lengkap": nama,
                "email": email,
                "tanggal_masuk": tanggal,
                "departemen_id": departemen,
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

    def get_selected_karyawan(self):
        """Ambil data karyawan yang sedang di-klik/dipilih dari tabel."""
        selected = self.tree.selection()  # mengembalikan tuple berisi item yang dipilih

        if not selected:
            messagebox.showwarning("Peringatan", "Pilih salah satu karyawan terlebih dahulu!")
            return None

        item = self.tree.item(selected[0])  # ambil detail item pertama yang dipilih
        return item["values"]  # list: [id, nik, nama, email, status, departemen_id, tanggal_masuk]

    def buka_form_edit(self):
        data = self.get_selected_karyawan()
        if data is None:
            return

        # Urutan HARUS sama dengan urutan kolom di Treeview:
        # id, nik, nama, email, status, departemen_id, tanggal_masuk
        id_karyawan, nik, nama_lama, email_lama, status, departemen_lama, tanggal_masuk_lama = data

        form = tk.Toplevel(self.root)
        form.title(f"Edit Karyawan - {nik}")
        form.geometry("400x400")

        ttk.Label(form, text="Nama Lengkap").pack(pady=(10, 0))
        entry_nama = ttk.Entry(form, width=40)
        entry_nama.insert(0, nama_lama)   # isi otomatis dengan data lama
        entry_nama.pack()

        ttk.Label(form, text="Email").pack(pady=(10, 0))
        entry_email = ttk.Entry(form, width=40)
        entry_email.insert(0, email_lama)
        entry_email.pack()

        ttk.Label(form, text="Tanggal Masuk (YYYY-MM-DD)").pack(pady=(10, 0))
        entry_tanggal = ttk.Entry(form, width=40)
        entry_tanggal.insert(0, tanggal_masuk_lama)
        entry_tanggal.pack()

        ttk.Label(form, text="ID Departemen").pack(pady=(10, 0))
        entry_departemen = ttk.Entry(form, width=40)
        entry_departemen.insert(0, departemen_lama)
        entry_departemen.pack()

        def simpan_edit():
            payload = {
                "nama_lengkap": entry_nama.get().strip(),
                "email": entry_email.get().strip(),
                "departemen_id": entry_departemen.get().strip(),
                "tanggal_masuk": entry_tanggal.get().strip(),
            }

            try:
                response = requests.put(f"{API_URL}/karyawan/{id_karyawan}", json=payload)
                response.raise_for_status()

                messagebox.showinfo("Sukses", "Data karyawan berhasil diupdate!")
                form.destroy()
                self.load_karyawan()

            except requests.exceptions.HTTPError as e:
                detail = response.json().get("detail", str(e))
                messagebox.showerror("Gagal", f"Terjadi kesalahan: {detail}")
            except requests.exceptions.RequestException as e:
                messagebox.showerror("Error", f"Tidak bisa terhubung ke server: {e}")

        btn_simpan = ttk.Button(form, text="Update", command=simpan_edit)
        btn_simpan.pack(pady=15)

    def hapus_karyawan(self):
        data = self.get_selected_karyawan()
        if data is None:
            return

        # Urutan HARUS sama dengan urutan kolom di Treeview
        id_karyawan, nik, nama, email, status, departemen, tanggal_masuk = data

        # Konfirmasi dulu sebelum eksekusi - best practice untuk aksi yang tidak bisa dibatalkan
        konfirmasi = messagebox.askyesno(
            "Konfirmasi", f"Yakin ingin menandai '{nama}' sebagai resign?"
        )

        if not konfirmasi:
            return

        try:
            response = requests.delete(f"{API_URL}/karyawan/{id_karyawan}")
            response.raise_for_status()

            messagebox.showinfo("Sukses", "Karyawan berhasil ditandai resign.")
            self.load_karyawan()

        except requests.exceptions.RequestException as e:
            messagebox.showerror("Error", f"Gagal menghapus data: {e}")


if __name__ == "__main__":
    root = tk.Tk()
    app = HRApp(root)
    root.mainloop()