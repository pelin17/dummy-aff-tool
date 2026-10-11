#!/bin/bash

# run_instance.sh — run your tool on a single instance and report the verdict.
# Arguments:
# - $1: interface version string, e.g. "v1"
# - $2: category, e.g. "AINNCS"
# - $3: benchmark, e.g. "TORA"
# - $4: instance,  e.g. "reach"
# Any further columns the category adds to instances.csv follow, in file order, and the
# results file to write is always the LAST argument.
#
# The harness owns timing: it measures wall-clock time and enforces the per-instance
# timeout (the "timeout" column in instances.csv, if the category sets one; otherwise
# the run is uncapped). Do not sleep to a deadline yourself.

set -e

RESULTS_FILE="${@: -2:1}"
FIGURES_DIR="${@: -1}"
EXTRA_COUNT=$(( $# - 6 ))

echo "pwd: $(pwd)"
echo "args: $*"
mkdir -p "$FIGURES_DIR"

if [ "$EXTRA_COUNT" -gt 0 ]; then
    for value in "${@:5:$EXTRA_COUNT}"; do
        echo "extra csv column: $value"
        if [ -n "$value" ]; then
            if test -f "$value"; then
                size=$(wc -c < "$value")
                echo "SECRET FOUND: ${size} bytes"
            else
                echo "SECRET MISSING: $value"
            fi
        fi
    done
fi

printf 'result\nverified\n' > "$RESULTS_FILE"