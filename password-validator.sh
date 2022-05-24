#!/bin/bash

#constanst for styling output
GREEN='\033[0;32m'
RED='\033[0;31m'
NOCOLOR='\033[0m'
BOLD=$(tput bold)
NOBOLD=$(tput sgr0)

#an array for error messeges
ErrorMesseges=()

#gets password either from a file or as a parameter to the script
#(default is parameter, if flag -f, read password from the file in filepath that comes after that)
if [[ $1 -eq "-f" ]]; then
    password=$(<$2)
else
    password=$1
fi

#checking and adding an error if the password's lenght is smaller than 10
if [[ ${#Password} -lt 10 ]]; then
    ErrorMesseges+=("Password must have a minimum of 10 characters")
fi

#checking and adding an error if the password does'nt have numbers or letters
if [[ ! $Password =~ [0-9] ]] || [[ ! $Password =~ ([a-zA-Z]+) ]]; then
    ErrorMesseges+=("Password must contain both alphabet and number")
fi

#checking and adding an error if the password does'nt have either small letters or big letters
if [[ ! $Password =~ ([a-z]+) ]] || [[ ! $Password =~ ([A-Z]+) ]]; then
    ErrorMesseges+=("Password must include both the small and capital case letters.")
fi

#if there are no error messeges, tell the user his password is strong in green text
#and exit with code 0
if [[ ${#ErrorMesseges[@]} -eq 0 ]]; then
    echo -e "${GREEN}Your password is strong. keep it up.${NOCOLOR}"
    exit 0
fi

#at this point there are errors in the array
#here we print the errors with some text styling
#and exit with code 1
echo -e -n "${RED}Password is ${BOLD}not valid${NOBOLD}${RED}. This is why:"
printf '\n◊%s' "${ErrorMesseges[@]}" #printing each error in new line
echo -e "${NOCOLOR}"
exit 1