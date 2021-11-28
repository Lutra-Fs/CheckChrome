mkdir ./googlechrome/public -p
mkdir ./googlechrome/tmp/checker -p
mkdir ./googlechrome/tmp/parse -p

chmod +x ./googlechrome/util/checker.sh
chmod +x ./googlechrome/util/parse.sh
chmod +x ./googlechrome/util/generator.sh

./googlechrome/util/checker.sh "./googlechrome/tmp"

./googlechrome/util/parse.sh "./googlechrome/tmp" stable-x86 stable-x64 beta-x86 beta-x64 dev-x86 dev-x64 canary-x86 canary-x64

cp -rf ./googlechrome/src/chrome.xml ./googlechrome/tmp/chrome.xml

DATE="$(echo $(TZ=UTC date '+%Y-%m-%d %H:%M:%S'))"
sed -i "s|{{CheckTime}}|$DATE|g" googlechrome/tmp/chrome.xml

./googlechrome/util/generator.sh "./googlechrome/tmp" stable-x86 stable-x64 beta-x86 beta-x64 dev-x86 dev-x64 canary-x86 canary-x64

xmllint --format googlechrome/tmp/chrome.xml > googlechrome/tmp/chrome_linted.xml
xmllint --noblanks googlechrome/tmp/chrome_linted.xml > googlechrome/tmp/chrome.min.xml

mkdir ./pages/googlechrome -p
cp -rf googlechrome/tmp/chrome_linted.xml ./pages/googlechrome/chrome.xml
cp -rf googlechrome/tmp/chrome.min.xml ./pages/googlechrome/chrome.min.xml
