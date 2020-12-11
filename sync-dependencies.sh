#!/bin/sh
set -e

pipenv run pipenv-setup sync
pipenv run pip freeze > requirements.txt 