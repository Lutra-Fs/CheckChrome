echo ''
echo '-------------------------------------'
echo 'Formatting XML Files ......'
echo '-------------------------------------'
echo ''

cd ./tmp
xmllint --format stable-arm.unformat.xml > stable-arm.format.xml
xmllint --format beta-arm.unformat.xml > beta-arm.format.xml
xmllint --format dev-arm.unformat.xml > dev-arm.format.xml
xmllint --format canary-arm.unformat.xml > canary-arm.format.xml

echo ''
echo '-------------------------------------'
echo 'Combining XML Files ......'
echo '-------------------------------------'
echo ''

echo '<?xml version="1.0" encoding="UTF-8"?>' > chrome.tmp.xml

echo '<chromechecker>' >> chrome.tmp.xml

DATE="$(echo $(date --rfc-2822))"
echo '<time checktime="'$DATE'"/>' >> chrome.tmp.xml

echo '<stablearm>' >> chrome.tmp.xml
cat stable-arm.format.xml | grep '<manifest version' >> chrome.tmp.xml
cat stable-arm.format.xml | grep '<url codebase="https://dl.google.com/' >> chrome.tmp.xml
cat stable-arm.format.xml | grep '<package fp' >> chrome.tmp.xml
echo '</stablearm>' >> chrome.tmp.xml

echo '<betaarm>' >> chrome.tmp.xml
cat beta-arm.format.xml | grep '<manifest version' >> chrome.tmp.xml
cat beta-arm.format.xml | grep '<url codebase="https://dl.google.com/' >> chrome.tmp.xml
cat beta-arm.format.xml | grep '<package fp' >> chrome.tmp.xml
echo '</betaarm>' >> chrome.tmp.xml

echo '<devarm>' >> chrome.tmp.xml
cat dev-arm.format.xml | grep '<manifest version' >> chrome.tmp.xml
cat dev-arm.format.xml | grep '<url codebase="https://dl.google.com/' >> chrome.tmp.xml
cat dev-arm.format.xml | grep '<package fp' >> chrome.tmp.xml
echo '</devarm>' >> chrome.tmp.xml

echo '<canaryarm>' >> chrome.tmp.xml
cat canary-arm.format.xml | grep '<manifest version' >> chrome.tmp.xml
cat canary-arm.format.xml | grep '<url codebase="https://dl.google.com/' >> chrome.tmp.xml
cat canary-arm.format.xml | grep '<package fp' >> chrome.tmp.xml
echo '</canaryarm>' >> chrome.tmp.xml

echo '</chromechecker>' >> chrome.tmp.xml

echo ''
echo '-------------------------------------'
echo 'Formatting Output ......'
echo '-------------------------------------'
echo ''

sed -i 's|">|"/>|g' chrome.tmp.xml
xmllint --format chrome.tmp.xml > chrome.xml

echo ''
echo '-------------------------------------'
echo 'Compressing Output ......'
echo '-------------------------------------'
echo ''

xmllint --noblanks chrome.xml > chrome.min.xml

cp -rf ./chrome.xml ../public/chrome.xml
cp -rf ./chrome.min.xml ../public/chrome.min.xml

cd ..
