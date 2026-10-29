# 📡 Termux WiFi Hunter

**WiFi Hunter** adalah utility sederhana berbasis **Termux** yang dirancang untuk membantu kamu menemukan koneksi WiFi gratisan dengan cepat. Tools ini bekerja dengan prinsip "Scouting": mendeteksi nama-nama WiFi yang terdeteksi oleh HP kamu (Broadcast SSID) dan mencocokkannya dengan memori cache Termux (`wpa_supplicant.conf`) yang menyimpan nama-nama WiFi yang pernah digabung atau tersimpan.

✅ **Status:** Stable  
✅ **Bahasa:** Bash (Termux Specific)  
👤 **Author:** [Danzzy]  

---

## 🌟 Fitur Utama
- **Auto-Scan:** Mengambil data langsung dari driver WiFi HP menggunakan `nmcli`.
- **Cache Matching:** Membandingkan sinyal terdeteksi dengan daftar file konfigurasi Termux.
- **Compact Output:** Tampilan output yang bersih dan mudah dibaca di layar kecil.
- **Free Tool:** Tidak ada biaya berlangganan, satu kali setup selamanya.

---

## 🛠️ Prasyarat
Pastikan Termux kamu sudah terupdate dengan paket-paket berikut (opsional tapi disarankan):
- `nmcli` (Network Manager Command Line Interface)
- `bat` (Untuk warna output yang cantik - opsional)

**Cek versi Termux:**
```bash
termux-version
