#!/bin/bash
#
# Meant to be run on the Docker container.
#
set -e

echo "Parsing module $1"

cd /my/do-not-commit
git clone --depth 1 https://git.drupalcode.org/project/"$1".git
cd -
ls -lah /my/do-not-commit/"$1"
composer require phpmetrics/phpmetrics
./vendor/bin/phpmetrics --report-html=myreport /my/do-not-commit/"$1" && mv myreport /my/docs/report-"$1"
