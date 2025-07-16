#!/bin/bash

MODULE=$(basename "$PWD")

uthisha-export --module "${MODULE}" --format "mkdocs"

#EOF
