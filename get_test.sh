# Path parameters

echo "Enter your name: "
read NAME

read -s -p "Enter your Datadog API Key: " DD_API_KEY
echo "\n"

read -s -p "Enter your Datadog Application Key: " DD_APP_KEY
echo "\n"

echo "Thank you, "$NAME"! We'll get your Synthetic test public IDs shortly and output them to a file called ids.txt \n"
echo "Your public_IDs are...(did ids.txt come back result in an empty file? make sure you're entering the right keys and you have synthetic tests present)\n"

# Curl command
curl -sX GET "https://api.datadoghq.com/api/v1/synthetics/tests" \
-H "Accept: application/json" \
-H "DD-API-KEY: ${DD_API_KEY}" \
-H "DD-APPLICATION-KEY: ${DD_APP_KEY}" | jq . | grep public_id | sed 's/\"public_id": "//g' | sed 's/\",//g' > ids.txt
echo "\n" 

