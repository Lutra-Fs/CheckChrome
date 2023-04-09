# CheckChrome - Yet another chrome offline package download page generator
# Copyright (C) 2023  Lutra-Fs<github.com/Lutra-Fs> Sukka<github.com/sukkaw> and other contributors
# 
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

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
