mkdir ./public
mkdir ./tmp

echo '-------------------------------------'
echo 'Checking Chrome Stable arm Android ......'
echo '-------------------------------------'
echo ''

curl "https://tools.google.com/service/update2" --data "<?xml version='1.0' encoding='UTF-8'?>
            <request protocol='3.0' version='1.3.23.9' shell_version='1.3.21.103' ismachine='0'
                     sessionid='{3597644B-2952-4F92-AE55-D315F45F80A5}' installsource='ondemandcheckforupdate'
                     requestid='{CD7523AD-A40D-49F4-AEEF-8C114B804658}' dedup='cr'>
            <hw sse='1' sse2='1' sse3='1' ssse3='1' sse41='1' sse42='1' avx='1' physmemory='12582912' />
            <os platform='android' version='6.3' arch='arm'/>
            <app appid='{8A69D345-D564-463C-AFF1-A69D9E530F96}' version='' nextversion='' lang='' brand='GGLS' client=''>
                <updatecheck/>
            </app>
            </request>" > ./tmp/stable-arm.unformat.xml

echo ''
echo '-------------------------------------'
echo 'Checking Chrome Beta arm Android ......'
echo '-------------------------------------'
echo ''

curl "https://tools.google.com/service/update2" --data "<?xml version='1.0' encoding='UTF-8'?>
            <request protocol='3.0' version='1.3.23.9' shell_version='1.3.21.103' ismachine='0'
                     sessionid='{3597644B-2952-4F92-AE55-D315F45F80A5}' installsource='ondemandcheckforupdate'
                     requestid='{CD7523AD-A40D-49F4-AEEF-8C114B804658}' dedup='cr'>
            <hw sse='1' sse2='1' sse3='1' ssse3='1' sse41='1' sse42='1' avx='1' physmemory='12582912' />
            <os platform='android' version='6.3' arch='arm'/>
            <app appid='{8A69D345-D564-463C-AFF1-A69D9E530F96}' version='' nextversion='' lang='' brand='GGLS' client=''>
                <updatecheck/>
            </app>
            </request>" > ./tmp/beta-arm.unformat.xml

echo ''
echo '-------------------------------------'
echo 'Checking Chrome Dev arm Android ......'
echo '-------------------------------------'
echo ''

curl "https://tools.google.com/service/update2" --data "<?xml version='1.0' encoding='UTF-8'?>
            <request protocol='3.0' version='1.3.23.9' shell_version='1.3.21.103' ismachine='0'
                     sessionid='{3597644B-2952-4F92-AE55-D315F45F80A5}' installsource='ondemandcheckforupdate'
                     requestid='{CD7523AD-A40D-49F4-AEEF-8C114B804658}' dedup='cr'>
            <hw sse='1' sse2='1' sse3='1' ssse3='1' sse41='1' sse42='1' avx='1' physmemory='12582912' />
            <os platform='android' version='6.3' arch='arm'/>
            <app appid='{8A69D345-D564-463C-AFF1-A69D9E530F96}' version='' nextversion='' lang='' brand='GGLS' client=''>
                <updatecheck/>
            </app>
            </request>" > ./tmp/dev-arm.unformat.xml

echo ''
echo '-------------------------------------'
echo 'Checking Chrome Canary arm Android ......'
echo '-------------------------------------'
echo ''

curl "https://tools.google.com/service/update2" --data "<?xml version='1.0' encoding='UTF-8'?>
            <request protocol='3.0' version='1.3.23.9' shell_version='1.3.21.103' ismachine='0'
                     sessionid='{3597644B-2952-4F92-AE55-D315F45F80A5}' installsource='ondemandcheckforupdate'
                     requestid='{CD7523AD-A40D-49F4-AEEF-8C114B804658}' dedup='cr'>
            <hw sse='1' sse2='1' sse3='1' ssse3='1' sse41='1' sse42='1' avx='1' physmemory='12582912' />
            <os platform='android' version='6.3' arch='arm'/>
            <app appid='{4EA16AC7-FD5A-47C3-875B-DBF4A2008C20}' version='' nextversion='' lang='' brand='GGLS' client=''>
                <updatecheck/>
            </app>
            </request>" > ./tmp/canary-arm.unformat.xml
