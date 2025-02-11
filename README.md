# Datadog-API-Shell
A few handy Shell scripts leveraging the Datadog API and cURL commands. The examples provided are for the [Datadog Synthetics API](https://docs.datadoghq.com/api/latest/synthetics/) endpoint. These may be modified for other Datadog APIs. 

```
git clone git@github.com:starryknight620/Datadog-API-Shell.git
```

## Pre-requisites

- A working terminal with cURL installed  

- Your Datadog API Key and Application Key in a sticky/note for easy copy/paste. We'll be using them a few times so make sure to have them handy. This will be used to populate the following env vars in your script:

- `DD_API_KEY` [API Keys](https://app.datadoghq.com/organization-settings/api-keys)  
- `DD_APP_KEY`* [Application Keys](https://app.datadoghq.com/organization-settings/application-keys)
- *The Application Key is _not_ the same as the application ID used by Datadog RUM SDKs
- Make sure the API Keys and Application Keys have the correct permissions

- [jq](https://jqlang.github.io/jq/) installed to parse your JSON output, see below for install steps with [brew](https://brew.sh/)

- If you have brew installed:

```
brew install jq
```

- Otherwise, review the steps to install jq here: https://jqlang.github.io/jq/download/

- Run the following commands to make the .sh scripts executable:

```
chmod +x *.sh
```

- The following commands will execute the scripts. We'll run them one by one in the following order:

```
# to create our tests
./synthetics_api.sh 
```

```
# to get the test IDs
./get_test.sh 
```

```
# to pause the tests from running
./synthetics_bulk_pause.sh 
```
