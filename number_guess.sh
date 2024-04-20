#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# generate random number between 0 and 1000
RANDOM_NUMBER=$(($RANDOM % 1001))
echo $RANDOM_NUMBER
GUESS_COUNT=0

PLAY_GAME(){

  echo "$1"
  read GUESSED_NUMBER
  if [[ ! $GUESSED_NUMBER =~ ^[0-9]+$ ]]
  then
  PLAY_GAME "That is not an integer, guess again:"
  fi
  ((GUESS_COUNT++))

  if [[ $GUESSED_NUMBER > $RANDOM_NUMBER ]]
  then
  PLAY_GAME "It's lower than that, guess again:"

  elif [[ $GUESSED_NUMBER  < $RANDOM_NUMBER ]]
  then
  PLAY_GAME "It's higher than that, guess again:"

  elif [[ $GUESSED_NUMBER = $RANDOM_NUMBER ]]
  then
  # number found. add game result to database
  USERNAME_ID=$($PSQL "SELECT username_id from users WHERE username = '$USERNAME'")
  
  INSERT_GAME_RESULT=$($PSQL "INSERT INTO games(username_id, guesses)VALUES($USERNAME_ID, $GUESS_COUNT)")

  # echo win message
  echo "You guessed it in $GUESS_COUNT tries. The secret number was $RANDOM_NUMBER. Nice job!"
  fi

}

echo "Enter your username:"
read USERNAME

# if username already exist
USER_EXIST=$($PSQL "SELECT username from users where username = '$USERNAME'")

# if user not found
if [[ -z $USER_EXIST ]]
then
# add user to the database
USER_INSERT_RESULT=$($PSQL "INSERT INTO users(username)VALUES('$USERNAME')")

# echo welcome message
echo "Welcome, $USERNAME! It looks like this is your first time here."
PLAY_GAME "Guess the secret number between 1 and 1000:"

else
# find username id
USERNAME_ID=$($PSQL "SELECT username_id FROM users WHERE username = '$USERNAME'")

# count games played by the user
GAMES_PLAYED=$($PSQL "SELECT COUNT(*) FROM games WHERE username_id = $USERNAME_ID")

BEST_GAME=$($PSQL "SELECT MIN(guesses) FROM games WHERE username_id = $USERNAME_ID")

echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
PLAY_GAME "Guess the secret number between 1 and 1000:"
fi

