echo ''
echo '-------------------------------------'
echo 'Building HTML ......'
echo '-------------------------------------'

sed -i 's|        ELEMENT=manifest ATTRIBUTE=version VALUE=||g' tmp/chrome_xml_parser_result.txt
sed -i 's|        ELEMENT=url ATTRIBUTE=codebase VALUE=||g' tmp/chrome_xml_parser_result.txt
sed -i 's| ATTRIBUTE=hash |\n|g' tmp/chrome_xml_parser_result.txt
sed -i 's| ATTRIBUTE=name VALUE=|\n|g' tmp/chrome_xml_parser_result.txt
sed -i 's| ATTRIBUTE=required VALUE=true ATTRIBUTE=size VALUE=|\n|g' tmp/chrome_xml_parser_result.txt
sed -i 's| ATTRIBUTE=hash_sha256 VALUE=|\n|g' tmp/chrome_xml_parser_result.txt
sed -i 's|    ELEMENT=time ATTRIBUTE=checktime VALUE=||g' tmp/chrome_xml_parser_result.txt
sed -i 's|https://||g' tmp/chrome_xml_parser_result.txt
sed -i 's| ||g' tmp/chrome_xml_parser_result.txt

checktime=$(sed -n '3p' ./tmp/chrome_xml_parser_result.txt)

cache="http://101.96.10.72/"

stable32_version=$(sed -n '5p' ./tmp/chrome_xml_parser_result.txt)
stable32_dl_base=$(sed -n '6p' ./tmp/chrome_xml_parser_result.txt)
stable32_dl_alt_base=$(sed -n '7p' ./tmp/chrome_xml_parser_result.txt)
stable32_sha256=$(sed -n '10p' ./tmp/chrome_xml_parser_result.txt)
stable32_file=$(sed -n '11p' ./tmp/chrome_xml_parser_result.txt)
stable32_size_raw=$(sed -n '12p' ./tmp/chrome_xml_parser_result.txt)
stable32_dl="https://"${stable32_dl_base}${stable32_file}
stable32_dl_alt="https://"${stable32_dl_alt_base}${stable32_file}
stable32_dl_cache=${cache}${stable32_dl_alt_base}${stable32_file}
stable32_size=$(awk 'BEGIN{printf "%.3f",('$stable32_size_raw'/'1048576')}')

stable64_version=$(sed -n '15p' ./tmp/chrome_xml_parser_result.txt)
stable64_dl_base=$(sed -n '16p' ./tmp/chrome_xml_parser_result.txt)
stable64_dl_alt_base=$(sed -n '17p' ./tmp/chrome_xml_parser_result.txt)
stable64_sha256=$(sed -n '20p' ./tmp/chrome_xml_parser_result.txt)
stable64_file=$(sed -n '21p' ./tmp/chrome_xml_parser_result.txt)
stable64_size_raw=$(sed -n '22p' ./tmp/chrome_xml_parser_result.txt)
stable64_dl="https://"${stable64_dl_base}${stable64_file}
stable64_dl_alt="https://"${stable64_dl_alt_base}${stable64_file}
stable64_dl_cache=${cache}${stable64_dl_alt_base}${stable64_file}
stable64_size=$(awk 'BEGIN{printf "%.3f",('$stable64_size_raw'/'1048576')}')

beta32_version=$(sed -n '25p' ./tmp/chrome_xml_parser_result.txt)
beta32_dl_base=$(sed -n '26p' ./tmp/chrome_xml_parser_result.txt)
beta32_dl_alt_base=$(sed -n '27p' ./tmp/chrome_xml_parser_result.txt)
beta32_sha256=$(sed -n '30p' ./tmp/chrome_xml_parser_result.txt)
beta32_file=$(sed -n '31p' ./tmp/chrome_xml_parser_result.txt)
beta32_size_raw=$(sed -n '32p' ./tmp/chrome_xml_parser_result.txt)
beta32_dl="https://"${beta32_dl_base}${beta32_file}
beta32_dl_alt="https://"${beta32_dl_alt_base}${beta32_file}
beta32_dl_cache=${cache}${beta32_dl_alt_base}${beta32_file}
beta32_size=$(awk 'BEGIN{printf "%.3f",('$beta32_size_raw'/'1048576')}')

beta64_version=$(sed -n '35p' ./tmp/chrome_xml_parser_result.txt)
beta64_dl_base=$(sed -n '36p' ./tmp/chrome_xml_parser_result.txt)
beta64_dl_alt_base=$(sed -n '37p' ./tmp/chrome_xml_parser_result.txt)
beta64_sha256=$(sed -n '40p' ./tmp/chrome_xml_parser_result.txt)
beta64_file=$(sed -n '41p' ./tmp/chrome_xml_parser_result.txt)
beta64_size_raw=$(sed -n '42p' ./tmp/chrome_xml_parser_result.txt)
beta64_dl="https://"${beta64_dl_base}${beta64_file}
beta64_dl_alt="https://"${beta64_dl_alt_base}${beta64_file}
beta64_dl_cache=${cache}${beta64_dl_alt_base}${beta64_file}
beta64_size=$(awk 'BEGIN{printf "%.3f",('$beta64_size_raw'/'1048576')}')

dev32_version=$(sed -n '45p' ./tmp/chrome_xml_parser_result.txt)
dev32_dl_base=$(sed -n '46p' ./tmp/chrome_xml_parser_result.txt)
dev32_dl_alt_base=$(sed -n '47p' ./tmp/chrome_xml_parser_result.txt)
dev32_sha256=$(sed -n '50p' ./tmp/chrome_xml_parser_result.txt)
dev32_file=$(sed -n '21p' ./tmp/chrome_xml_parser_result.txt)
dev32_size_raw=$(sed -n '22p' ./tmp/chrome_xml_parser_result.txt)
dev32_dl="https://"${dev32_dl_base}${dev32_file}
dev32_dl_alt="https://"${dev32_dl_alt_base}${dev32_file}
dev32_dl_cache=${cache}${dev32_dl_alt_base}${dev32_file}
dev32_size=$(awk 'BEGIN{printf "%.3f",('$dev32_size_raw'/'1048576')}')

dev64_version=$(sed -n '55p' ./tmp/chrome_xml_parser_result.txt)
dev64_dl_base=$(sed -n '56p' ./tmp/chrome_xml_parser_result.txt)
dev64_dl_alt_base=$(sed -n '57p' ./tmp/chrome_xml_parser_result.txt)
dev64_sha256=$(sed -n '60p' ./tmp/chrome_xml_parser_result.txt)
dev64_file=$(sed -n '61p' ./tmp/chrome_xml_parser_result.txt)
dev64_size_raw=$(sed -n '62p' ./tmp/chrome_xml_parser_result.txt)
dev64_dl="https://"${dev64_dl_base}${dev64_file}
dev64_dl_alt="https://"${dev64_dl_alt_base}${dev64_file}
dev64_dl_cache=${cache}${dev64_dl_alt_base}${dev64_file}
dev64_size=$(awk 'BEGIN{printf "%.3f",('$dev64_size_raw'/'1048576')}')

canary32_version=$(sed -n '65p' ./tmp/chrome_xml_parser_result.txt)
canary32_dl_base=$(sed -n '66p' ./tmp/chrome_xml_parser_result.txt)
canary32_dl_alt_base=$(sed -n '67p' ./tmp/chrome_xml_parser_result.txt)
canary32_sha256=$(sed -n '70p' ./tmp/chrome_xml_parser_result.txt)
canary32_file=$(sed -n '71p' ./tmp/chrome_xml_parser_result.txt)
canary32_size_raw=$(sed -n '72p' ./tmp/chrome_xml_parser_result.txt)
canary32_dl="https://"${canary32_dl_base}${canary32_file}
canary32_dl_alt="https://"${canary32_dl_alt_base}${canary32_file}
canary32_dl_cache=${cache}${canary32_dl_alt_base}${canary32_file}
canary32_size=$(awk 'BEGIN{printf "%.3f",('$canary32_size_raw'/'1048576')}')

canary64_version=$(sed -n '75p' ./tmp/chrome_xml_parser_result.txt)
canary64_dl_base=$(sed -n '76p' ./tmp/chrome_xml_parser_result.txt)
canary64_dl_alt_base=$(sed -n '77p' ./tmp/chrome_xml_parser_result.txt)
canary64_sha256=$(sed -n '80p' ./tmp/chrome_xml_parser_result.txt)
canary64_file=$(sed -n '81p' ./tmp/chrome_xml_parser_result.txt)
canary64_size_raw=$(sed -n '82p' ./tmp/chrome_xml_parser_result.txt)
canary64_dl="https://"${canary64_dl_base}${canary64_file}
canary64_dl_alt="https://"${canary64_dl_alt_base}${canary64_file}
canary64_dl_cache=${cache}${canary64_dl_alt_base}${canary64_file}
canary64_size=$(awk 'BEGIN{printf "%.3f",('$canary64_size_raw'/'1048576')}')

cp -rf src/index.html tmp/index.html

sed -i "s/{{CheckTime}}/$checktime/g" tmp/index.html

sed -i "s|{{Stable32-Version}}|$stable32_version|g" tmp/index.html
sed -i "s|{{Stable32-SHA256}}|$stable32_sha256|g" tmp/index.html
sed -i "s|{{Stable32-dl-main}}|$stable32_dl|g" tmp/index.html
sed -i "s|{{Stable32-dl-alternative}}|$stable32_dl_alt|g" tmp/index.html
sed -i "s|{{Stable32-dl-cache}}|$stable32_dl_cache|g" tmp/index.html
sed -i "s|{{Stable32-Size}}|$stable32_size|g" tmp/index.html

sed -i "s|{{Stable64-Version}}|$stable64_version|g" tmp/index.html
sed -i "s|{{Stable64-SHA256}}|$stable64_sha256|g" tmp/index.html
sed -i "s|{{Stable64-dl-main}}|$stable64_dl|g" tmp/index.html
sed -i "s|{{Stable64-dl-alternative}}|$stable64_dl_alt|g" tmp/index.html
sed -i "s|{{Stable64-dl-cache}}|$stable64_dl_cache|g" tmp/index.html
sed -i "s|{{Stable64-Size}}|$stable64_size|g" tmp/index.html

sed -i "s|{{Beta32-Version}}|$beta32_version|g" tmp/index.html
sed -i "s|{{Beta32-SHA256}}|$beta32_sha256|g" tmp/index.html
sed -i "s|{{Beta32-dl-main}}|$beta32_dl|g" tmp/index.html
sed -i "s|{{Beta32-dl-alternative}}|$beta32_dl_alt|g" tmp/index.html
sed -i "s|{{Beta32-dl-cache}}|$beta32_dl_cache|g" tmp/index.html
sed -i "s|{{Beta32-Size}}|$beta32_size|g" tmp/index.html

sed -i "s|{{Beta64-Version}}|$beta64_version|g" tmp/index.html
sed -i "s|{{Beta64-SHA256}}|$beta64_sha256|g" tmp/index.html
sed -i "s|{{Beta64-dl-main}}|$beta64_dl|g" tmp/index.html
sed -i "s|{{Beta64-dl-alternative}}|$beta64_dl_alt|g" tmp/index.html
sed -i "s|{{Beta64-dl-cache}}|$beta64_dl_cache|g" tmp/index.html
sed -i "s|{{Beta64-Size}}|$beta64_size|g" tmp/index.html

sed -i "s|{{Dev32-Version}}|$dev32_version|g" tmp/index.html
sed -i "s|{{Dev32-SHA256}}|$dev32_sha256|g" tmp/index.html
sed -i "s|{{Dev32-dl-main}}|$dev32_dl|g" tmp/index.html
sed -i "s|{{Dev32-dl-alternative}}|$dev32_dl_alt|g" tmp/index.html
sed -i "s|{{Dev32-dl-cache}}|$dev32_dl_cache|g" tmp/index.html
sed -i "s|{{Dev32-Size}}|$dev32_size|g" tmp/index.html

sed -i "s|{{Dev64-Version}}|$dev64_version|g" tmp/index.html
sed -i "s|{{Dev64-SHA256}}|$dev64_sha256|g" tmp/index.html
sed -i "s|{{Dev64-dl-main}}|$dev64_dl|g" tmp/index.html
sed -i "s|{{Dev64-dl-alternative}}|$dev64_dl_alt|g" tmp/index.html
sed -i "s|{{Dev64-dl-cache}}|$dev64_dl_cache|g" tmp/index.html
sed -i "s|{{Dev64-Size}}|$dev64_size|g" tmp/index.html

sed -i "s|{{Canary32-Version}}|$canary32_version|g" tmp/index.html
sed -i "s|{{Canary32-SHA256}}|$canary32_sha256|g" tmp/index.html
sed -i "s|{{Canary32-dl-main}}|$canary32_dl|g" tmp/index.html
sed -i "s|{{Canary32-dl-alternative}}|$canary32_dl_alt|g" tmp/index.html
sed -i "s|{{Canary32-dl-cache}}|$canary32_dl_cache|g" tmp/index.html
sed -i "s|{{Canary32-Size}}|$canary32_size|g" tmp/index.html

sed -i "s|{{Canary64-Version}}|$canary64_version|g" tmp/index.html
sed -i "s|{{Canary64-SHA256}}|$canary64_sha256|g" tmp/index.html
sed -i "s|{{Canary64-dl-main}}|$canary64_dl|g" tmp/index.html
sed -i "s|{{Canary64-dl-alternative}}|$canary64_dl_alt|g" tmp/index.html
sed -i "s|{{Canary64-dl-cache}}|$canary64_dl_cache|g" tmp/index.html
sed -i "s|{{Canary64-Size}}|$canary64_size|g" tmp/index.html

cp -rf tmp/index.html public/index.html
