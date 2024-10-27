#!/bin/bash

echo ''
echo '-------------------------------------'
echo 'Parsing data ......'
echo '-------------------------------------'

extract_value() {
    local file=$1
    local start_pattern=$2
    local end_pattern=$3
    local attribute=$4
    
    # Create a temporary file with relevant section only
    sed -n "/${start_pattern}/,/${end_pattern}/p" "$file" > tmp.xml
    
    # Extract the attribute value
    sed -n "/${attribute}=\"[^\"]*\"/ {
        s/.*${attribute}=\"//
        s/\".*//
        p
    }" tmp.xml | head -1
    
    rm -f tmp.xml
}

for i in "$@"
do
    echo "Parsing ${i} data ......"
    XML_FILE="./tmp/checker/${i}.xml"
    RESULT_FILE="./tmp/parse/${i}-result.info"
    
    # # Extract version - look between <manifest and </manifest>
    # VERSION=$(extract_value "$XML_FILE" "<manifest" "</manifest>" "version")
    
    # # Extract URLs - look between <urls and </urls>
    # URL1=$(sed -n '/<urls/,/<\/urls>/p' "$XML_FILE" | \
    #        sed -n '/edgedl\.me\.gvt1\.com/ {
    #            s/.*codebase="https:\/\/edgedl\.me\.gvt1\.com\///
    #            s/".*//
    #            p
    #        }' | head -1)
    
    # URL2=$(sed -n '/<urls/,/<\/urls>/p' "$XML_FILE" | \
    #        sed -n '/dl\.google\.com/ {
    #            s/.*codebase="https:\/\/dl\.google\.com\///
    #            s/".*//
    #            p
    #        }' | head -1)
    
    # # Extract installer - look between <actions and </actions>
    # INSTALLER=$(extract_value "$XML_FILE" "<actions" "</actions>" "run")
    
    # # Extract SHA256 - look between <packages and </packages>
    # SHA256=$(extract_value "$XML_FILE" "<packages" "</packages>" "hash_sha256")
    
    # # Extract size - look between <packages and </packages>
    # SIZE=$(extract_value "$XML_FILE" "<packages" "</packages>" "size")
    
    # Extract version - simpler pattern
    VERSION=$(sed -n 's/.*manifest version="\([^"]*\)".*/\1/p' "$XML_FILE")
    
    # Extract URLs - simpler patterns
    URL1=$(sed -n 's/.*codebase="https:\/\/edgedl\.me\.gvt1\.com\/\([^"]*\)".*/\1/p' "$XML_FILE" | head -1)
    URL2=$(sed -n 's/.*codebase="https:\/\/dl\.google\.com\/\([^"]*\)".*/\1/p' "$XML_FILE" | head -1)
    
    # Extract installer name - simpler pattern
    INSTALLER=$(sed -n 's/.*run="\([^"]*\)".*/\1/p' "$XML_FILE" | head -1)
    
    # Extract SHA256 - simpler pattern
    SHA256=$(sed -n 's/.*hash_sha256="\([^"]*\)".*/\1/p' "$XML_FILE")
    
    # Extract size - simpler pattern
    SIZE=$(sed -n 's/.*size="\([^"]*\)".*/\1/p' "$XML_FILE" | head -1)

    # Write results to file
    {
        echo "$VERSION"
        echo "$URL1"
        echo "$URL2"
        echo "$INSTALLER"
        echo "$SHA256"
        echo "$SIZE"
    } > "$RESULT_FILE"
done
