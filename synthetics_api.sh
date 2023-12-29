## Parameters and prompts
read -p "Enter your name: `echo '\n> '` " NAME

read -s -p "Enter your Datadog API Key: `echo '\n> '`" DD_API_KEY

read -s -p "Enter your Datadog Application Key: `echo '\n> '`" DD_APP_KEY

read -p "Enter the hostname you wish to test against: `echo '\n> '`" THEHOST

read -p "Enter a timeout value for your test: `echo '\n> '`" TIMEOUT

read -p "Enter a filename with the ports (one port # per line) you wish to create tests on: `echo '\n> '`" FILENAME

echo "This test won't work if you don't have a valid file called" $FILENAME 
echo "with the port numbers entered correctly"
echo "\n"

echo "Thank you, "$NAME"! We'll create your Synthetic API tests shortly\n"
echo "(no results or errors returned? 
Make sure you're entering the right keys 
and you have synthetic tests present
and make sure you haven't hit your 
quotas for number of tests)\n"

## Create an API test.
## Pre-requisites: 
#curl is working properly where you run this API call from

# Curl command looping through #s 1-10 to create synthetics API tests on ports 1-10
if [ -f "$FILENAME" ];
    then    
    echo $FILENAME "exists"
    echo "\n"
        for THEPORT in `cat $FILENAME`
        do  
            echo "Creating Synthetic API TCP test #" $THEPORT "\n"
            curl -X POST "https://naveen.datadoghq.com/api/v1/synthetics/tests/api" \
            -H "Accept: application/json" \
            -H "Content-Type: application/json" \
            -H "DD-API-KEY: ${DD_API_KEY}" \
            -H "DD-APPLICATION-KEY: ${DD_APP_KEY}" \
            -d @- << EOF
            {
            "config": {
            "assertions": [
            {
            "type": "connection",
            "operator": "is",
            "target": "established"
            }
            ],
            "request": {
            "host": "$THEHOST",
            "port": $THEPORT,
            "timeout": $TIMEOUT
            }
        },
        "options": {
            "httpVersion": "any",
            "min_failure_duration": 0,
            "min_location_failed": 1,
            "monitor_options": {
            "notification_preset_name": "show_all",
            "on_missing_data": "show_no_data",
            "notify_audit": false,
            "new_host_delay": 300,
            "include_tags": true
            },
            "tick_every": 60
        },
        "locations": [
            "aws:af-south-1",
            "aws:ap-east-1",
            "aws:ap-northeast-1",
            "aws:ap-northeast-2",
            "aws:ap-northeast-3",
            "aws:ap-south-1",
            "aws:ap-southeast-1",
            "aws:ap-southeast-2",
            "aws:ap-southeast-3",
            "aws:ca-central-1",
            "aws:eu-central-1",
            "aws:eu-north-1",
            "aws:eu-south-1",
            "aws:eu-west-1",
            "aws:eu-west-2",
            "aws:eu-west-3",
            "aws:me-south-1",
            "aws:sa-east-1",
            "aws:us-east-1",
            "aws:us-east-2",
            "aws:us-west-1",
            "aws:us-west-2",
            "azure:eastus"
        ],
        "type": "api",
        "subtype": "tcp",
        "message": "Hello, is it me you're looking for Port #: $THEHOST:$THEPORT",
        "name": "Port test on $THEHOST:$THEPORT" 
        }
EOF
done
else
    echo $FILENAME "does not exist" >&2
fi

