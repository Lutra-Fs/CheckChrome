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

echo '-------------------------------------'
echo 'Start Checking Chrome ......'
echo '-------------------------------------'

# Google Updater (Omaha) API
# App IDs:
# Stable: 8A69D345-D564-463C-AFF1-A69D9E530F96
# Beta: 8A69D345-D564-463C-AFF1-A69D9E530F96
# Dev: 8A69D345-D564-463C-AFF1-A69D9E530F96
# Canary: 4EA16AC7-FD5A-47C3-875B-DBF4A2008C20

echo 'Checking Chrome Stable x86 ......'

curl -s "https://tools.google.com/service/update2" --data "<?xml version='1.0' encoding='UTF-8'?>
            <request protocol='3.0' version='1.3.23.9' shell_version='1.3.21.103' ismachine='0'
                     sessionid='{3597644B-2952-4F92-AE55-D315F45F80A5}' installsource='ondemandcheckforupdate'
                     requestid='{CD7523AD-A40D-49F4-AEEF-8C114B804658}' dedup='cr'>
            <hw sse='1' sse2='1' sse3='1' ssse3='1' sse41='1' sse42='1' avx='1' physmemory='12582912' />
            <os platform='win' version='6.3' arch='x86'/>
            <app appid='{8A69D345-D564-463C-AFF1-A69D9E530F96}' ap='-multi-chrome' version='' nextversion='' lang='' brand='GGLS' client=''>
                <updatecheck/>
            </app>
            </request>" > $1/checker/stable-x86.xml

sleep 1

echo 'Checking Chrome Stable x64 ......'

curl -s "https://tools.google.com/service/update2" --data "<?xml version='1.0' encoding='UTF-8'?>
            <request protocol='3.0' version='1.3.23.9' shell_version='1.3.21.103' ismachine='0'
                     sessionid='{3597644B-2952-4F92-AE55-D315F45F80A5}' installsource='ondemandcheckforupdate'
                     requestid='{CD7523AD-A40D-49F4-AEEF-8C114B804658}' dedup='cr'>
            <hw sse='1' sse2='1' sse3='1' ssse3='1' sse41='1' sse42='1' avx='1' physmemory='12582912' />
            <os platform='win' version='6.3' arch='x64'/>
            <app appid='{8A69D345-D564-463C-AFF1-A69D9E530F96}' ap='x64-stable-multi-chrome' version='' nextversion='' lang='' brand='GGLS' client=''>
                <updatecheck/>
            </app>
            </request>" > $1/checker/stable-x64.xml

sleep 1

echo 'Checking Chrome Beta x86 ......'

curl -s "https://tools.google.com/service/update2" --data "<?xml version='1.0' encoding='UTF-8'?>
            <request protocol='3.0' version='1.3.23.9' shell_version='1.3.21.103' ismachine='0'
                     sessionid='{3597644B-2952-4F92-AE55-D315F45F80A5}' installsource='ondemandcheckforupdate'
                     requestid='{CD7523AD-A40D-49F4-AEEF-8C114B804658}' dedup='cr'>
            <hw sse='1' sse2='1' sse3='1' ssse3='1' sse41='1' sse42='1' avx='1' physmemory='12582912' />
            <os platform='win' version='6.3' arch='x86'/>
            <app appid='{8A69D345-D564-463C-AFF1-A69D9E530F96}' ap='1.1-beta' version='' nextversion='' lang='' brand='GGLS' client=''>
                <updatecheck/>
            </app>
            </request>" > $1/checker/beta-x86.xml

sleep 1

echo 'Checking Chrome Beta x64 ......'

curl -s "https://tools.google.com/service/update2" --data "<?xml version='1.0' encoding='UTF-8'?>
            <request protocol='3.0' version='1.3.23.9' shell_version='1.3.21.103' ismachine='0'
                     sessionid='{3597644B-2952-4F92-AE55-D315F45F80A5}' installsource='ondemandcheckforupdate'
                     requestid='{CD7523AD-A40D-49F4-AEEF-8C114B804658}' dedup='cr'>
            <hw sse='1' sse2='1' sse3='1' ssse3='1' sse41='1' sse42='1' avx='1' physmemory='12582912' />
            <os platform='win' version='6.3' arch='x64'/>
            <app appid='{8A69D345-D564-463C-AFF1-A69D9E530F96}' ap='x64-beta-multi-chrome' version='' nextversion='' lang='' brand='GGLS' client=''>
                <updatecheck/>
            </app>
            </request>" > $1/checker/beta-x64.xml

sleep 1

echo 'Checking Chrome Dev x86 ......'

curl -s "https://tools.google.com/service/update2" --data "<?xml version='1.0' encoding='UTF-8'?>
            <request protocol='3.0' version='1.3.23.9' shell_version='1.3.21.103' ismachine='0'
                     sessionid='{3597644B-2952-4F92-AE55-D315F45F80A5}' installsource='ondemandcheckforupdate'
                     requestid='{CD7523AD-A40D-49F4-AEEF-8C114B804658}' dedup='cr'>
            <hw sse='1' sse2='1' sse3='1' ssse3='1' sse41='1' sse42='1' avx='1' physmemory='12582912' />
            <os platform='win' version='6.3' arch='x86'/>
            <app appid='{8A69D345-D564-463C-AFF1-A69D9E530F96}' ap='2.0-dev' version='' nextversion='' lang='' brand='GGLS' client=''>
                <updatecheck/>
            </app>
            </request>" > $1/checker/dev-x86.xml

sleep 1

echo 'Checking Chrome Dev x64 ......'

curl -s "https://tools.google.com/service/update2" --data "<?xml version='1.0' encoding='UTF-8'?>
            <request protocol='3.0' version='1.3.23.9' shell_version='1.3.21.103' ismachine='0'
                     sessionid='{3597644B-2952-4F92-AE55-D315F45F80A5}' installsource='ondemandcheckforupdate'
                     requestid='{CD7523AD-A40D-49F4-AEEF-8C114B804658}' dedup='cr'>
            <hw sse='1' sse2='1' sse3='1' ssse3='1' sse41='1' sse42='1' avx='1' physmemory='12582912' />
            <os platform='win' version='6.3' arch='x64'/>
            <app appid='{8A69D345-D564-463C-AFF1-A69D9E530F96}' ap='x64-dev-multi-chrome' version='' nextversion='' lang='' brand='GGLS' client=''>
                <updatecheck/>
            </app>
            </request>" > $1/checker/dev-x64.xml

sleep 1

echo 'Checking Chrome Canary x86 ......'

curl -s "https://tools.google.com/service/update2" --data "<?xml version='1.0' encoding='UTF-8'?>
            <request protocol='3.0' version='1.3.23.9' shell_version='1.3.21.103' ismachine='0'
                     sessionid='{3597644B-2952-4F92-AE55-D315F45F80A5}' installsource='ondemandcheckforupdate'
                     requestid='{CD7523AD-A40D-49F4-AEEF-8C114B804658}' dedup='cr'>
            <hw sse='1' sse2='1' sse3='1' ssse3='1' sse41='1' sse42='1' avx='1' physmemory='12582912' />
            <os platform='win' version='6.3' arch='x86'/>
            <app appid='{4EA16AC7-FD5A-47C3-875B-DBF4A2008C20}' ap='' version='' nextversion='' lang='' brand='GGLS' client=''>
                <updatecheck/>
            </app>
            </request>" > $1/checker/canary-x86.xml

sleep 1

echo 'Checking Chrome Canary x64 ......'

curl -s "https://tools.google.com/service/update2" --data "<?xml version='1.0' encoding='UTF-8'?>
            <request protocol='3.0' version='1.3.23.9' shell_version='1.3.21.103' ismachine='0'
                     sessionid='{3597644B-2952-4F92-AE55-D315F45F80A5}' installsource='ondemandcheckforupdate'
                     requestid='{CD7523AD-A40D-49F4-AEEF-8C114B804658}' dedup='cr'>
            <hw sse='1' sse2='1' sse3='1' ssse3='1' sse41='1' sse42='1' avx='1' physmemory='12582912' />
            <os platform='win' version='6.3' arch='x64'/>
            <app appid='{4EA16AC7-FD5A-47C3-875B-DBF4A2008C20}' ap='x64-canary' version='' nextversion='' lang='' brand='GGLS' client=''>
                <updatecheck/>
            </app>
            </request>" > $1/checker/canary-x64.xml
