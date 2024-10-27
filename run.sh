mkdir ./public/api -p
mkdir ./tmp/checker -p
mkdir ./tmp/parse -p
mkdir ./tmp/api/

chmod +x ./util/checker.sh
chmod +x ./util/xmlparser.sh
chmod +x ./util/parse.sh
chmod +x ./util/generator.sh
chmod +x ./util/deployer.sh

./util/checker.sh

./util/parse.sh stable-x86 stable-x64 beta-x86 beta-x64 dev-x86 dev-x64 canary-x86 canary-x64

cp -rf src/index.html tmp/index.html
cp -rf src/chrome.xml tmp/chrome.xml

DATE="$(echo $(TZ=UTC-8 date '+%Y-%m-%d %H:%M:%S'))"
sed -i "s|{{CheckTime}}|$DATE|g" tmp/index.html
sed -i "s|{{CheckTime}}|$DATE|g" tmp/chrome.xml

./util/generator.sh stable-x86 stable-x64 beta-x86 beta-x64 dev-x86 dev-x64 canary-x86 canary-x64

# Function to format XML
format_xml() {
    local input=$1
    local output=$2
    
    # Read input file and process it
    sed '
        # Add newline after elements that end with >
        s/>/>\n/g
        # Remove empty lines
        /^[[:space:]]*$/d
    ' "$input" | awk '
        # Initialize indent level
        BEGIN { indent = 0 }
        
        # Processing each line
        {
            # Remove leading/trailing whitespace
            gsub(/^[ \t]+|[ \t]+$/, "")
            
            # Decrease indent for closing tags
            if (match($0, "^</")) {
                indent -= 2
            }
            
            # Print the indented line
            printf "%*s%s\n", indent, "", $0
            
            # Increase indent for opening tags that are not self-closing
            if (match($0, "^<[^/]") && !match($0, "/>$")) {
                indent += 2
            }
        }
    ' > "$output"
}

# Function to minify XML
minify_xml() {
    local input=$1
    local output=$2
    
    # Remove newlines, leading/trailing whitespace, and consolidate spaces
    tr -d '\n' < "$input" | \
    sed -E '
        # Remove spaces between tags
        s/>[[:space:]]+</></g
        # Remove leading/trailing whitespace
        s/^[[:space:]]+//
        s/[[:space:]]+$//
        # Consolidate multiple spaces into one
        s/[[:space:]]+/ /g
    ' > "$output"
}

# Format XML
format_xml "tmp/chrome.xml" "tmp/api/chrome.xml"

# Minify XML
minify_xml "tmp/chrome.xml" "tmp/api/chrome.min.xml"

cp -rf tmp/index.html public/index.html
cp -rf tmp/api/chrome.xml public/api/chrome.xml
cp -rf tmp/api/chrome.min.xml public/api/chrome.min.xml

