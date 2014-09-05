#! /bin/bash

export ANT_ROOT=/Users/shiren1118/java/javaee/apache-ant-1.9.4/bin
cocos compile -p web -m release

cp -f WeixinApi.js publish/html5

rm -rf publish/html5sang.zip

cd publish

zip -r html5sang.zip html5 

ssh sang@at35.com rm -rf /home/sang/html5 /home/sang/html5sang.zip

scp html5sang.zip sang@at35.com:~

ssh sang@at35.com unzip /home/sang/html5sang.zip

cd ..