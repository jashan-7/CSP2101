#! /bin/bash

rtDir=~/CSP2101/

while true; do
      echo "AVAILABLE DIRECTORIES:"
      ls $rtDir
      read -p 'Enter a directory name from the list above: ' seldir

           if ! [ -d "${rtDir}${seldir}" ]; then
                echo "That dir not exist. please try again."
           else
                echo "You have selected the $seldir directory."
                break
           fi
        
done

# Request a passsword from user

while true; do
      read -s -p 'enter a new password for future use: ' selpw
        if ! [ -z "$selpw" ]; then
              echo "Thank you. Password accepted."
              break
        
        else
             echo "No password provided - please try again."
        fi
done     


if ! [ -f "${rtDir}${seldir}/secret.txt" ]; then
    echo "The file secret.txt does not yet exist. Creating file...."
    touch ${rtDir}${seldir}/secret.txt
    echo "Password now being written to file.."
    echo "$selpw" > "${rtDir}${seldir}/secret.txt"
    echo "Password has written to ${rtDir}${seldir}/secret.txt"
    cat "${rtDir}${seldir}/secret.txt"
    
else
    echo "The file secret.txt already exists. Password being written ...."
    echo "$selpw" >> "${rtDir}${seldir}/secret.txt"
    echo "Password has written to ${rtDir}${seldir}/secret.txt"
    cat "${rtDir}${seldir}/secret.txt"

fi

exit