#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=number_guessing -t --no-align -c"

echo "Enter your username:"
read USERNAME

CHECK_USER=$($PSQL "SELECT username FROM game_user WHERE username='$USERNAME'")
GAMES_PLAYED=$($PSQL "SELECT COUNT(*) FROM game_user INNER JOIN games_played USING(user_id) WHERE username='$USERNAME'")
BEST_GAME=$($PSQL "SELECT MIN(guesses) FROM game_user INNER JOIN games_played USING(user_id) WHERE username='$USERNAME'")

if [[ -z $CHECK_USER ]]
then 
    INSERT_NAME=$($PSQL "INSERT INTO game_user(username) VALUES('$USERNAME')")
    echo "Welcome, $USERNAME! It looks like this is your first time here."
else
    echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi


NUMBER_TO_GUESS=$(( $RANDOM % 10 + 1 ))
echo "Guess the secret number between 1 and 1000:"
GUESS_COUNT=1


while read GUESS
do
    if [[ ! $GUESS =~ ^[0-9]+$ ]]
    then
        echo "That is not an integer, guess again:"
    else
        if [[ $GUESS -eq $NUMBER_TO_GUESS ]]
        then 
            break;
        else
            if [[ $GUESS -gt $NUMBER_TO_GUESS ]]
            then
                echo -n "It's lower than that, guess again:"
            elif [[ $GUESS -lt $NUMBER_TO_GUESS ]]
            then
                echo -n "It's higher than that, guess again:"
            fi
        fi
    fi
    GUESS_COUNT=$((GUESS_COUNT + 1))
    done
    
echo "You guessed it in $GUESS_COUNT tries. The secret number was $NUMBER_TO_GUESS. Nice job!"

USER_ID=$($PSQL "SELECT user_id FROM game_user WHERE username='$USERNAME'")
INSERT_GAME=$($PSQL "INSERT INTO games_played(guesses,user_id) VALUES ($GUESS_COUNT,$USER_ID)")