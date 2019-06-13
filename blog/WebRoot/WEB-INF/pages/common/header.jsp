<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
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
	pageContext.setAttribute("rPath", basePath+"/resources");

%>
<div id="header" style="background:url('${top.url}') top center no-repeat;">
	<!--nav start-->
	<div class="nav">
		<ul>
			<h1><a href="${basePath}/index" class="logo"><img src="${rPath}/images/logoo.png" alt="个人博客" width="200" height="64" /></a></h1>
			<li><a href="${basePath}/index">网站首页</a></li>
			<li><a href="${basePath}/index/web">Web前端</a></li>
			<li><a href="${basePath}/index/java">Java</a></li>
			<li><a href="${basePath}/index/nt">网络技术</a></li>
			<li><a href="${basePath}/index/sl">慢丶生活</a></li>
			<li><a href="${basePath}/index/about">关于本站</a></li>
		</ul>
	</div>
	<!--nav end-->
	<div class="bottom">
			<p>${top.title}</p>
			<p>${top.content }</p>
	</div>
</div>