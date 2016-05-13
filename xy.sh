##################################
# 一些商家CID和AID               #
# 猫山王    8131,4043            #
# 唯鱼会0元 7997,3505            #
# 贡茶      7999,3511            #
#                                #
##################################

cid=0000008131
aid=A0000000000000004043 

sleep_time=630000 ##程序延迟时间
minute=`date +%M` 
Success_Num=0
Keyword=0.99 ##抢购请求返回信息关键字
url=http://qzwx.chinacloudapp.cn/scActivityController.do?qzkq
#!/bin/bash
while [ $minute -lt 100 ];  ##程序运行到几分的时候结束

do
	while  read cookie 
	do
	
		response=`curl -sS ${url} -H ${cookie}  -H 'Origin: http://qzwx.chinacloudapp.cn' -H 'Accept-Encoding: gzip, deflate' -H 'Accept-Language: zh-CN,zh;q=0.8,en;q=0.6' -H 'User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36 MicroMessenger/6.5.2.501 NetType/WIFI WindowsWechat' -H 'Content-Type: application/x-www-form-urlencoded; charset=UTF-8' -H 'Accept: */*' -H "Referer: http://qzwx.chinacloudapp.cn/mall/sjxq.jsp?flag=1&merchantId=${cid}&type=&sq=&sort=3&aid=$aid" -H 'X-Requested-With: XMLHttpRequest' -H 'Connection: keep-alive' --data "aid=$aid" --compressed`
		echo $response
		[[ $response =~ $Keyword ]] && ((Success_Num++))  && echo "商品编号为："$cid  $Keyword "抢购成功+1"  >>./xy.log  &&date +%s_%N%n%n >>./xy.log
		##判断返回的字符里面是否包含抢购成功信息，如果有抢购成功数量+1 
		echo  $Success_Num
		[[ $Success_Num = 2 ]] &&  cid=0000007999 && Success_Num=0 && aid=A0000000000000003511  && Keyword=1元 
		##成功数量达到2次后，抢购下一件商品
		date +%s_%N%n%n  
		usleep  ${sleep_time}  ##延迟630毫米执行下一步
	done </www/web/xyyh/cookie.txt
done 


