mkdir ./public -p
mkdir ./tmp/checker -p
mkdir ./tmp/parse -p

chmod +x ./util/checker.sh
chmod +x ./util/xmlparser.sh
chmod +x ./util/parse.sh

./util/parse.sh stable-x86 stable-x64 beta-x86 beta-x64 dev-x86 dev-x64 canary-x86 canary-x64