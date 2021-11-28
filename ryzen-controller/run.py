import re
import os
import datetime
import json
import urllib
import urllib.request
from distutils.version import LooseVersion

# Loads content from the URL
# If ignore_errors is set to False(default), then will raise exception when response code is not 200(OK)
# If ignore_errors is set to True, then return an empty string ("") and print exception in the log when error happens
def load_url(url: str, ignore_errors: bool = False) -> str:
    try:
        f = urllib.request.urlopen(url)
        b = f.read()
        cont = b.decode("utf8")
    except Exception as e:
        if ignore_errors:
            print(e)
            return ""
        else:
            print(f"Error loading {url}: {e}")
            raise e
    else:
        if (not ignore_errors) and (f.getcode() != 200):
            raise RuntimeError(f"Page unreachable/redirected: {url}")
    f.close()
    return cont

# Loads content from the URL, and returns the 1st match group of the regex
# Will raise AttributeError if there is no match for the regex
def search_regex(url: str, regex: str) -> str:
    cont = load_url(url)
    match = re.search(re.compile(regex), cont)
    if not match:
        raise AttributeError(f"Could not match regex {regex} in {url}")
    return match.group(1)

# bucket = "ScoopInstaller/Extras"
bucket = "issaclin32/scoop-bucket" # !!! only used for testing before the manifest is merged
package_name = "ryzen-controller"

scoop_manifest_url = f"https://raw.githubusercontent.com/{bucket}/master/bucket/{package_name}.json"
manifest = json.loads(load_url(scoop_manifest_url))
scoop_version = LooseVersion(manifest["version"])
print(f"scoop version: {scoop_version}")

checkver_url = "https://gitlab.com/ryzen-controller-team/ryzen-controller/-/tags?sort=name_desc&format=atom"
v = search_regex(checkver_url, "ryzen-controller/-/tags/([\\d.]+)")
latest_version = LooseVersion(v)
print(f"latest version: {latest_version}")

# The release page is obfuscated with Jscrambler. Therefore some trick is needed to track the version.
if scoop_version < latest_version:
    found = False # used for breaking nested loop
    for i in range(1, 11):
        if found:
            break
        url = f"https://gitlab.com/ryzen-controller-team/ryzen-controller/-/jobs?page={i}"
        print(f"Loading {url}")
        cont = load_url(url)
        for jobid in re.findall(re.compile("-/jobs/(\\d+)\">installers</a>"), cont):
            print(f"Checking Job ID {jobid} with name \"installers\"")
            file_url = f"https://gitlab.com/ryzen-controller-team/ryzen-controller/-/jobs/{jobid}/artifacts/raw/dist/win/Ryzen%20Controller%20Setup%20{latest_version}.exe"
            try:
                f = urllib.request.urlopen(file_url)
            except Exception as e:
                print(f"    - Response: {e}")
            else:
                if f.getcode() == 200:
                    print(f"    - Found file: {file_url}")
                    found = True
                    break
                else:
                    print(f"    - Response: unreachable/redirected")
    else:
        raise RuntimeError("Could find Windows Binary after searching 10 pages of job list")


    # Generating XML
    os.environ["TZ"] = "UTC"
    time = datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    xml = "<?xml version=\"1.0\"?>"
    xml += f"<time>{time}</time>"
    xml += f"<version>{latest_version}</version>"
    xml += f"<url>{file_url}</url>"

    print("Writing to ./pages/ryzen-controller/latest.xml")
    os.makedirs("./pages/ryzen-controller", exist_ok=True)
    with open("./pages/ryzen-controller/latest.xml", "w") as f:
        f.write(xml)
