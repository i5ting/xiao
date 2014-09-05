# xiao 

## web 打包

[Cocos2d-JS打包](http://cn.cocos2d-x.org/tutorial/show?id=1324)

执行命令

	export ANT_ROOT=/Users/shiren1118/java/javaee/apache-ant-1.9.4/bin
	cocos compile -p web -m release
	
执行结果

	➜  xiao git:(master) cocos compile -p web -m release
	Running command: compile
	Building mode: release
	running: '/Users/shiren1118/java/javaee/apache-ant-1.9.4/bin/ant -f /Users/shiren1118/Workspace/game/xiao/publish/html5/build.xml'

	Buildfile: /Users/shiren1118/Workspace/game/xiao/publish/html5/build.xml

	compile:
	   [jscomp] Compiling 71 file(s) with 42 extern(s)
		   [jscomp] 0 error(s), 0 warning(s)

	BUILD SUCCESSFUL
	Total time: 17 seconds
	➜  xiao git:(master) ✗
	
## test

	cocos run -p web  
	
	
## issue

- [x] 多了个头
- [x] logo
- [ ] 成功显示的步数
- [x] loading去掉
- [ ] 统计点击次数


## resources

- [如何自定义 Cocos2d-HTML5 Loading 界面](http://www.tairan.com/archives/4972)
- [cocos js api](http://www.cocos2d-x.org/reference/html5-js/V3.0rc3/index.html)
- [Getting_Started_Cocos2d_JS](http://www.cocos2d-x.org/wiki/Getting_Started_Cocos2d-JS)

## nginx 负载

	worker_processes 1; 
	events { 
		worker_connections 1024; 
	} 
	http{ 
		upstream backend { 
			server 127.0.0.1:9090; 
			server 127.0.0.1:9091; 
		} 
		server { 
			listen 8000; 
			location / { 
			proxy_pass http://backend; 
		} 
	} 


其实只要把http里面的丢进去就可以了

需要重载一下nginx

	sudo nginx -s reload


## 最简单的移动端统计方法

使用ajax的get请求

	function statistic_request(key) {
	    var url = "http://at35.com:3000/log/" + key;
	    var xhr = new XMLHttpRequest();
	    xhr.open("GET", url, true);
	    xhr.send(null);
	}
	
参数是key，档服务器接到一次请求，记录一条记录就可以了

