#!/bin/bash

MODULE=$(basename $PWD)

# Create slides
for i in {1..4}; do
  uthisha-slides --day ${MODULE}D${i} --output /var/www/html/uthisha/${MODULE,,}d${i}.html 
  echo ""
done

#EOF
