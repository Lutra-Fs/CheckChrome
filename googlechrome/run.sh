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
