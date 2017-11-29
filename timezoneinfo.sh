#!/bin/sh
#please make this make file executable using : chmod u+x .....  
echo "Call to 'demo' App having 'timezone' Table info"
curl -H "access_token:####ACCESSTOKEN######" -H "Content-Type : application/json" http://api.masterdatanode.com/##APPNAME##/timezone/info/
