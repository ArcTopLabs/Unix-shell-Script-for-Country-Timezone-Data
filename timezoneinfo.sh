#!/bin/sh
#please make this make file executable using : chmod u+x .....  
echo "Call to 'demo' App having 'timezone' Table info"
curl -H "access_token : Zs0nTQB-ujOSV0KmEoPhBx2E6-Ab_GKO" -H "Content-Type : application/json" http://api.masterdatanode.com/demo/timezone/info/
