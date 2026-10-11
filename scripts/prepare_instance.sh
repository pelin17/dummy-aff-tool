#!/bin/bash

# prepare_instance.sh — run before each instance.
# Arguments:
# - $1: interface version string, e.g. "v1"
# - $2: category, e.g. "AINNCS"
# - $3: benchmark, e.g. "TORA"
# - $4: instance,  e.g. "reach"
# Any further columns the category adds to instances.csv follow, in file order.
#
# A nonzero exit code skips this instance.

set -e

echo "pwd: $(pwd)"
echo "args: $*"

exit 0
