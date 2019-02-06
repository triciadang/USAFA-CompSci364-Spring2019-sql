#!/bin/bash

set -u  # raise error for uninitialized variables


if which colordiff > /dev/null; then
  # redefine `diff` as `colordiff` (if available)
  diff() {
    command colordiff "$@"
  }
fi


errors=0
trap '(( $? && ++errors ))' ERR


for i in $(seq --equal-width 1 25); do
  database='Ch07_LargeCo'
  if [ $i -le 5 ]; then
    database='Ch07_ConstructCo'
  fi

  # setup (e.g., inserting data into tables)
  if [ -f "test/$i-pre.sql" ]; then
    psql --dbname="$database" --file="test/$i-pre.sql" --quiet
  fi

  psql --dbname="$database" --file="src/$i.sql" --output="/tmp/$i.out"

  # tear down (e.g., queries used to test non-SELECT statements)
  if [ -f "test/$i-post.sql" ]; then
    psql --dbname="$database" --file="test/$i-post.sql" --output="/tmp/$i.out"
  fi

  echo "Comparing output for $i..."
  diff --unified "test/$i.out" "/tmp/$i.out"
done

echo
echo "$errors errors encountered."
[ $errors = 0 ]  # exit with non-zero status if there were any errors
