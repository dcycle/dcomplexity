#!/bin/bash
#
# Meant to be run on the Docker container.
#
set -e

CLEAN=$(echo "$1" | sed 's/\//_/g' | sed 's/:/_/g')

cd /my/do-not-commit
git clone --depth 1 "$1" "$CLEAN"
cd -
composer require phpmetrics/phpmetrics
./vendor/bin/phpmetrics --report-html=myreport /my/do-not-commit/"$CLEAN" && mv myreport /my/docs/report-"$CLEAN"
