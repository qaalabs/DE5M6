#!/bin/bash

MODULE=$(basename $PWD)

# MkDocs for the MODULE
echo "Create mkdocs.yaml for ${MODULE} ..."
uthisha-export --module "${MODULE}" --format "mkdocs" > mkdocs.yml

# Agenda for the DAY
echo -e "\nCreate daily agenda for  ${MODULE}:\n"
for i in {1..4}; do
  echo "uthisha-export --module ${MODULE} --format day-md --day-code D${i}"
        uthisha-export --module ${MODULE} --format day-md --day-code D${i} > "docs/tne/day${i}.md"
done
