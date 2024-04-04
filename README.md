# Datadog-API-Shell
A few handy Shell scripts leveraging the Datadog API and cURL

##Pre-requisites
-A working terminal with cURL installed  

-Your Datadog API Key and Application Key in a sticky/note for easy copy/paste. This will be used to populate the following env vars in your script:

-`DD_API_KEY`  
-`DD_APP_KEY`  

-jq installed to parse your JSON output, see below for install steps with brew

-If you have brew installed:
```
brew install jq
```

-Otherwise, review the steps to install jq here: https://jqlang.github.io/jq/download/

-Run the following commands to make the .sh scripts executable:
```
chmod +x get_test.sh
chmod +x synthetics_api.sh
chmod +x synthetics_bulk_pause.sh

```

-Once you've cloned or forked this repo, please update the API endpoint to your respective Datadog site. i.e. app.datadoghq.com, app.datadoghq.eu, {custom-subdomain}.datadoghq.com, {custom-subdomain}.datadoghq.eu
