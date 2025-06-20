# 🔐 Bash Password Validator

A lightweight and customizable **password validation script written in Bash**, designed for system administrators, DevOps engineers, or any developer looking for a shell-native way to enforce password complexity rules.

## ✨ Features

- ✅ Enforces minimum length
- 🔣 Checks for lowercase, uppercase, digit, and special character
- 📖 Prevents dictionary words (optional)
- 🧩 Easy to extend with your own rules
- 🐚 100% Bash – no external dependencies

## 🚀 Usage

Run the following in your terminal:

chmod +x password-validator.sh
./password-validator.sh "YourPassword123!"

The script will return:
- "Password is valid." – if all checks pass
- Or error messages for each failed condition

### 🔁 Sample Output

$ ./password-validator.sh "12345"
Password is too short (minimum 8 characters)
Password must include at least one lowercase letter
Password must include at least one uppercase letter
Password must include at least one special character

## ⚙️ Configuration

You can customize validation rules by editing the script:

- MIN_LENGTH – set your preferred minimum length
- ENABLE_DICTIONARY_CHECK=true – to prevent weak passwords
- Extend with custom regex-based checks

## 📦 Installation

Clone the repository:

git clone https://github.com/sagia91/bash-password-validator.git
cd bash-password-validator
chmod +x password-validator.sh

Then run it:

./password-validator.sh "SomeSecurePassword!"

## 🧠 Why Bash?

This validator is designed for minimal environments (e.g., Docker images, recovery consoles, SSH environments) where Python/Node.js isn't available.

## 🛠️ Roadmap

- [ ] Add CLI flags for rule customization
- [ ] Integrate with user management scripts
- [ ] Dictionary word blacklist from common leaks

## 👤 Author

Created by שגיא ([sagia91](https://github.com/sagia91))

## 📄 License

MIT License – use freely, improve freely.
