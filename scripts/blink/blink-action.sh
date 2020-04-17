#!/bin/bash

# Change the mailaddress and password from Blink
mailaddress="<Mail Address Blink>"
password="<Password Blink>"

# Change the networkid, cameraid to your Camera and take a action you want or use the parameters
networkid=$1
cameraid=$2
action=$3

filename='authtoken.txt'
loginready=1

# check if authtoken File and authtoken are useful
if [ -f "$filename" ]; then
    authtoken=$(sed -n 1p $filename)
	region=$(sed -n 2p $filename)
	checklogin=$(curl -s -H "Host: prod.immedia-semi.com" -H "TOKEN_AUTH: ${authtoken}" --compressed https://rest-${region}.immedia-semi.com/networks )
	if [[ $checklogin != *"Unauthorized"* ]]; then
		loginready=2	
	fi	
	
fi

# if nessary get new authtoken
if [ $loginready -eq 1 ]; then
	databinary='{ "password" : "'$password'", "client_specifier" : "iPhone 9.2 | 2.2 | 222", "email" : "'$mailaddress'" }'
	jsonarray=$(curl -s -H "Host: prod.immedia-semi.com" -H "Content-Type: application/json" --data-binary "${databinary}" --compressed https://rest.prod.immedia-semi.com/login) #
	authtoken=$(echo $jsonarray | jq '.authtoken.authtoken' | tr -d '"') 
	region=$(echo $jsonarray | jq '.region' | jq  'keys[0]' | tr -d '"')  

	echo $authtoken > $filename
	echo $region >> $filename
fi

# Job todo
curl -s -X POST https://rest-$region.immedia-semi.com/network/$networkid/camera/$cameraid/$action -H 'Host: prod.immedia-semi.com' -H "TOKEN_AUTH: $authtoken" -H 'cache-control: no-cache' > /dev/null 2>&1




