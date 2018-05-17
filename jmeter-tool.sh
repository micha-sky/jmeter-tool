#!/usr/bin/env bash
JMETER=jmeter
TESTS_PATH=$1
OUTPUT_FILE=$2
RED='\033[0;31m'
GREEN='\033[0;32m'
ZERO_ERRORS="0.00%"

NC='\033[0m' # No Color

for file in ${TESTS_PATH}/*.jmx; do
    [ -e "$file" ] || continue
    echo "running ${RED} $(basename ${file})${NC}"
    ${JMETER} -n -t "$file" -l ${OUTPUT_PATH}|  grep -E --color '\d{1,2}\.\d{1,2}|$'
done
