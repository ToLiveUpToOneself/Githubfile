<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@include file="/WEB-INF/pages/common/taglib.jsp"%>
<!DOCTYPE HTML>
<html>
  <head>
    <title>内容添加</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="${rPath}/css/tz-page.css">
	<%@include file="/WEB-INF/pages/admin/common/common.jsp" %>
	<script type="text/javascript" src="${basePath}/edit/ueditor.config.js"></script>
    <script type="text/javascript" src="${basePath}/edit/ueditor.all.min.js"> </script>
    <script type="text/javascript" src="${basePath}/edit/lang/zh-cn/zh-cn.js"></script>
    <style>
    	body{overflow-x:hidden;}
    	.addcon p input,select{
	    	width: 100%;
		    outline: none;
		    text-indent: 10px;
		    height: 36px;
		    font-size: 20px;
		    color: #502828;
		    margin: 10px 0 10px 0;
    	}
    	.addbtn{
    		padding:40px 0;
    	}
    	.addbtn a{
    		font-size: 20px;
		    color: red;
		    display: inline-block;
		    width: 100%;
		    height: 36px;
		    line-height: 36px;
		    text-align: center;
		    border: 1px solid #0c0202;
    	}
    </style>
 </head>
 <body>
 	<div class="wrap">
		<!-- left页面 -->
		<%@include file="/WEB-INF/pages/admin/common/left.jsp" %>
		<div class="content">
			<!-- 头部页面 -->
			<%@include file="/WEB-INF/pages/admin/common/header.jsp" %>
			<div class="channel" data-cid="${contentById.id}"> 位置 > 内容<c:if test="${empty contentById}">添加</c:if><c:if test="${not empty contentById}">修改</c:if> </div>
			<div class="addcon" data-author="${session_user_username}">
				
				<p><input type="text" id="title" value="${contentById.title}" placeholder="请输入内容标题" /></p>
				<p><input type="text" id="subTitle" disabled="disabled" placeholder="请输入内容子标题" /></p>
				<p><input type="text" id="description" value="${contentById.description}" placeholder="请输入文章内容描述" /></p>
				<p><input type="text" id="keywords" value="${contentById.keywords}" placeholder="请输入优化关键字" /></p>
				<p>
					<select id="channelId">
						<option value="" >--选着栏目--</option>
						<option value="2" ${contentById.channelId==2?"selected":""} >Web前端</option>
						<option value="3" ${contentById.channelId==3?"selected":""} >Java</option>
						<option value="4" ${contentById.channelId==4?"selected":""} >网络技术</option>
						<option value="5" ${contentById.channelId==5?"selected":""} >慢生活</option>
					</select>
				</p>
				<p>
					<input type="button" value="点击选着或上传一张封面图" onclick="openDialog()"/>
					<img id="img" src="${contentById.img}" value="${contentById.img}" />
				</p>
				<script id="ban" type="text/plain" style="width:1210px;height:150px"></script>
				<script id="ueditor" type="text/plain" style="width:1210px;height:150px">
					${contentById.content!=""?contentById.content:"编辑内容"}
				</script>
				<p class="addbtn"><a href="javascript:void(0)" onclick="saveContent()" ><c:if test="${empty contentById}">添加</c:if><c:if test="${not empty contentById}">修改</c:if>内容</a></p>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		var _editor = UE.getEditor("ban");
		
		_editor.ready(function () {
	        //设置编辑器不可用
	        //_editor.setDisabled();  这个地方要注意 一定要屏蔽
	        //隐藏编辑器，因为不会用到这个编辑器实例，所以要隐藏
	        _editor.hide();
	        //侦听图片上传
	        _editor.addListener('beforeinsertimage', function (t, arg) {
	            //将地址赋值给相应的input,只去第一张图片的路径
	            var imgs;
	            for(var a in arg){
	                imgs +=arg[a].src+',';
	            }
	           $("#img").attr("value", arg[0].src);
	            //图片预览
	           $("#img").attr("src", arg[0].src);
	        })

	    });
		var ue = UE.getEditor("ueditor");
		function openDialog(){
			_editor.getDialog("insertimage").open();
		}
		function saveContent(){
			var title = $("#title").val();
			var description = $("#description").val();
			var keywords = $("#keywords").val();
			var channelId = $("#channelId").val();
			var img = $("#img").attr("value");
			var author = $(".addcon").data("author");
			var content = ue.getContent();
			if(isEmpty(title)){
				layer.msg("请输入标题");
				$("#title").focus();
				return;
			}
			if(isEmpty(description)){
				layer.msg("请输入描述");
				$("#description").focus();
				return;
			}
			if(isEmpty(keywords)){
				layer.msg("请输入关键词");
				$("#keywords").focus();
				return;
			}
			if(isEmpty(channelId)){
				layer.msg("请选择栏目");
				$("#channelId").focus();
				return;
			}
			if(isEmpty(img)){
				layer.msg("请添加封面图片");
				openDialog();
				return;
			}
			if(isEmpty(content)){
				layer.msg("文章内容是不能少滴！");
				return;
			}
			var data = {
				"title":title,
				"description":description,
				"keywords":keywords,
				"channelId":channelId,
				"img":img,
				"author":author,
				"content":content
			}
			var id = $(".channel").data("cid");
			var method,con;
			if(isNotEmpty(id)){
				data.id = id;
				method = "updateCon";
				con = "修改";
			}else{
				method = "saveCon";
				con = "添加";
			}
			
			$.ajax({
				type:"post",
				url:'${adminPath}/content/'+method,
				data:data,
				success:function(data){
					data = data.trim();
					if(data == "success"){
						layer.msg(con+'内容成功');
					}else if(data == "fail"){
						layer.msg(con+'内容失败');
					}else{
						layer.msg("系统出错，请稍后再试！");
					}
				}
			});
		}
	</script>
 </body>
</html>