#!/bin/bash

while true; do

read -p "Please enter the image file name:" oneimage
    
   if ! [[ "$oneimage" =~ [^a-zA-Z0-9\ ] ]] && ! [[ "$oneimage" =~ ^DSC0[1-2][0-9][0-9][0-9] ]]; then
       echo "Invalid input"
   else
      
       if curl -s --output /dev/null --head --fail "https://secure.ecu.edu.au/service-centres/MACSC/gallery/152/$oneimage.jpg"; then
          echo " exist"
       
       else
          echo "not exist"
          #wget -nc -q -e robots=off  -H -nd -p  -A $oneimage.jpg --limit-rate=200k --wait 1.0 -P 1pic  https://www.ecu.edu.au/service-centres/MACSC/gallery/gallery.php?folder=152
          break
       fi
       
   fi   
done
exit 0