#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
# Empty tables
echo "$($PSQL "TRUNCATE TABLE games, teams RESTART IDENTITY;")"

## Tasks
# read csv
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
if [[ $YEAR != 'year' ]]
then
  # teams table
  GET_WINNER="$($PSQL "SELECT * FROM teams WHERE name='$WINNER'")" 

  # check unique
  if [[ -z $GET_WINNER ]]
  then
    # Insert winner team
    INSERT_WINNER="$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")"

    # feedback message
    if [[ $INSERT_WINNER == "INSERT 0 1" ]]
    then 
      echo Inserted $WINNER succesfully!
    else
      echo Failed to insert $WINNER
    fi
  else
    echo $WINNER already exists
  fi 

  # Opponent team
  GET_OPPONENT="$($PSQL "SELECT * FROM teams WHERE name='$OPPONENT'")"

  # Check for team
  if [[ -z $GET_OPPONENT ]]
    then
    # insert opponent team within the db
      INSERT_OPPONENT="$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")"
      # if insertion is sucessful, print a success message
      if [[ $INSERT_OPPONENT == "INSERT 0 1" ]]
      then
        echo Inserted $OPPONENT successfully!
      else
        echo Failed to insert $OPPONENT!
      fi
    else
      echo $OPPONENT already exists
    fi

    # games table
    # get team ids
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
    
    # insert the data
    INSERT_GAME="$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS)")"
    # checking data insertion
    if [[ $INSERT_GAME == "INSERT 0 1" ]]
    then
      echo Game data inserted Successfully!
    else
      echo Failed to insert game data!
    fi
  fi
done
