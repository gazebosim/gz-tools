#!/bin/sh

BASEDIR=$(dirname "$0")
rubocop -E -c $BASEDIR/.rubocop.yml $BASEDIR/../src
