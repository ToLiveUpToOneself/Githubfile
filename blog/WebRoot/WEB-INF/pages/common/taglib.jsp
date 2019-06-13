<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="wp" uri="/WEB-INF/tld/wp.tld"%>
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
<c:set var="rPath" value="${basePath}/resources" />
