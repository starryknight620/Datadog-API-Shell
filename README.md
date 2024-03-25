# Datadog-API-Shell
A few handy Shell scripts leveraging the Datadog API and cURL

##Pre-requisites
-A working terminal with cURL installed  

-A file name with port numbers in the directory where you're running this script, separated line by line: i.e.
21
22
53
80
443

-jq installed to parse your JSON output, see below for install steps with brew


-`DD_API_KEY`  

-`DD_APP_KEY`  


```
brew install jq
```

-Once you've cloned or forked this repo, please update the API endpoint to your respective Datadog site. i.e. app.datadoghq.com, app.datadoghq.eu, <custom-subdomain>.datadoghq.com, <custom-subdomain>.datadoghq.eu
