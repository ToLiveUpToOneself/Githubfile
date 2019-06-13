<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	int port = request.getServerPort();
	String basePath = null;
	if(port==80){
		basePath = request.getScheme()+"://"+request.getServerName()+path;
	}else{
		basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
	}
	pageContext.setAttribute("basePath", basePath);
	pageContext.setAttribute("adminPath", basePath+"/sysmgr/admin");

%>
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="Generator" content="EditPlus®">
	<meta name="Author" content="">
	<meta name="Keywords" content="">
	<meta name="Description" content="">
	<title>Document</title>
	<style type="text/css">
		*{margin:0;padding:0;}
		body{font-size:12px;font-family:"microsoft YaHei";color:#666;background:url("https://ss3.bdstatic.com/iPoZeXSm1A5BphGlnYG/skin/38.jpg");}
		p{background:url("${basePath}/resources/images/404.gif") no-repeat;font-size:200px;font-weight:bold;  background-repeat: repeat;
  -webkit-background-clip: text;
  -webkit-text-fill-color:transparent;}
  		span{font-size: 16px;-webkit-text-fill-color:#e8eae9;}
  		.con{
  			width:500px;
  			height:500px;
  			margin:0 auto;
  			box-shadow:5px 3px 48px #111;
  		}
  		
	</style>
</head>
<body>
	<p>500<span>服务器发生错误了哦。</span></p>
</body>
</html>
