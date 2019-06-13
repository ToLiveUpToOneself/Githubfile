<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@include file="/WEB-INF/pages/common/taglib.jsp" %>
<!DOCTYPE HTML>
<html>
<head>
	<title>后台管理系统</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<%@include file="/WEB-INF/pages/admin/common/common.jsp" %>
 </head>
 <body>
	<div class="wrap">
		<%@include file="/WEB-INF/pages/admin/common/left.jsp" %>
		<div class="content">
			<%@include file="/WEB-INF/pages/admin/common/header.jsp" %>
			<div class="channel"> Home > Table</div>
			<div class="cnt">
				
			</div>
		</div>
	
	</div>


	<script type="text/javascript">
		$(function(){
			$(".nav").find("li.items").find("a").click(function(){
				var len = $(this).next().length;
				if(len>0){
					$(this).next().stop(true,true).slideToggle()
					.end().parents("li")
					.addClass("active")
					.siblings().removeClass("active")
					.find("ul").slideUp("slow");
				}
			});
		});
	</script>
 </body>
</html>