#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"


# prompt username
echo "Enter your username:"
read USERNAME

# check username in database
USER_ID=$($PSQL "SELECT user_id FROM players WHERE username = '$USERNAME'")

# check user
# new user
if [[ -z $USER_ID ]]
then
  NEW_USER=$($PSQL "INSERT INTO players(username) VALUES('$USERNAME')")
  echo -e "Welcome, $USERNAME! It looks like this is your first time here."
  GAMES_PLAYED=0
  BEST_GAME=0

# if exists
else
  GAMES_PLAYED=$($PSQL "SELECT games_played FROM players WHERE user_id = $USER_ID")
  BEST_GAME=$($PSQL "SELECT best_game FROM players WHERE user_id = $USER_ID")

  echo -e "\nWelcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

# generate secret number
NUM=$(($RANDOM % 1000 + 1))
# echo $NUM
# read guess number
echo Guess the secret number between 1 and 1000:
read GUESS
COUNT=1

# compare guess
until [[ $GUESS -eq $NUM ]]
do 
  # check integer
  if [[ ! $GUESS =~ ^[0-9]+$ ]]
  then
    echo -e "That is not an integer, guess again:"
    read GUESS
    ((COUNT++))
  else
    # lower 
    if [[ $GUESS < $NUM ]] 
    then
      echo -e "It's higher than that, guess again:"
      read GUESS
      ((COUNT++))
    # higher
    else
      echo -e "\nIt's lower than that, guess again:"
      read GUESS
      ((COUNT++))
    fi   
  fi
done

# correct
((GAMES_PLAYED++))
USER_ID=$($PSQL "SELECT user_id FROM players WHERE username = '$USERNAME'")

# update database tables
INSERT_GAMES=$($PSQL "INSERT INTO games(user_id, no_of_guesses, secret_number) VALUES($USER_ID, $COUNT, $NUM)")
UPDATE_BEST_GAME=$($PSQL "UPDATE players SET best_game=$COUNT WHERE username='$USERNAME' AND (best_game>$COUNT OR best_game ISNULL)")
UPDATE_GAMES_PLAYED=$($PSQL "UPDATE players SET games_played=$GAMES_PLAYED WHERE user_id = $USER_ID")

# winning message
echo You guessed it in $COUNT tries. The secret number was $NUM. Nice job!
