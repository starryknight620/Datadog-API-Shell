# Datadog-API-Shell
A few handy Shell scripts leveraging the Datadog API and cURL

##Pre-requisites
-A working terminal with cURL working  

-(Optional) jq installed to parse your JSON output. You can install it with Homebrew on macOS:

```
brew install jq
```

-DD_API_KEY  

-DD_APP_KEY  

##Notes
In the file `synthetics_api.sh` this will create synthetic tests for you on some hard coded ports.
You may change this array of ports or have it read from a file of port numbers
Feel free to also change the type of test you're creating, subtype, message, name, etc.
You may specify as few or as many locations, including your own private locations (PLs) as you wish
```
for public_id in `cat ports.txt` 
```
