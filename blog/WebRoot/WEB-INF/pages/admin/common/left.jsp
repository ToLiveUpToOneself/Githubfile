<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<div class="slider">
<div class="logo">
	<a href="#"><img src="${basePath}/resources/images/adminlogo.png"/></a>
	</div>
	<div class="nav">
		<ul>
			<wp:permission model="content" method="list">
				<wp:if test="${wp:indexOf(pageContext.request.requestURI,'admin/content')!=-1}">
					<wp:then>
						<li class="items active"><a href="javascript:void(0)"><i class="fa fa-th"></i>内容管理</a>
							<ul calss="subul" style="display:block">
								 <wp:if test="${wp:indexOf(pageContext.request.requestURI,'content/list')!=-1}">
								 	<wp:then><li class="citems active"><a href="javascript:void(0);"><i class="fa fa-list"></i>内容管理</a></li></wp:then>
								 	<wp:else><li class="citems"><a href="${adminPath}/content/list"><i class="fa fa-list"></i>内容管理</a></li></wp:else>
								 </wp:if>
								 <wp:if test="${wp:indexOf(pageContext.request.requestURI,'content/add')!=-1}">
								 	<wp:then><li class="citems active"><a href="javascript:void(0);"><i class="fa fa-plus"></i>内容<c:if test="${empty contentById}">添加</c:if><c:if test="${not empty contentById}">修改</c:if></a>
								 	</li></wp:then>
								 	<wp:else><li class="citems"><a href="${adminPath}/content/add"><i class="fa fa-plus"></i>内容<c:if test="${empty contentById}">添加</c:if><c:if test="${not empty contentById}">修改</c:if></a></li></wp:else>
								 </wp:if>
							</ul>
						</li>				
					</wp:then>
					<wp:else>
						<li class="items "><a href="${adminPath}/content/list"><i class="fa fa-home"></i>内容管理</a></li>
					</wp:else>
				</wp:if>
			</wp:permission>	
			<wp:permission model="user" method="list">
				 <wp:if test="${wp:indexOf(pageContext.request.requestURI,'/user/list')!=-1}">
					<wp:then>
						<li class="items active"><a href="javascript:void(0)"><i class="fa fa-user"></i>用户管理</a></li>
					</wp:then>
					<wp:else>
						<li class="items "><a href="${adminPath}/user/list"><i class="fa fa-user"></i>用户管理</a></li>
					</wp:else>
				</wp:if>
			</wp:permission>
			<wp:permission model="role" method="list">
				<wp:if test="${wp:indexOf(pageContext.request.requestURI,'/role/list')!=-1}">
					<wp:then>
						<li class="items active"><a href="javascript:void(0)"><i class="fa fa-users"></i>角色管理</a></li>
					</wp:then>
					<wp:else>
						<li class="items "><a href="${adminPath}/role/list"><i class="fa fa-users"></i>角色管理</a></li>
					</wp:else>
				</wp:if>
			</wp:permission>	
			<wp:permission model="permission" method="list">	
				<wp:if test="${wp:indexOf(pageContext.request.requestURI,'/permission/list')!=-1}">
					<wp:then>
						<li class="items active"><a href="javascript:void(0)"><i class="fa fa-lock"></i>权限管理</a></li>
					</wp:then>
					<wp:else>
						<li class="items "><a href="${adminPath}/permission/list"><i class="fa fa-lock"></i>权限管理</a></li>
					</wp:else>
				</wp:if>
			</wp:permission>	
			<wp:permission model="log" method="list">
				 <wp:if test="${wp:indexOf(pageContext.request.requestURI,'admin/log')!=-1}">
					<wp:then>
						<li class="items active"><a href="javascript:void(0)"><i class="fa fa-pie-chart"></i>统计报表</a>
							<ul calss="subul" style="display:block">
								 <wp:if test="${wp:indexOf(pageContext.request.requestURI,'log/list')!=-1}">
								 	<wp:then><li class="citems active"><a href="javascript:void(0);"><i class="fa fa-area-chart"></i>内容统计</a></li></wp:then>
								 	<wp:else><li class="citems"><a href="${adminPath}/log/list"><i class="fa fa-area-chart"></i>内容统计</a></li></wp:else>
								 </wp:if>
								 <wp:if test="${wp:indexOf(pageContext.request.requestURI,'log/viewlist')!=-1}">
								 	<wp:then><li class="citems active"><a href="javascript:void(0);"><i class="fa fa-bar-chart-o"></i>访问统计</a></li></wp:then>
								 	<wp:else><li class="citems"><a href="${adminPath}/log/viewlist"><i class="fa fa-bar-chart-o"></i>访问统计</a></li></wp:else>
								 </wp:if>
							</ul>
						</li>
					</wp:then>
					<wp:else>
						<li class="items"><a href="${adminPath}/log/list"><i class="fa fa-pie-chart"></i>统计报表</a></li>
					</wp:else>
				</wp:if>
			</wp:permission>
			<wp:permission model="other" method="header">
				<wp:if test="${wp:indexOf(pageContext.request.requestURI,'admin/other')!=-1}">
					<wp:then>
						<li class="items active"><a href="javascript:void(0)"><i class="fa fa-cog"></i>其他管理</a>
							<ul calss="subul" style="display:block">
								 <wp:if test="${wp:indexOf(pageContext.request.requestURI,'other/header')!=-1}">
								 	<wp:then><li class="citems active"><a href="javascript:void(0);"><i class="fa fa-area-chart"></i>头部管理</a></li></wp:then>
								 	<wp:else><li class="citems"><a href="${adminPath}/other/header"><i class="fa fa-area-chart"></i>头部管理</a></li></wp:else>
								 </wp:if>
								 <wp:if test="${wp:indexOf(pageContext.request.requestURI,'other/link')!=-1}">
								 	<wp:then><li class="citems active"><a href="javascript:void(0);"><i class="fa fa-link"></i>友链管理</a></li></wp:then>
								 	<wp:else><li class="citems"><a href="${adminPath}/other/link"><i class="fa fa-link"></i>友链管理</a></li></wp:else>
								 </wp:if>
							</ul>
						</li>
					</wp:then>
					<wp:else>
						<li class="items"><a href="${adminPath}/other/header"><i class="fa fa-cog"></i>其他管理</a></li>
					</wp:else>
				</wp:if>
			</wp:permission>
			
			
			<%-- <li class="items"><a href="${adminPath}/music/list"><i class="fa fa-inbox"></i>音乐管理</a></li>
			<li class="items"><a href="${adminPath}/gather/list"><i class="fa fa-send"></i>爬虫采集</a></li>
			 --%>
			
			 <!-- <li class="items">
				<a href="javascript:void(0);"><i class="fa fa-th-list"></i>表单</a>
				<ul>
					 <li class="citems"><a href="javascript:void(0);"><i class="fa fa-inbox"></i>区块</a></li>
					 <li class="citems"><a href="javascript:void(0);"><i class="fa fa-th"></i>表格</a></li>
					 <li class="citems"><a href="javascript:void(0);"><i class="fa fa-send"></i>其他</a></li>
				</ul>
				<span class="numicon c5">3</span>
			 </li>
			 <li class="items">
				<a href="javascript:void(0);"><i class="fa fa-tint"></i>按钮组</a>
				<ul>
					 <li class="citems"><a href="javascript:void(0);"><i class="fa fa-inbox"></i>区块</a></li>
					 <li class="citems"><a href="javascript:void(0);"><i class="fa fa-th"></i>表格</a></li>
					 <li class="citems"><a href="javascript:void(0);"><i class="fa fa-send"></i>其他</a></li>
					 <li class="citems"><a href="javascript:void(0);"><i class="fa fa-th"></i>表格</a></li>
					 <li class="citems"><a href="javascript:void(0);"><i class="fa fa-send"></i>其他</a></li>
				</ul>
				<span class="numicon c1">5</span>
			 </li>
			 <li class="items"><a href="javascript:void(0);"><i class="fa fa-pencil"></i>元素</a></li>
			 <li class="items"><a href="javascript:void(0);"><i class="fa fa-star"></i>Addons 5</a></li>
			 <li class="items"><a href="javascript:void(0);"><i class="fa fa-file-o"></i>Error</a></li> -->
		</ul>
	</div>
</div>