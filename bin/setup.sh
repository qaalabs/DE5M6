#!/bin/bash

MODULE=$(basename $PWD)

# MkDocs for the MODULE
echo "Create mkdocs.yaml for ${MODULE} ..."
uthisha-export --module "${MODULE}" --format "mkdocs" > mkdocs/yml

# Agenda for the DAY
echo "Create daily agenda for  ${MODULE}:"
echo "- Day 1 ..."
uthisha-export --module "${MODULE}" --format "day-md" --day-code "D1" > docs/tne/day1.md
echo "- Day 2 ..."
uthisha-export --module "${MODULE}" --format "day-md" --day-code "D2" > docs/tne/day2.md
echo "- Day 3 ..."
uthisha-export --module "${MODULE}" --format "day-md" --day-code "D3" > docs/tne/day3.md
echo "- Day 4 ..."
uthisha-export --module "${MODULE}" --format "day-md" --day-code "D4" > docs/tne/day4.md
echo "- Day 5 ..."
uthisha-export --module "${MODULE}" --format "day-md" --day-code "D5" > docs/tne/day5.md
