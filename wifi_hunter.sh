#!/data/data/com.termux/files/usr/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

echo -e "${RED}╔══════════════════════════════╗"
echo -e "${RED}║  WIFI HUNTER - TERMUX EDITION  ║"
echo -e "${RED}╚══════════════════════════════╝${NC}"
echo ""
echo -e "${GREEN}Menjaring WiFi Gratisan...${NC}"
echo ""

# 1. Simpan nama-nama WiFi yang terdeteksi di layar (Broadcast SSID)
# Perintah ini menggunakan output 'esc' dari nmcli atau wifi-tools
detect_wifi() {
    # Kita ambil output dari nmcli device wifi list
    # Outputnya biasanya: 123456789012345678901234567890 0% 5GHz  MyWiFi
    # Kita ambil teks setelah angka 신호strength atau persentase, dan sebelum teks frekuensi
    nmcli device wifi list --terseparate 2>/dev/null | cut -d' ' -f5-
}

# 2. Fungsi mencari nama WiFi di file wpa_supplicant.conf (Cache Termux)
# File ini tersimpan otomatis setiap kali ada proses 'wpa_cli' berjalan
check_cache() {
    local target_name=$1
    grep -ir "$target_name" /data/data/com.termux/files/usr/etc/wpa_supplicant/wpa_supplicant.conf 2>/dev/null
}

# 3. Fungsi Pembersih (Clear Console) agar output rapi
clear_console() {
    echo -e "${GREEN}★${NC}"
}

# Variabel penampung hasil
found_wifi=""

# Perulangan dijalankan 15 kali (sesuaikan dengan banyak scan)
for seq in {1..15}; do
    # Luncurkan perintah scan
    detect_wifi >> /tmp/wifi_scan_output.tmp
    
    # Ambil beberapa baris agar tidak desperate (kalisoduos)
    sed -n "$((seq-1))p" /tmp/wifi_scan_output.tmp | while read line; do
        # Bersihkan garis ganda dan ambil nama WiFi (biasanya di kolom 4 atau 5)
        # Format: SSID SS SS-SSID 5GHz
        clean_line=$(echo "$line" | sed 's/.*\s\s\s//' | sed 's/\s*$//')
        
        if [ -n "$clean_line" ]; then
            echo -e "${GREEN}✓ Searah$NC: $clean_line"
            check_cache "$clean_line" | while read result; do
                if [ -n "$result" ]; then
                    echo -e "${GREEN}  ▼ Cocok! (Sinyal) $NC"
                    echo "$result" | xargs # Hapus spasi berlebih
                fi
            done
        fi
    done | less # Gunakan 'less' agar bisa discroll penampilannya
    
done
