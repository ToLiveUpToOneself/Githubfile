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
	<link rel="stylesheet" href="${rPath}/css/tz-page.css">
	<%@include file="/WEB-INF/pages/admin/common/common.jsp" %>
	<script type="text/javascript" src="${basePath}/resources/js/tz_page.js"></script>
 </head>
 <body>
	<div class="wrap">
		<!-- left页面 -->
		<%@include file="/WEB-INF/pages/admin/common/left.jsp" %>
		<div class="content">
			<!-- 头部页面 -->
			<%@include file="/WEB-INF/pages/admin/common/header.jsp" %>
			<div class="channel"> 位置 > 内容管理  </div>
			<div class="cnt">
				<div class="tabwrap">
					<!--表格-->
					<table class="tztab">
						<caption>
							<div class="fr sbtn">
								<input type="text" id="keywords" class="fl" placeholder="搜索的关键字..."/><a href="javascript:void(0);" onclick="wpAdmin.search(this);" class="fl"><i class="fa fa-search "></i></a>
							</div>
						</caption>
						<!--头部
						<colgroup id="days">
							<col/>
							<col style="background:green;width:200px;"/>
							<col id="t"/>
						</colgroup>-->
						<thead>
							<tr>
								<th>主键</th>
								<th>标题 <span class="up"></span> <span class="down"></span></th>	
								<th>栏目</th>	
								<th>作者</th>	
								<th>创建时间</th>	
								<th>是否置顶</th>	
								<th>是否精华</th>	
								<th>删除状态</th>	
								<th>是否评论</th>	
								<th>发布状态</th>	
								<th>操作</th>
							</tr>
						</thead>
						<!--身体部-->
						<tbody id="tbody" data-model="content">
							
						</tbody>
					</table>
					<div class="cpage"></div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	
		$(function(){
	
			wpAdmin.loadData(0,10,function(itemCount){
				wpAdmin.initPage(itemCount);//分页加载一次吗
				$(".tmui-tips").hover(function(){
					layer.tips($(this).data("tip"), $(this));
				},function(){
					
				});
			});
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