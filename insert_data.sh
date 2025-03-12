#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

# Insert teams

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  if [[ $WINNER != winner ]]
    then
      # get team_id winner
      TEAM_ID_W=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
  
    # if not found
    if [[ -z $TEAM_ID_W ]]
      then
        # insert team
        INSERT_TEAM=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
        # get new team_id
        TEAM_ID_W=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    fi

    # get team_id_opponent
    TEAM_ID_O=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")

      # if not found
    if [[ -z $TEAM_ID_O ]]
      then
        # insert team
        INSERT_TEAM=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
        # get new team_id
        TEAM_ID_O=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
    fi

  fi
  #Games
    if [[ $WINNER != winner ]]
    then
      # get game_id winner
      GAME_ID=$($PSQL "SELECT game_id FROM games WHERE year=$YEAR AND round='$ROUND' AND winner_id=$TEAM_ID_W AND opponent_id=$TEAM_ID_O AND winner_goals=$WINNER_GOALS AND opponent_goals=$OPPONENT_GOALS")
  
    # if not found
    if [[ -z $GAME_ID ]]
      then
        # insert game
        INSERT_GAME=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($YEAR, '$ROUND', $TEAM_ID_W, $TEAM_ID_O, $WINNER_GOALS, $OPPONENT_GOALS)")
        # get new team_id
        GAME_ID=$($PSQL "SELECT game_id FROM games WHERE year=$YEAR AND round='$ROUND' AND winner_id=$TEAM_ID_W AND opponent_id=$TEAM_ID_O AND winner_goals=$WINNER_GOALS AND opponent_goals=$OPPONENT_GOALS") 
    fi
  fi
done
