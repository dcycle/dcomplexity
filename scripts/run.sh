#!/bin/bash
set -e

echo "Preflight: docker must be installed"
docker -v >/dev/null 2>/dev/null || { echo "Please install docker: https://docs.docker.com/get-docker/"; exit 1; }
echo "OK"
echo "Preflight: docker must be running"
docker info >/dev/null 2>/dev/null || { echo "Please launch docker"; exit 1; }
echo "OK"

rm -rf do-not-commit
mkdir do-not-commit
rm -rf report-*

while read -r line; do
  MODULE_NAME_ONLY="${line#* }"
  ./scripts/parse_module.sh "$MODULE_NAME_ONLY"
done < _data/drupalprojects.yml
