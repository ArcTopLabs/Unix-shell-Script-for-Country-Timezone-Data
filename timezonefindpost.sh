#!/bin/sh
#please make this make file executable using : chmod u+x .....  
echo "Call to 'demo' App having 'timezone' Table find using POST"
curl -H "access_token : Zs0nTQB-ujOSV0KmEoPhBx2E6-Ab_GKO" -H "Content-Type : application/json" --data "{ \"filter\" : { \"Country\" : \"India\" }}" http://api.masterdatanode.com/demo/timezone/find/
