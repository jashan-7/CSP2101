#!/bin/bash

#Student Name: Jashanbir Singh
#Student id:10362649 
     


if ! [ -f rectangle.txt ] ; then  # if there is no file in directory
     echo "No file to process."    #print on screen no file to process
     exit 0

else     
     sed -e '1d'\
         -e 's/,/  /g'\
         -e 's/^\(.[^ ]*\)[ ]*\(.[^ ]*\)[ ]*\(.[^ ]*\)[ ]*\(.[^ ]*\)[ ]*\(.[^ ]*\)/Name: \1    Height: \2    Width: \3    Area: \4    Colour: \5/g'\
         -e 's/  /\t/g' rectangle.txt > rectangle_f.txt # first argument delete header line from output.
                                                        # 2nd argument replace commas with two spaces.
                                                        # 3rd argument do grouping of words according to their position and backrefer them to their column.
                                                        # 4th argument replace empty space with tab to organize the columns.
fi
