#!/bin/bash
#CSP2101-Scripting Languages
#Student Name: Jashanbir Singh
#Student id:10362649 


RED='\033[00;31m' #to change the colour of text to red.
YELLOW='\033[00;33m' #to change colour of text to yellow.
BLUE='\033[00;34m' #to change colour of text to blue.
GREEN='\033[00;32m' #to change colour of text to green.
NCOL='\033[0m' #no colour to text.
curl -s "https://www.ecu.edu.au/service-centres/MACSC/gallery/gallery.php?folder=152"  | grep  -o -e 'http[^"]*\.jpg' > imgUrls.txt  # curl will silently download all urls and give to grep to print only matching pattern as described to a text file. 


while true; do     #start a while loop for testing the input

echo -e "  Enter ${YELLOW}1${NCOL} to download specific thumbnail, ex ${YELLOW}DSC01576${NCOL}   
  Enter ${RED}2${NCOL} to download ${RED}ALL${NCOL} thumbnails.
  Enter ${BLUE}3${NCOL} to download images in a ${BLUE}range${NCOL}(by last 4 digit of file name)
  Enter ${GREEN}4${NCOL} to download ${GREEN}specific number${NCOL} of images.
  Enter 5 to exit \n"                                                                    # echo all the options to user.
read -p "Please Enter the option to download image/s: " option                           # prompt user to choose option and store it in 'option' variable.    
     
    if [[ "$option" =~ ^[1-5] ]]; then                             #if statement to test the input from user. so that it should be only b/w 1 to 5.
        
       
       if [ "$option" == 1 ]; then                                 #nested if statement if user enter 1 then.
         read -p "Please enter the image file name:" oneimage      # prompt user for image name to download and store in 'oneimage' variable.
              if ! [[ "$oneimage" =~ [^a-zA-Z0-9\ ] ]] && ! [[ "$oneimage" =~ ^DSC0[1-2][0-9][0-9][0-9] ]]; then   # if statement to test 'oneimage' variable. so that it should be aplha numeric and it start with DSC0 and four digits.
                 echo -e "${RED}Invalid input${NCOL}. Please Try Again \n"                    # if it not clear the test echo invalid input.
              else
                
                 if curl -s --output /dev/null --head --fail "https://secure.ecu.edu.au/service-centres/MACSC/gallery/152/$oneimage.jpg"; then  #if statement, curl will silently check if image exist or not.
                    wget -q -nc -e robots=off  -H -nd -p  -A "$oneimage.jpg" -P 1pic  https://www.ecu.edu.au/service-centres/MACSC/gallery/gallery.php?folder=152 #if it exist wget will download the specific image and store it in 1pic folder.
                    find 1pic -type f -printf "Downloading %.8f,with file name %f, with a file size of %k KB ...File Download Complete\n"  # to print the file name and its size.
                    break        #break out of loop.
                 else
                     echo -e "${YELLOW}image dosen't exist. Please try again${NCOL}.\n"   #if file doesn't exist echo this.
                 fi
                   
               fi
       
           
       elif [ "$option" == 2 ]; then                           # nested if statement if user choose option 2. 
           wget -q -e robots=off  -H -nd -p  --accept jpg,jpeg -P Allpics  https://www.ecu.edu.au/service-centres/MACSC/gallery/gallery.php?folder=152  #wget will quitely download all the jpg/jpeg images to Allpics folder 
           find Allpics -type f -printf "Downloading %.8f,with file name %f, with a file size of %k KB...File Download Complete\n"    #print file , file name and size of file being download.

           break     #break out of loop.

       
       
       
       elif [ "$option" == 3 ]; then         #nested if statement, if user choose 3.
           read -p "Please provide the start range(last 4 digits only):" startR    #prompt user for 4 digit starting range and store it in startR variable.
           read -p "Please provide the end range(last 4 digits only):" endR        #prompt user for 4 digit ending range of pics to be downloaded and store it in endR variable.
             if [[ "$startR" =~ ^[0-9] ]] && [ $startR -ge 1533 ] && [[ "$endR" =~ ^[0-9] ]] && [ $endR -le 2042 ]; then  #if statement to test if the range is in limit of number of images.
               
               for (( i = $startR; i <= endR; ++i )); do    #for loop to iterate through the given range.
                    wget  -q -e robots=off  -H -nd -p  --accept jpg,jpeg -P rpics  https://secure.ecu.edu.au/service-centres/MACSC/gallery/152/DSC0$i.jpg  #wget to quitley download the images one by one to rpics folder.
                    find rpics -type f -printf "Downloading %.8f,with file name %f, with a file size of %k KB...File Download Complete\n" #print file,file name and size of images.
               done
               break
             else 
                echo -e "${RED}Invalid range. Please try again${NCOL}.\n"   #if range is not in b/w above if test then echo invalid range.
             fi 
       
       
       
       elif [ "$option" == 4 ]; then    #nested if statement, if user choose 4.
              
              read -p "Enter number of images to be downloaded randomly: " numbers  #prompt user for number of images they want to download and store it in numbers variable.
               if [[ "$numbers" =~ ^[0-9] ]] && [ $numbers -ge 1 ] && [ "$numbers" -le 75 ]; then   #if test statemnt to test the input, so that it is in limit of number of images available.
                   shuf -n $numbers imgUrls.txt > random.txt            #shuf to generate randomly '$number' of lines from imgUrls.txt file and store it in random.txt.
                   wget -q  -e robots=off -nd --accept jpg,jpeg -P Npics -i random.txt #wget will quitley execute the urls in random.txt file and store downloaded images in Npics folder.
                   find Npics -type f -printf "Downloading %.8f,with file name %f, with a file size of %k KB...File Download Complete\n"  #print file,filename and size of downloaded images.
                   break
               else
                   echo -e "Invalid number. Try again. \n"      #if number is not in tested range then echo invalid.
               fi
       
       
       elif [ "$option" == 5 ]; then        #elif statement if user choose option 5.
            echo -e "Leaving program. thank you. \n\n"   #echo leaving program.
            break                                        #break out of loop to finish.
       fi   
    else 
       echo -e "Invalid input try again. \n"   #if user to something else than if test then echo invalid input.
    fi   


           
done
exit 0