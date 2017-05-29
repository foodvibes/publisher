#!/bin/bash

RECIPES=./recipes
DESTINATION=./content/recipes
TEMPLATE=./layouts/recipes/template.html

rm -rf $DESTINATION/*

for folder in $(find ./recipes -mindepth 1 -maxdepth 1 -type d); do
  category=${folder/$RECIPES\//}
  #echo $category
  for file in $(find $folder -mindepth 1 -maxdepth 1 -type f); do
    slug=${file/$folder\//}
    title=$(head -n 1 $file)
    #echo $title
    go run ./transcoder/transcoder.go $file $TEMPLATE $category $slug > $DESTINATION/$slug.html
  done
done
