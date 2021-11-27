echo ''
echo '-------------------------------------'
echo 'Parsing data ......'
echo '-------------------------------------'

for i in ${@:2} # 2nd and later arguments
do
    echo 'Parsing '${i}' data ......'

    # xmllint --format $1/checker/${i}.xml > $1/checker/${i}.format.xml
    # ./util/xmlparser.sh $1/checker/${i}.format.xml > $1/parse/${i}.info

    # sed -i 's|        ELEMENT=manifest ATTRIBUTE=version VALUE=||g' $1/parse/${i}.info
    # sed -i 's|        ELEMENT=url ATTRIBUTE=codebase VALUE=||g' $1/parse/${i}.info
    # sed -i 's| ATTRIBUTE=hash |\n|g' $1/parse/${i}.info
    # sed -i 's| ATTRIBUTE=name VALUE=|\n|g' $1/parse/${i}.info
    # sed -i 's| ATTRIBUTE=required VALUE=true ATTRIBUTE=size VALUE=|\n|g' $1/parse/${i}.info
    # sed -i 's| ATTRIBUTE=hash_sha256 VALUE=|\n|g' $1/parse/${i}.info
    # sed -i 's|    ELEMENT=time ATTRIBUTE=checktime VALUE=||g' $1/parse/${i}.info
    # sed -i 's|https://||g' $1/parse/${i}.info
    # sed -i 's| ||g' $1/parse/${i}.info

    # sed -n '14p' $1/parse/${i}.info > $1/parse/${i}-result.info
    # sed -n '8p' $1/parse/${i}.info >> $1/parse/${i}-result.info
    # sed -n '10p' $1/parse/${i}.info >> $1/parse/${i}-result.info
    # sed -n '23p' $1/parse/${i}.info >> $1/parse/${i}-result.info
    # sed -n '22p' $1/parse/${i}.info >> $1/parse/${i}-result.info
    # sed -n '24p' $1/parse/${i}.info >> $1/parse/${i}-result.info
    VERSION=$(xmllint --xpath "string(/response/app/updatecheck/manifest/@version)" $1/checker/${i}.xml) 
    URL1=$(xmllint --xpath "string(/response/app/updatecheck/urls/url[starts-with(@codebase,'https://redirector.gvt1.com')]/@codebase)" $1/checker/${i}.xml)
    URL2=$(xmllint --xpath "string(/response/app/updatecheck/urls/url[starts-with(@codebase,'https://dl.google.com')]/@codebase )" $1/checker/${i}.xml)
    INSTALLER=$(xmllint --xpath "string(/response/app/updatecheck/manifest/actions/action[@event='install']/@run)" $1/checker/${i}.xml)
    SHA256=$(xmllint --xpath "string(/response/app/updatecheck/manifest/packages/package/@hash_sha256)" $1/checker/${i}.xml)
    SIZE=$(xmllint --xpath "string(/response/app/updatecheck/manifest/packages/package/@size)" $1/checker/${i}.xml)
    echo $VERSION  > $1/parse/${i}-result.info
    echo $URL1  >> $1/parse/${i}-result.info
    #xmllint --xpath "string(/response/app/updatecheck/urls/url[starts-with(@codebase,'https://redirector.gvt1.com')]/@codebase)" $1/checker/${i}.xml >> $1/parse/${i}-result.info
    echo $URL2 >> $1/parse/${i}-result.info
    #xmllint --xpath "string(/response/app/updatecheck/urls/url[starts-with(@codebase,'https://www.google.com')]/@codebase)" $1/checker/${i}.xml >> $1/parse/${i}-result.info
    sed -i 's|https://||g' $1/parse/${i}-result.info
    echo $INSTALLER  >> $1/parse/${i}-result.info
    echo $SHA256  >> $1/parse/${i}-result.info
    echo $SIZE  >> $1/parse/${i}-result.info
done
