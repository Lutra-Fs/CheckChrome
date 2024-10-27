mkdir ./public/api -p
mkdir ./tmp/checker -p
mkdir ./tmp/parse -p
mkdir ./tmp/api/

chmod +x ./util/checker.sh
chmod +x ./util/parse.sh
chmod +x ./util/generator.sh

./util/checker.sh

./util/parse.sh stable-x86 stable-x64 beta-x86 beta-x64 dev-x86 dev-x64 canary-x86 canary-x64

cp -rf src/index.html tmp/index.html
cp -rf src/chrome.xml tmp/chrome.xml

DATE="$(echo $(TZ=UTC-8 date '+%Y-%m-%d %H:%M:%S'))"
sed -i "s|{{CheckTime}}|$DATE|g" tmp/index.html
sed -i "s|{{CheckTime}}|$DATE|g" tmp/chrome.xml

./util/generator.sh stable-x86 stable-x64 beta-x86 beta-x64 dev-x86 dev-x64 canary-x86 canary-x64

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
cp "tmp/chrome.xml" "tmp/api/chrome.xml"

# Minify XML
minify_xml "tmp/chrome.xml" "tmp/api/chrome.min.xml"

cp -rf tmp/index.html public/index.html
cp -rf tmp/api/chrome.xml public/api/chrome.xml
cp -rf tmp/api/chrome.min.xml public/api/chrome.min.xml

