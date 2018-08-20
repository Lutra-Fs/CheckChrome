echo ''
echo '-------------------------------------'
echo 'Parsing data ......'
echo '-------------------------------------'

for i in $@
do
    echo 'Parsing '${i}' data ......'

    xmllint --format ./tmp/checker/${i}.xml > ./tmp/checker/${i}.format.xml
    ./util/xmlparser.sh ./tmp/checker/${i}.format.xml > ./tmp/parse/${i}.info

    sed -i 's|        ELEMENT=manifest ATTRIBUTE=version VALUE=||g' ./tmp/parse/${i}.info
    sed -i 's|        ELEMENT=url ATTRIBUTE=codebase VALUE=||g' ./tmp/parse/${i}.info
    sed -i 's| ATTRIBUTE=hash |\n|g' ./tmp/parse/${i}.info
    sed -i 's| ATTRIBUTE=name VALUE=|\n|g' ./tmp/parse/${i}.info
    sed -i 's| ATTRIBUTE=required VALUE=true ATTRIBUTE=size VALUE=|\n|g' ./tmp/parse/${i}.info
    sed -i 's| ATTRIBUTE=hash_sha256 VALUE=|\n|g' ./tmp/parse/${i}.info
    sed -i 's|    ELEMENT=time ATTRIBUTE=checktime VALUE=||g' ./tmp/parse/${i}.info
    sed -i 's|https://||g' ./tmp/parse/${i}.info
    sed -i 's| ||g' ./tmp/parse/${i}.info

    sed -n '14p' ./tmp/parse/${i}.info > ./tmp/parse/${i}-result.info
    sed -n '8p' ./tmp/parse/${i}.info >> ./tmp/parse/${i}-result.info
    sed -n '10p' ./tmp/parse/${i}.info >> ./tmp/parse/${i}-result.info
    sed -n '23p' ./tmp/parse/${i}.info >> ./tmp/parse/${i}-result.info
    sed -n '22p' ./tmp/parse/${i}.info >> ./tmp/parse/${i}-result.info
    sed -n '24p' ./tmp/parse/${i}.info >> ./tmp/parse/${i}-result.info
done
