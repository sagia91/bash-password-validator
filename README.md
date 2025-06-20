# 🔐 Bash Password Validator

A lightweight and customizable **password validation script written in Bash**.  
Perfect for sysadmins, DevOps engineers, or anyone working in minimal shell environments who needs local password rule enforcement.

---

## ✨ Features

- ✅ Enforces minimum length (default: 10 characters)
- 🔣 Requires digits, lowercase and uppercase letters
- 🧾 Displays all validation errors clearly
- 🎨 Colorful terminal output (auto-disabled if `tput` isn't available)
- 🐚 100% POSIX-compatible Bash – no external dependencies

---

## 🚀 Usage

Make the script executable and run it with a password as an argument:

    chmod +x password-validator.sh
    ./password-validator.sh "YourPassword123!"

If valid:

    Your password is strong. Keep it up!

If invalid:

    Password is not valid. Reasons:
      - Password must have a minimum of 10 characters.
      - Password must include both lowercase and uppercase letters.

If no password is provided:

    Error: No password provided.
    Usage: ./password-validator.sh "YourPasswordHere"

---

## ⚙️ How to Customize

Open `password-validator.sh` in a text editor. You can change or extend rules easily:

### 1. Change minimum password length

Find the line:

    if [[ ${#password} -lt 10 ]]; then

And replace `10` with your desired length, e.g.:

    if [[ ${#password} -lt 12 ]]; then

---

### 2. Add required special characters (optional)

Add this condition after the others:

    if [[ ! "$password" =~ [\!\@\#\$\%\^\&\*$begin:math:text$$end:math:text$\_\+\=\-$begin:math:display$$end:math:display$\{\}\;\:\'\"\\\|\<\>\,\.\?\/] ]]; then
        ErrorMessages+=("Password must contain at least one special character.")
    fi

---

### 3. Add custom checks (e.g., block dictionary words, username match, etc.)

Use `grep`, `awk`, or additional regex:

    if grep -qi "$password" common-passwords.txt; then
        ErrorMessages+=("Password is too common. Choose something more secure.")
    fi

---

## 📦 Installation

Clone the repository:

    git clone https://github.com/sagia91/bash-password-validator.git
    cd bash-password-validator
    chmod +x password-validator.sh

Then run:

    ./password-validator.sh "SomePasswordHere"

---

## 🔚 Exit Codes

| Code | Meaning                |
|------|------------------------|
| 0    | Password is valid      |
| 1    | Password failed checks |
| 2    | No password provided   |

---

## 🛠 Roadmap

- [ ] Add CLI flags (`--min-length`, `--require-symbol`)
- [ ] Interactive password input via `read -s`
- [ ] Dictionary word filter integration
- [ ] Localization (EN/HE output)

---

## 👤 Author

Created by **Sagi** – [github.com/sagia91](https://github.com/sagia91)

---

## 📄 License

MIT License – use freely, improve freely.
