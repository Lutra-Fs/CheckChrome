# CheckChrome

🌐 A Chrome offline package download page generator

[![License](https://img.shields.io/github/license/Lutra-Fs/CheckChrome.svg?style=flat-square)](./LICENSE)

## Live Demo
Access the fixed version at: https://lutra-fs.github.io/CheckChrome/

## API Documentation

### Standard API Endpoints

CheckChrome provides two XML format output endpoints:

#### Development (Uncompressed)
```
GET https://lutra-fs.github.io/CheckChrome/api/chrome.xml
```

#### Production (Compressed)
```
GET https://lutra-fs.github.io/CheckChrome/api/chrome.min.xml
```

### Google Updater (Omaha) API Reference

The following details the structure for interacting with Google's update service:

#### Base Request
```xml
POST https://tools.google.com/service/update2

<?xml version='1.0' encoding='UTF-8'?>
<request protocol='3.0' version='1.3.23.9' shell_version='1.3.21.103' ismachine='0'
         sessionid='{3597644B-2952-4F92-AE55-D315F45F80A5}' installsource='ondemandcheckforupdate'
         requestid='{CD7523AD-A40D-49F4-AEEF-8C114B804658}' dedup='cr'>
    <hw sse='1' sse2='1' sse3='1' ssse3='1' sse41='1' sse42='1' avx='1' physmemory='12582912' />
    <os platform='win' version='{{winver}}' arch='{{arch}}'/>
    <app appid='{{appid}}' ap='{{ap}}' version='' nextversion='' lang='' brand='GGLS' client=''><updatecheck/></app>
</request>
```

#### Configuration Parameters

##### Application IDs (`{{appid}}`)
- Stable: `8A69D345-D564-463C-AFF1-A69D9E530F96`
- Beta: `8A69D345-D564-463C-AFF1-A69D9E530F96`
- Dev: `8A69D345-D564-463C-AFF1-A69D9E530F96`
- Canary: `4EA16AC7-FD5A-47C3-875B-DBF4A2008C20`

##### Windows Version (`{{winver}}`)
- Windows 10/11: `10.0`
- Windows 7: `6.1` (out of support)

##### Architecture Options (`{{arch}}`)
- `x64`
- `x86`

##### Channel Parameters (`{{ap}}`)
Stable:
- x86: `-multi-chrome`
- x64: `x64-stable-multi-chrome`

Beta:
- x86: `1.1-beta`
- x64: `x64-beta-multi-chrome`

Dev:
- x86: `2.0-dev`
- x64: `x64-dev-multi-chrome`

Canary:
- x86: `""`
- x64: `x64-canary`

## Credits

### Original Author
**CheckChrome** © [Sukka](https://github.com/SukkaW), Released under the [GPL-3.0](./LICENSE) License.
- Personal Website: [skk.moe](https://skk.moe)
- Blog: [blog.skk.moe](https://blog.skk.moe)
- GitHub: [@SukkaW](https://github.com/SukkaW)
- Telegram: [@SukkaChannel](https://t.me/SukkaChannel)

### Current Version Maintainer
**CheckChrome** © [Lutra-Fs](https://github.com/Lutra-Fs), Released under the [GPL-3.0](./LICENSE) License.
- GitHub: [@Lutra-Fs](https://github.com/Lutra-Fs)

## Acknowledgments
Initial API documentation reference by [@metowolf](https://github.com/metowolf)
