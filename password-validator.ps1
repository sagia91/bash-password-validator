#! /opt/microsoft/powershell/7/pwsh

#define flag f as a switch
param (
    [switch]$f
);

#gets password either from a file or as a parameter to the script
#(default is parameter, if flag -f, read password from the file in filepath that comes after that)
#or shows error if theres no parameters
if ($f.IsPresent) {
    $Password = Get-Content $args[0].ToString() -Raw
}
elseif ($args.Count -eq 0) {
    Write-Output("No Password found!");
    exit 1;
}
else {
    $Password = $args[0].ToString()
}

#assign an array for error messeges
$ErrorMesseges = @()

#checking and adding an error if the password's lenght is smaller than 10
if ($Password.Length -lt 10) {
    $ErrorMesseges+= "Password must have a minimum of 10 characters"
}

#checking and adding an error if the password does'nt have numbers or letters
if (!($Password -cmatch "^(?=.*[a-zA-Z])(?=.*[0-9])")) {
    $ErrorMesseges += "Password must contain both alphabet and number"
}

#checking and adding an error if the password does'nt have either small letters or big letters
if (!($Password -cmatch "^(?=.*[A-Z])(?=.*[a-z])")) {
    $ErrorMesseges += "Password must include both the small and capital case letters."
}

#if there are no error messeges, tell the user his password is strong in green text
#and exit with code 0
if ($ErrorMesseges.count -eq 0) {
    Write-Host "Your password is strong. keep it up." -foregroundcolor GREEN
    exit 0
}

#at this point there are errors in the array
#we print the errors and exit with code 1
Write-Host "Password is not valid. This is why:" -foregroundcolor RED
Write-Host ($ErrorMesseges -join "`n") -foregroundcolor RED
exit 1