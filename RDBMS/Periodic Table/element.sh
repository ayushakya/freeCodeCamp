#! /bin/bash
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

# no argument
if [[ -z $1 ]]
then
  echo Please provide an element as an argument.
  exit
fi

# check argument
# atomic number
if [[ $1 =~ ^[1-9]+$ ]]
then
  ELEMENT=$($PSQL "SELECT atomic_number, symbol, name, type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM elements JOIN properties USING(atomic_number) JOIN types USING(type_id) WHERE atomic_number=$1")
  # echo $ELEMENT
else
  # symbol or name (string)
  ELEMENT=$($PSQL "SELECT atomic_number, symbol, name, type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM elements JOIN properties USING(atomic_number) JOIN types USING(type_id) WHERE name = '$1' OR symbol = '$1'")
  # echo $ELEMENT
fi

# if no record
if [[ -z $ELEMENT ]]
then
  echo I could not find that element in the database.
  exit
fi

# display output
echo $ELEMENT | while IFS=" |" read an symbol name type mass mp bp 
do
  echo -e "The element with atomic number $an is $name ($symbol). It's a $type, with a mass of $mass amu. $name has a melting point of $mp celsius and a boiling point of $bp celsius."
done
