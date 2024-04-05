# Datadog-API-Shell
A few handy Shell scripts leveraging the Datadog API and cURL

```
git clone git@github.com:starryknight620/Datadog-API-Shell.git
```

##Pre-requisites

-A working terminal with cURL installed  

-Your Datadog API Key and Application Key in a sticky/note for easy copy/paste. We'll be using them a few times so make sure to have them handy. This will be used to populate the following env vars in your script:

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
```

```
chmod +x synthetics_api.sh
```

```
chmod +x synthetics_bulk_pause.sh
```

-The following commands will execute the scripts. We'll run them one by one in the following order:

--> to create our tests
```
./synthetics_api.sh 
```
--> to get the test IDs
```
./get_test.sh 
```
--> to pause the tests from running
```
./synthetics_bulk_pause.sh 
```
