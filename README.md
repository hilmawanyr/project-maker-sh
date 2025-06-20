
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

Agar perintah `create_project` bisa dijalankan dari direktori mana pun di terminal, cukup buat symbolic link (symlink) ke dalam direktori yang ada di `PATH`.

---

### ✅ For macOS and Linux

#### 1. Simpan Script

Simpan isi script ke file `create_project.sh` di direktori mana pun, misalnya di `~/scripts`:

```bash
mkdir -p ~/scripts
nano ~/scripts/create_project.sh
# (Tempelkan isi script, simpan dengan Ctrl+O, Enter, lalu keluar Ctrl+X)
```

#### 2. Beri Izin Eksekusi

```bash
chmod +x ~/scripts/create_project.sh
```

#### 3. Buat Symlink ke PATH

Misalnya kita ingin menautkan ke `~/bin`:

```bash
mkdir -p ~/bin
ln -s ~/scripts/create_project.sh ~/bin/create_project
```

#### 4. Tambahkan `~/bin` ke PATH (Jika belum)

Edit file shell config (`~/.zshrc`, `~/.bashrc`, atau `~/.profile`) dan tambahkan:

```bash
export PATH="$HOME/bin:$PATH"
```

Lalu muat ulang shell:

```bash
source ~/.zshrc  # atau ~/.bashrc / ~/.profile tergantung shell kamu
```

---

### 🪟 For Windows (Using Git Bash or WSL)

#### 💡 Menggunakan Git Bash

1. **Install Git for Windows**
   Download dari: [https://git-scm.com/download/win](https://git-scm.com/download/win)

2. **Simpan Script**
   Simpan sebagai `create_project.sh`, misalnya di: `C:\Users\YourUser\Documents\scripts`

3. **Buka Git Bash**, navigasikan ke direktori script:

```bash
cd /c/Users/YourUser/Documents/scripts
chmod +x create_project.sh
```

4. **Buat Symlink ke `~/bin`**

```bash
mkdir -p ~/bin
ln -s /c/Users/YourUser/Documents/scripts/create_project.sh ~/bin/create_project
```

Tutup dan buka ulang Git Bash.

---

#### 🐧 Menggunakan WSL

1. **Install WSL**
   Ikuti: [https://learn.microsoft.com/en-us/windows/wsl/install](https://learn.microsoft.com/en-us/windows/wsl/install)

2. **Simpan Script**
   Simpan di direktori home WSL, misalnya `~/scripts/create_project.sh`

3. **Ikuti langkah yang sama seperti di macOS/Linux**

---

## 🚀 How to Use the Script

Setelah script disiapkan, kamu bisa menjalankannya seperti ini:

### 1. Buat proyek di direktori saat ini (default):

```bash
create_project my-new-application
```

### 2. Buat proyek di direktori tertentu:

```bash
create_project another-application /path/to/your/projects
```

🔸 Contoh:

```bash
create_project my_backend
# Akan dibuat di: /home/user/my_backend

create_project my_backend /var/www/html
# Akan dibuat di: /var/www/html/my_backend
```

Untuk Git Bash/WSL, gunakan path bergaya Linux seperti `/c/Users/YourUser/Documents`.
