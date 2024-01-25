# Path parameters

read -p "Enter your name: `echo '\n> '`" NAME

read -s -p "Enter your Datadog API Key: `echo '\n> '` " DD_API_KEY

read -s -p "Enter your Datadog Application Key: `echo '\n> '` " DD_APP_KEY

echo "Thank you, "$NAME"! We'll get your Synthetic test public IDs shortly and output them to a file called ids.txt \n"
echo "Your public_IDs are...(did ids.txt come back result in an empty file? make sure you're entering the right keys and you have synthetic tests present)\n"

# Curl command
curl -sX GET "https://api.datadoghq.com/api/v1/synthetics/tests" \
-H "Accept: application/json" \
-H "DD-API-KEY: ${DD_API_KEY}" \
-H "DD-APPLICATION-KEY: ${DD_APP_KEY}" | jq -r '.tests[].public_id' > ids.txt
echo "\n" 

