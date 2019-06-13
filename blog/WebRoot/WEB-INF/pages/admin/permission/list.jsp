<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@include file="/WEB-INF/pages/common/taglib.jsp"%>
<!DOCTYPE HTML>
<html>
  <head>
    <title></title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="${rPath}/zTree/css/zTreeStyle.css">
	<%@include file="/WEB-INF/pages/admin/common/common.jsp" %>
	<script type="text/javascript" src="${rPath}/js/tz_page.js"></script>
	<script type="text/javascript" src="${rPath}/zTree/jquery.ztree.all.min.js"></script>
 </head>
 <body>
	<div class="wrap">
		<!-- left页面 -->
		<%@include file="/WEB-INF/pages/admin/common/left.jsp" %>
		<div class="content">
			<!-- 头部页面 -->
			<%@include file="/WEB-INF/pages/admin/common/header.jsp" %>
			<div class="channel"> 位置 > 内容管理</div>
			<div class="cnt">
				<div class="tabwrap">
					<ul id="ztree" class="ztree">
						
					</ul>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	
		$(function(){
			loadZTree();
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
		
		function loadZTree(){
			wpAjax.request({
				path:adminPath,
				model:"permission",
				method:"root",
				success:function(data){
					var setting = {
							check: {
								enable: true
							},
							data: {
								simpleData: {
									enable: true
								}
							},
							edit: {
								enable: true,
								editNameSelectAll: true,
								showRemoveBtn: showRemoveBtn
							}
						};
					$.fn.zTree.init($("#ztree"), setting, data);
				}
			},{})
		}	
		function showRemoveBtn(treeId, treeNode) {
			return !treeNode.isFirstNode;
		}
	</script>
 </body>
</html>