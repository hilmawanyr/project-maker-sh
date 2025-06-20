
# Project Structure Creator Script

**`create_project`** adalah script shell yang mengotomatisasi pembuatan struktur folder proyek yang telah ditentukan. Script ini dapat dijalankan secara global di **macOS**, **Linux**, dan **Windows** (melalui Git Bash atau WSL).

---

## 📁 Project Structure Generated

Ketika script dijalankan, struktur folder berikut akan dibuat:

```
|- run.dev.sh
|- run.prod.sh
src
|- app
|- |- bootstrap.ts
|- data
|- |- model
|- |- repository
|- domain
|- |- dtos
|- |- entities
|- |- repositories
|- |- usecases
|- handler
|- infra
|- |- job
|- |- |- event
|- |- |- queue
|- |- |- service
|- |- |- worker
|- |- config
|- |- |- database.conf.ts
|- |- |- types.ts
|- |- |- provider.ts
|- |- database
|- |- |- mysql.resolver.ts
|- |- helper
|- |- lib
|- |- locale
|- |- logger
|- |- middleware
|- |- port
|- |- |- database.interface.ts
|- |- |- services.interface.ts
|- |- server
|- |- service
|- router
|- main.ts
test
.env
.env.example
```

---

## 🛠️ How to Make the Script Globally Executable

Agar perintah `create_project` bisa dijalankan dari direktori mana pun di terminal, lakukan langkah-langkah berikut:

---

### ✅ For macOS and Linux

#### 1. Save the Script

Simpan isi script ke dalam file `create_project.sh` di direktori `Home (~)`:

```bash
nano ~/create_project.sh
# (Tempelkan isi script, lalu tekan Ctrl+O, Enter, dan Ctrl+X)
```

#### 2. Beri Hak Eksekusi

```bash
chmod +x ~/create_project.sh
```

#### 3. Pindahkan Script ke Direktori PATH

```bash
mkdir -p ~/bin
mv ~/create_project.sh ~/bin/create_project
```

#### 4. Tambahkan ~/bin ke PATH (Jika belum)

Edit konfigurasi shell (`~/.zshrc`, `~/.bashrc`, atau `~/.profile`) dan tambahkan:

```bash
export PATH="$HOME/bin:$PATH"
```

Kemudian muat ulang:

```bash
source ~/.zshrc  # Atau ~/.bashrc / ~/.profile sesuai shell yang digunakan
```

---

### 🪟 For Windows (Using Git Bash or WSL)

#### 💡 Menggunakan Git Bash

1. **Install Git for Windows**
   Download dari: [https://git-scm.com/download/win](https://git-scm.com/download/win)

2. **Simpan Script**
   Simpan file `create_project.sh` di folder seperti `C:\Users\YourUser\Documents`

3. **Buka Git Bash** dan navigasi ke lokasi script:

```bash
cd /c/Users/YourUser/Documents
chmod +x create_project.sh
```

4. **Pindahkan ke PATH Git Bash**

```bash
mkdir -p ~/bin
mv create_project.sh ~/bin/create_project
```

Tutup dan buka kembali Git Bash untuk memastikan `PATH` diperbarui.

---

#### 🐧 Menggunakan Windows Subsystem for Linux (WSL)

1. **Install WSL**
   Ikuti panduan dari Microsoft:
   [https://learn.microsoft.com/en-us/windows/wsl/install](https://learn.microsoft.com/en-us/windows/wsl/install)

2. **Buka Terminal WSL** (misal "Ubuntu")

3. **Ikuti Langkah seperti di macOS/Linux**, simpan script dalam filesystem WSL (`~`) atau gunakan `/mnt/c/` untuk mengakses file dari drive Windows.

---

## 🚀 How to Use the Script

Setelah script dapat dijalankan secara global, kamu bisa menjalankannya dengan dua cara:

### 1. Buat proyek di direktori saat ini (default):

```bash
create_project my-new-application
```

Akan membuat folder `my-new-application` di direktori saat ini.

### 2. Buat proyek di direktori tertentu:

```bash
create_project another-application /path/to/your/projects
```

🔸 Contoh:

```bash
create_project my_backend
# Akan dibuat di: /home/user/my_backend (jika sedang di /home/user)

create_project my_backend /var/www/html
# Akan dibuat di: /var/www/html/my_backend
```

Untuk pengguna Git Bash/WSL, gunakan path bergaya Linux seperti `/c/Users/YourUser/Documents`.
