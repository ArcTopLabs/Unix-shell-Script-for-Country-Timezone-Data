#!/bin/sh
#please make this make file executable using : chmod u+x .....  , download jq shell using brew or any online tool
echo "Save info about application running"

#addressLineOne="$(curl -H 'access_token : Zs0nTQB-ujOSV0KmEoPhBx2E6-Ab_GKO' -H 'Content-Type : application/json' http://api.masterdatanode.com/demo/greeting/find?LANGUAGE=ENGLISH | jq -r '.greeting' | jq -r '.[].TRANSLATION')"


PROCESS=command
number=$(ps -ax | grep  Applications | wc -l )

if [ $number -gt 0 ]
    then
        echo Total running process $number;
        curl -H "access_token : Zs0nTQB-ujOSV0KmEoPhBx2E6-Ab_GKO" -H "Content-Type : application/json" --data "{ \"data\" : [{ \"process\" : \"$number\" }]}" http://api.masterdatanode.com/unix/process/save/
fi
