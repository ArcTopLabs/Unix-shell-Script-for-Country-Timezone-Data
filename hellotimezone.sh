#!/bin/sh
#please make this make file executable using : chmod u+x .....  , download jq shell using apt/brew or any online tool
echo "Call to 'demo' App having 'timezone' Table info"

addressLineOne="$(curl -H 'access_token : Zs0nTQB-ujOSV0KmEoPhBx2E6-Ab_GKO' -H 'Content-Type : application/json' http://api.masterdatanode.com/demo/timezone/find?Country=India | jq -r '.timezone' | jq -r '.[].TimeZone')"

echo "hello timezone india " . $addressLineOne
