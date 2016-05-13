




#!/bin/sh 
cid=0000007999
aid=A0000000000000003511
url=http://qzwx.chinacloudapp.cn/scActivityController.do?qzkq
cookie="Cookie:JSESSIONID=9TVpX0kQ5T1GJKv5f9VQdVtSJ5mMv4tX9Kfj6NPrP5ybhPrdhrG1!1738318789"


while true 
do
curl -sS ${url} -H $cookie  -H 'Origin: http://qzwx.chinacloudapp.cn' -H 'Accept-Encoding: gzip, deflate' -H 'Accept-Language: zh-CN,zh;q=0.8,en;q=0.6' -H 'User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36 MicroMessenger/6.5.2.501 NetType/WIFI WindowsWechat' -H 'Content-Type: application/x-www-form-urlencoded; charset=UTF-8' -H 'Accept: */*' -H "Referer: http://qzwx.chinacloudapp.cn/mall/sjxq.jsp?flag=1&merchantId=${cid}&type=&sq=&sort=3&aid=$aid" -H 'X-Requested-With: XMLHttpRequest' -H 'Connection: keep-alive' --data "aid=$aid" --compressed  -v

sleep 1s
done 