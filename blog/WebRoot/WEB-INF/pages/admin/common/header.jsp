<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<div class="header">
<ul class="fl">
	 <li class="titems"><a href="javascript:void(0);"><i class="fa fa-user"></i>欢迎【${session_role_name.name}】${session_user_username}来到管理后台</a></li>
	 <li class="titems"><a href="javascript:void(0);"><i class="fa fa-envelope"></i>消息0个!</a></li>
	 <li class="titems"><a href="javascript:void(0);"><i class="fa fa-cog"></i>设置</a></li>
	 <li class="titems"><a href="${adminPath}/logout"><i class="fa fa-share-alt"></i>退出</a></li>	
	</ul>
</div>