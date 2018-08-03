sed -i 's|        ELEMENT=manifest ATTRIBUTE=version VALUE=||g' tmp/chrome_xml_parser_result.txt
sed -i 's|        ELEMENT=url ATTRIBUTE=codebase VALUE=||g' tmp/chrome_xml_parser_result.txt
sed -i 's| ATTRIBUTE=hash |\n|g' tmp/chrome_xml_parser_result.txt
sed -i 's| ATTRIBUTE=name VALUE=|\n|g' tmp/chrome_xml_parser_result.txt
sed -i 's| ATTRIBUTE=required VALUE=true ATTRIBUTE=size VALUE=|\n|g' tmp/chrome_xml_parser_result.txt
sed -i 's| ATTRIBUTE=hash_sha256 VALUE=|\n|g' tmp/chrome_xml_parser_result.txt
sed -i 's|    ELEMENT=time ATTRIBUTE=checktime VALUE=||g' tmp/chrome_xml_parser_result.txt
sed -i 's| ||g' tmp/chrome_xml_parser_result.txt

checktime=$(sed -n '3p' ./tmp/chrome_xml_parser_result.txt)
