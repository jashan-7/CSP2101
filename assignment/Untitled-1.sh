#!/bin/bash
curl {https://www.ecu.edu.au/service-centres/MACSC/gallery/gallery.php?folder=152}  | grep -o -e 'http[^"]*\.jpg' > imgs.txt

downloadOne()
{ 
    read -p "please select the image:" digit
    wget  https://www.ecu.edu.au/service-centres/MACSC/gallery/gallery.php?folder=152/DSC0$digit.jpg

}

downloadALL()
{
    wget -i imgs.txt
}
downloadRange()
{

    read -p "start range:" start
    read -p "end range " end
    
    for (( i = $start; i <= end; ++i )); do
       wget  https://secure.ecu.edu.au/service-centres/MACSC/gallery/152/DSC0$i.jpg
    
    done 
}

downloadRandom()
{
    read -p "enter number of images" numbers
    shuf -n $numbers imgs.txt > chosen.txt
    wget -i chosen.txt
}

echo "1) specific pic
2 all image
3 image in a range
4 number of images"
read -p "input your option" option

case $option in 
     1)
       downloadOne ;;
     2)
       downloadALL ;;
     3)
       downloadRange ;;
     4) 
       downloadRandom ;;
     *)
       echo "error" ;;
esac