echo ''
echo '-------------------------------------'
echo 'Start Generator ......'
echo '-------------------------------------'

for i in ${@:2} # 2nd and later arguments
do
    version=$(sed -n '1p' $1/parse/${i}-result.info)
    dl_base=$(sed -n '2p' $1/parse/${i}-result.info)
    dl_alt_base=$(sed -n '3p' $1/parse/${i}-result.info)
    dl_file=$(sed -n '4p' $1/parse/${i}-result.info)
    dl="https://"${dl_base}${dl_file}
    dl_alt="https://"${dl_alt_base}${dl_file}
    dl_cache=${cache}${dl_alt_base}${dl_file}
    sha256=$(sed -n '5p' $1/parse/${i}-result.info)
    size_raw=$(sed -n '6p' $1/parse/${i}-result.info)
    size=$(awk 'BEGIN{printf "%.3f",('$size_raw'/'1048576')}')" MB"

    sed -i "s|{{${i}-Version}}|$version|g" $1/chrome.xml
    sed -i "s|{{${i}-SHA256}}|$sha256|g" $1/chrome.xml
    sed -i "s|{{${i}-dl-main}}|$dl|g" $1/chrome.xml
    sed -i "s|{{${i}-dl-alternative}}|$dl_alt|g" $1/chrome.xml
    sed -i "s|{{${i}-dl-cache}}|$dl_cache|g" $1/chrome.xml
    sed -i "s|{{${i}-Size}}|$size_raw|g" $1/chrome.xml
done
