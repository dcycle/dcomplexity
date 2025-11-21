#!/bin/bash
set -e

docker run -v "$(pwd)":/my --rm composer /bin/bash -c "/my/scripts/docker/parse_module_on_container.sh $1"
