#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=periodic_table -t --no-align --tuples-only -c"

if [[ $1 ]]
then
  if [[ ! $1 =~ ^[0-9]+$ ]]
  then
    CHECK_ELEMENT=$($PSQL "SELECT atomic_number,atomic_mass,melting_point_celsius,boiling_point_celsius,symbol,name,type FROM properties JOIN elements USING(atomic_number) INNER JOIN types USING(type_id) WHERE elements.name LIKE '$1%' ORDER BY atomic_number LIMIT 1")
    else
    CHECK_ELEMENT=$($PSQL "SELECT atomic_number,atomic_mass,melting_point_celsius,boiling_point_celsius,symbol,name,type FROM properties JOIN elements USING(atomic_number) INNER JOIN types USING(type_id) WHERE elements.atomic_number=$1")
    fi
    if [[ -z $CHECK_ELEMENT ]]
    then
      echo I could not find that element in the database.
    else 
      echo $CHECK_ELEMENT | while IFS=\| read ATOMIC_NR ATOMIC_MESS MELTING_P BOILING_P SYMBOL NAME TYPE
      do
      echo "The element with atomic number $ATOMIC_NR is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MESS amu. $NAME has a melting point of $MELTING_P celsius and a boiling point of $BOILING_P celsius."
      done    
  fi
else
  echo Please provide an element as an argument.
fi




