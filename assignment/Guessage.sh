#!/bin/bash

#Student Name: Jashanbir Singh
#Student id:10362649 

#This script is about guessing the age 
#random age generated by a random number generator
#prompt user for input
#then comparing the input with generated age to give idea about the guess whether its too low, too hifh or correct.
RED='\033[00;31m' #to change the colour of text to red.
YELLOW='\033[00;33m' #to change colour of text to yellow.
BLUE='\033[00;34m' #to change colour of text to blue.
GREEN='\033[00;32m' #to change colour of text to green.
NCOL='\033[0m' #no colour to text.


ranage=$(( RANDOM % (70 - 20 + 1) + 20)) #ranage is a variable for random age produced by #RANDOM FUNCTION in range of 20 to 70 including both.


while true; do     #start a while loop for testing the input and comparing it with ranage.
     
echo "Guess the Age of a person between 20 and 70."  #this will echo to user at start of game.
read -p "Enter the Age: " selage   #prompt user to enter input and store input in selage variable.

     if [[ $selage =~ ^[0-9] ]] && [ "$selage" -ge 20 ] && [ "$selage" -le 70 ]; then  #if structure to test the input i.e. input must made up of 0 to 9 and should be greater then 20 and less then 70.
         echo "Valid input. Comparing the input....." #if all above test is true than echo valid input comparing the input.
         
         if [ "$selage" -eq "$ranage" ]; then  #nested if statement to test the input variable with random age variable if its equal.
               echo -e "${GREEN}Hurray your guess is correct. You won the game.${NCOL}" # then echo you win the game.
               break   #then break out of loop to finish the game.

         elif [ "$selage" -gt "$ranage" ]; then #elif statment to test if user input 'selage' is greater then random age variable
              echo -e "${BLUE}Your guess is too high.${NCOL}Please try gain. \n" #then echo guess is too high.please try again and then it start again from while loop.

         elif [ "$selage" -lt "$ranage" ]; then #elif statement to if user input 'selage' is less then 'ranage' random age to guess.
              echo -e "${YELLOW}Your guess is too low.${NCOL}Please try again. \n" #then echo guess is too low and prompt again for input.
    
         fi

     else  #if the user input doesn't match the if test statement.
         echo -e "${RED}Invalid input.${NCOL}Please try again. \n" #then echo invalid input and prompt again for input.

     fi
        

done 

exit 0
