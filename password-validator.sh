#!/bin/bash

# Constants for styling output
GREEN='\033[0;32m'
RED='\033[0;31m'
NOCOLOR='\033[0m'
BOLD=$(tput bold 2>/dev/null || echo "")
NOBOLD=$(tput sgr0 2>/dev/null || echo "")

# An array for error messages
ErrorMessages=()

# Setting first argument as password
password="$1"

# Check for empty input
if [[ -z "$password" ]]; then
    echo -e "${RED}Error: No password provided.${NOCOLOR}"
    echo "Usage: $0 \"YourPasswordHere\""
    exit 2
fi

# Check if the password's length is less than 10
if [[ ${#password} -lt 10 ]]; then
    ErrorMessages+=("Password must have a minimum of 10 characters.")
fi

# Check if password contains both letters and numbers
if [[ ! "$password" =~ [0-9] ]] || [[ ! "$password" =~ [a-zA-Z] ]]; then
    ErrorMessages+=("Password must contain both letters and numbers.")
fi

# Check if password contains both lowercase and uppercase
if [[ ! "$password" =~ [a-z] ]] || [[ ! "$password" =~ [A-Z] ]]; then
    ErrorMessages+=("Password must include both lowercase and uppercase letters.")
fi

# Final output
if [[ ${#ErrorMessages[@]} -eq 0 ]]; then
    echo -e "${GREEN}Your password is strong. Keep it up!${NOCOLOR}"
    exit 0
else
    echo -e "${RED}Password is ${BOLD}not valid${NOBOLD}${RED}. Reasons:${NOCOLOR}"
    for msg in "${ErrorMessages[@]}"; do
        echo -e "  - $msg"
    done
    exit 1
fi
