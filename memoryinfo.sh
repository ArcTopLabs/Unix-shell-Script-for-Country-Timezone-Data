#!/usr/bin/python

# install request lib : sudo easy_install -U requests
# unix : $ sudo pip install requests

import subprocess
import re
import httplib, urllib
import requests
import json

# Get process info
ps = subprocess.Popen(['ps', '-caxm', '-orss,comm'], stdout=subprocess.PIPE).communicate()[0]
vm = subprocess.Popen(['vm_stat'], stdout=subprocess.PIPE).communicate()[0]

# Iterate processes
processLines = ps.split('\n')
sep = re.compile('[\s]+')
rssTotal = 0 # kB
for row in range(1,len(processLines)):
    rowText = processLines[row].strip()
    rowElements = sep.split(rowText)
    try:
        rss = float(rowElements[0]) * 1024
    except:
        rss = 0 # ignore...
    rssTotal += rss

# Process vm_stat
vmLines = vm.split('\n')
sep = re.compile(':[\s]+')
vmStats = {}
for row in range(1,len(vmLines)-2):
    rowText = vmLines[row].strip()
    rowElements = sep.split(rowText)
    vmStats[(rowElements[0])] = int(rowElements[1].strip('\.')) * 4096
print 'memory usage'
print 'Wired Memory:\t\t%d MB' % ( vmStats["Pages wired down"]/1024/1024 )
print 'Active Memory:\t\t%d MB' % ( vmStats["Pages active"]/1024/1024 )
print 'Inactive Memory:\t%d MB' % ( vmStats["Pages inactive"]/1024/1024 )
print 'Free Memory:\t\t%d MB' % ( vmStats["Pages free"]/1024/1024 )
print 'Real Mem Total (ps):\t%.3f MB' % ( rssTotal/1024/1024 )


# save data




headers = {"Content-type": "application/json",
            "access_token": "Zs0nTQB-ujOSV0KmEoPhBx2E6-Ab_GKO"}
url = 'http://api.masterdatanode.com/unix/memory/save/'

data = {'data' :  [{'wired': ( vmStats["Pages wired down"]/1024/1024 ), 'active': ( vmStats["Pages active"]/1024/1024 ), 'inactive': ( vmStats["Pages inactive"]/1024/1024 ), 'free' : ( vmStats["Pages free"]/1024/1024 )  , 'used' : ( rssTotal/1024/1024 )}]}
params = {}
#params = {'sessionKey': '9ebbd0b25760557393a43064a92bae539d962103', 'format': 'xml', 'platformId': 1}

response  = requests.post(url, params=params, data=json.dumps(data), headers=headers)
#response = requests.post(url,params=data,headers=headers)
print response.status_code
print response.text








