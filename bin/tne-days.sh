#!/bin/bash

MODULE=$(basename "$PWD")

if [ $# -eq 0 ]; then
  echo "Usage: $0 <day>"
  exit 1
fi

DAY=$1

uthisha-export --module "${MODULE}" --day-code "${DAY}" --format "day-md"

#EOF
