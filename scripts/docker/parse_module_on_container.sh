#!/bin/bash
#
# Meant to be run on the Docker container.
#
set -e

CLEAN=$(echo "$1" | sed 's/\//_/g' | sed 's/:/_/g' | sed 's/\./_/g')

cd /my/do-not-commit
git clone --depth 1 "$1" "$CLEAN"
cd -
composer require phpmetrics/phpmetrics
./vendor/bin/phpmetrics --report-html=myreport --report-json=myreportjson /my/do-not-commit/"$CLEAN" && mv myreport /my/docs/report-"$CLEAN" && mv myreportjson /my/docs/_data/json-"$CLEAN".json
