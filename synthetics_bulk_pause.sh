#Parameters and prompts

read -p "Enter your name: " NAME
#echo "\n"

read -s -p "Enter your Datadog API Key: " DD_API_KEY
echo "\n"

read -s -p "Enter your Datadog Application Key: " DD_APP_KEY
echo "\n"

read -p "Enter the filename containing a list of public IDs for your Synthetic tests: " filename
echo "\n"

echo "For this to work, ensure you have a file called" $filename 
echo "\n"
echo "with each public ID on a separate line"
echo "\n"
echo "in the directory where you are running this from!"
echo "\n"

read -p "Enter a status for the tests (live|paused): " STATUS
echo "\n"

## Create an API test.
## Pre-requisites: 
#curl is working properly where you run this API call from

# Curl command looping through #s 1-10 to create synthetics API tests on ports 1-10
for public_id in `cat ids.txt`
    do  
        echo "Hi," $NAME ",applying action:" $STATUS "on Synthetic TCP test with public_ID" $public_id "\n"
        curl -X PUT "https://api.datadoghq.com/api/v1/synthetics/tests/$public_id/status" \
        -H "Accept: application/json" \
        -H "Content-Type: application/json" \
        -H "DD-API-KEY: ${DD_API_KEY}" \
        -H "DD-APPLICATION-KEY: ${DD_APP_KEY}" \
        -d @- << EOF
        {
        "new_status": "$STATUS"
        }
EOF
done

