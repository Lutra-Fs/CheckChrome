# UpdateTracker

(Work In Progress) Update checker for Google Chrome and some other packages.

- offline package download page generator

[![License](https://img.shields.io/github/license/Lutra-Fs/CheckChrome.svg?style=flat-square)](./LICENSE)


## Fixed version

https://lutra-fs.github.io/CheckChrome


## API for CheckChrome

XML Format Output

### Not compressed (For development)

```
GET https://lutra-fs.github.io/CheckChrome/api/chrome.xml
```

### Compressed (For production)

```
GET https://lutra-fs.github.io/CheckChrome/api/chrome.min.xml
```

## Advanced - Google Updater (Omaha) API

```xml
POST https://tools.google.com/service/update2
DATA:
<?xml version='1.0' encoding='UTF-8'?>
<request protocol='3.0' version='1.3.23.9' shell_version='1.3.21.103' ismachine='0'
         sessionid='{3597644B-2952-4F92-AE55-D315F45F80A5}' installsource='ondemandcheckforupdate'
         requestid='{CD7523AD-A40D-49F4-AEEF-8C114B804658}' dedup='cr'>
<hw sse='1' sse2='1' sse3='1' ssse3='1' sse41='1' sse42='1' avx='1' physmemory='12582912' />
<os platform='win' version='6.3' arch='{{arch}}'/>
<app appid='{{appid}}' ap='{{ap}}' version='' nextversion='' lang='' brand='GGLS' client=''><updatecheck/></app>
</request>
```

```
{{appid}}
Stable: 8A69D345-D564-463C-AFF1-A69D9E530F96",
Beta: 8A69D345-D564-463C-AFF1-A69D9E530F96",
Dev: 8A69D345-D564-463C-AFF1-A69D9E530F96",
Canary: 4EA16AC7-FD5A-47C3-875B-DBF4A2008C20"
```

```
{{arch}}
x64, x86
```

```
{{ap}}
Stable
    "x86": "-multi-chrome",
    "x64": "x64-stable-multi-chrome"
Beta
    "x86": "1.1-beta",
    "x64": "x64-beta-multi-chrome"
Dev
    "x86": "2.0-dev",
    "x64": "x64-dev-multi-chrome"
Canary
    "x86": "",
    "x64": "x64-canary"
```

> [@metowolf](https://github.com/metowolf) https://i-meto.com/chrome-binary/

## Author

**CheckChrome** © [Sukka](https://github.com/SukkaW), Released under the [GPL-3.0](./LICENSE) License.

> [Personal Website](https://skk.moe) · [Blog](https://blog.skk.moe) · GitHub [@SukkaW](https://github.com/SukkaW) · Telegram Channel [@SukkaChannel](https://t.me/SukkaChannel)

## Fixed version reviser
**CheckChrome** © [Lutra-Fs](https://github.com/Lutra-Fs), Released under the [GPL-3.0](./LICENSE) License.
> GitHub [@Lutra-Fs](https://github.com/Lutra-Fs)

## Render

![](https://i.jpg.dog/img/0e777a44b2c75a45af891563bfaa4b1e.png)
