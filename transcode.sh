#!/bin/bash

RECIPES=./recipes
DESTINATION=./content/recipes
TEMPLATE=./archetypes/recipe.html

rm -rf $DESTINATION/*

for FOLDER in $(find ./recipes -mindepth 1 -maxdepth 1 -type d); do
  CATEGORY=${FOLDER/$RECIPES\//}
  #echo $category
  for FILE in $(find $FOLDER -mindepth 1 -maxdepth 1 -type f); do
    SLUG=${FILE/$FOLDER\//}
    TITLE=$(head -n 1 $FILE)
    #echo $title
    go run ./transcoder/transcoder.go $FILE $TEMPLATE $CATEGORY $SLUG > $DESTINATION/$SLUG.html
  done
done
