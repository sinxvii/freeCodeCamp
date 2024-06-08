#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

MAIN(){

  echo -n "Enter your username: "
  read USERNAME

  USER_ID=$($PSQL "SELECT user_id FROM userdata WHERE uname = '$USERNAME'")

  if [[ $USER_ID ]]; then
    GAMES_PLAYED=$($PSQL "SELECT gplayed FROM userdata WHERE user_id = '$USER_ID'")

    BEST_GUESS=$($PSQL "SELECT gstat FROM userdata WHERE user_id = '$USER_ID'")

    echo -e "\nWelcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GUESS guesses."
  else
    echo -e "\nWelcome, $USERNAME! It looks like this is your first time here."

    INSERT_NEWUSER=$($PSQL "INSERT INTO userdata(uname) VALUES('$USERNAME')")
    USER_ID=$($PSQL "SELECT user_id FROM userdata WHERE uname = '$USERNAME'")
    INSERT_GAME=$($PSQL "UPDATE userdata SET gplayed = 0 WHERE user_id = '$USER_ID'")
  fi

GAME

}

GAME(){
  SECRET=$((1 + $RANDOM % 1000))
  TRIES=0
  GUESSED=0
  echo -e "\nGuess the secret number between 1 and 1000:"

  while [[ $GUESSED = 0 ]]; do
    read GUESS

    if [[ ! $GUESS =~ ^[0-9]+$ ]]; then
      echo -e "\nThat is not an integer, guess again:"
    elif [[ $SECRET = $GUESS ]]; then
      TRIES=$(($TRIES + 1))
      echo -e "\nYou guessed it in $TRIES tries. The secret number was $SECRET. Nice job!"
    
      UPDATE_STAT=$($PSQL "UPDATE userdata SET gstat = '$TRIES' WHERE user_id = '$USER_ID'")
      UPDATE_GAMES_PLAYED=$($PSQL "UPDATE userdata SET gplayed = gplayed + 1 WHERE user_id = '$USER_ID'")
      GUESSED=1
   
    elif [[ $SECRET -gt $GUESS ]]; then
      TRIES=$(($TRIES + 1))
      echo -e "\nIt's higher than that, guess again:"
   
    else
      TRIES=$(($TRIES + 1))
      echo -e "\nIt's lower than that, guess again:"
    fi
  done

}


MAIN