<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@include file="/WEB-INF/pages/common/taglib.jsp" %>
<!DOCTYPE HTML>
<html>
<head>
	<title>后内容管理系统-登陆</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<%@include file="/WEB-INF/pages/admin/common/common.jsp" %>
 	<style>

        .large-header{
            overflow: hidden;
            background-size: cover;
            position: absolute;
            top: 0px;
            left: 0px;
            width: 100%;
            height: 100%;
            z-index: -1;
            display: block;
        }
        .login{
            width: 98%;
            text-align: center;
            position: absolute;
            top:35%;
        }
        .l_p{
            margin: -1px;
        }
        .l_p:last-child{
            margin-top:20px;
        }
        .l_p input{
            width: 280px;
            height: 36px;
            outline: none;
            background: rgba(1, 1, 1,0.6);
            border: 1px solid #32231e;
            color: #fff;
            text-indent: 10px;
        }
        .l_p a{
            display: inline-block;
            width: 280px;
            height: 34px;
            background: rgba(1, 1, 1,0.6);
            border: 1px solid #32231e;
            color: #e5e5e5;
            line-height: 34px;
            text-decoration: none;
            border-radius: 5px;
        }
		.reg{
			    margin-left: 215px;
				color: #000;
				text-decoration: none;
				transition:1s all ease;
		}
		.reg:hover{
			color:#666;
			transition:1s all ease;
		}
		input:-webkit-autofill {
			-webkit-box-shadow: 0 0 0px 1000px white inset !important;
			-webkit-text-fill-color: #333;
		}
		h1{
			font-size:24px;
			margin:10px;
			padding:10px;
		}
    </style>
</head>
<body>
<div class="container">
    <div class="content">
        <div id="large-header" class="large-header" style="background: url('${rPath}/images/1.jpg');">
            <canvas id="demo-canvas"></canvas>
        </div>
        <div class="login">
            <h1>后台内容管理系统</h1>
            <form action="">
                <p class="l_p"><input type="text" id="username" value="Nszwxiaop" name="username" placeholder="用户名/邮箱/手机" /></p>
                <p class="l_p"><input type="password" id="password" value="123456" name="password" placeholder="请输入密码"/></p>
                <p class="l_p" style="display:none;position:relative" id="kcode"><input type="text" id="code" maxlength="4" name="code" placeholder="请输入验证码"/><img onclick="this.src=basePath+'/kaptcha/code?d='+new Date().getTime();" style="cursor:pointer;position: absolute;top:1px;margin-left: -92px;"/></p>
                <p class="l_p" style=" margin-top:20px;"><a href="javascript:void(0)" onclick="login()">登录</a></p>
            </form>
        </div>
    </div>
</div>
<script src="${rPath}/js/login.js"></script>
<script src="${rPath}/js/ec.js"></script>
<script >
	$(function(){
		var indexNum = sessionStorage.getItem("wp_blog_codeNum");
		if(indexNum >= 3){
			$("#kcode").show();
			$("#kcode img").attr("src",basePath+"/kaptcha/code");
		}
		$(document).keydown(function(e){
			if(e.keyCode==13){
				login();
			}
		});
	});
	var index = 0;
	function login(){
		var username = $("#username").val();
		var password = $("#password").val();
		var codeNum = $("#code").val();
  		var codeMark = $("#kcode").is(":hidden");
		if(isEmpty(username)){
  			layer.msg("请输入用户名",{time: 2000, icon:5});
  			$("#username").focus();
  			return;
  		}
  		if(isEmpty(password)){
  			layer.msg("请输入密码",{time: 2000, icon:5});
  			$("#username").focus();
  			return;
  		}
  		index++;
  		if(index > 2){
			$("#kcode").show();
			$("#kcode").attr("src",basePath+"/kaptcha/code");
			sessionStorage.setItem("wp_blog_codeNum", index);
  		}
  		if(!codeMark){
  			if(isEmpty(codeNum)){
	  			layer.msg("请输入验证码",{time: 2000, icon:5});
	  			$("#code img").focus();
	  			return;
	  		}
  		}
		var data = {password:b64_md5(password),code:codeNum};
		if(isEmail(username)){
			data.email = username;
		}else if(isPhone(username)){
			data.telephone = username;
		}else{
			data.username = username;
		}
		wpAjax.request({
			path: adminPath,
			method: "logined",
			success: function(data){
				if(data=="forbided"){
					layer.alert('您的账号已被禁止、请联系管理员进行处理！', {
					  skin: 'layui-layer-molv' //样式类名
					  ,closeBtn: 0
					});
				}else if(data == "fail"){
					layer.alert('你输入的密码或账号有误、请重新输入', {
					  skin: 'layui-layer-molv' //样式类名
					  ,closeBtn: 0
					});
					$("#password").val("");
					$("#password").focus();
				}else if(data == "error"){
					layer.alert('请输入账号或密码！', {
					  skin: 'layui-layer-molv' //样式类名
					  ,closeBtn: 0
					});
				}else if(data == "code_error"){
					layer.alert('验证码输入错误', {
						  skin: 'layui-layer-molv' //样式类名
						  ,closeBtn: 0
						});
					$("#kcode").val("");
					$("#kcode").focus();
				}else{
					var refer = document.referrer;
  					sessionStorage.removeItem("wp_blog_codeNum");
  					if(refer.endsWith("nopermission.jsp") || refer.endsWith("login")){
  						window.location.href = adminPath+"/index";
  					}else{
	  					//登陆成功
	  					window.location.href = isNotEmpty(refer) ? refer: adminPath+"/index";
  					}
				}
			}
		},data)
	}
</script>
</body>
</html>