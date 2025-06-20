# 🔐 Bash Password Validator

A lightweight and customizable **password validation script written in Bash**.  
Ideal for system administrators, DevOps engineers, or anyone needing to enforce robust password rules in shell-only environments.

---

## ✨ Features

- ✅ Minimum length **10** characters (configurable)
- 🔢 Requires at least one digit
- 🔠 Requires both lowercase **and** uppercase letters
- 💬 Clear error list for every failed rule
- 🎨 Colored output (automatically disabled if `tput` isn’t available)
- 🐚 Pure Bash – no external dependencies

---

## 🚀 Usage

```bash
# Make executable once
chmod +x password-validator.sh

# Validate a password
./password-validator.sh "YourPassword123!"
