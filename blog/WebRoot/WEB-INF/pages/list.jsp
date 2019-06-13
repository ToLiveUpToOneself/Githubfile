<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@include file="/WEB-INF/pages/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
		<meta name="Author" content="" />
		<meta name="Keywords" content="" />
		<meta name="Description" content="" />
		<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0" />
		<title>文鹏个人博客</title>
		<link rel="stylesheet" href="${rPath}/css/list.css" />
		<%@include file="/WEB-INF/pages/common/common.jsp" %>
	</head>
	<body>
		<!--header start-->
		<c:import url="${basePath}/header" />
		<!--header end-->
		<!--content start-->
		<div id="content">
			<!--content left start-->
			<div class="left">
				<p class="con_h" data-cid="${contents[0].channelId}"><i></i>您当前所在位置 : <a href="javascript:void(0);">首页</a> / <a href="javascript:void(0);">${contents[0].channelName}</a></p>
				<div class="con">
					<ul>
						<c:forEach items="${contents}" var="content" >
							<li>
								<div class="c_div">
									<h3><a href="${basePath}/${content.staticLink}">${content.title}</a></h3>
									<div>
										<p class="list_img"><a href="javascript:void(0);"><img src="${content.img}" width="220" height="162" /></a></p>
										<p class="list_con">${content.description}<a href="${basePath}/${content.staticLink}" >阅读全文>></a></p>
									</div>
									<p class="list_b"><i class="fa fa-clock-o"></i>&nbsp;&nbsp;发表时间:<span>${wp:timeFormat(content.createTime)}【${wp:formatDate(content.createTime,"yyyy-MM-dd HH:mm:ss")}】</span>  |  <span><i class="fa fa-user"></i>&nbsp;&nbsp;作者:${content.author }</span>  |  <span>分类:<a href="javascript:void(0);">[${content.channelName }]</a></span></p>
									<div class="sanjiao"></div>
									<div class="arc"></div>
								</div>
							</li>
						</c:forEach>
						
					</ul>
				</div>
				
			</div>
			<!--content left end-->
			<!--content right start-->
			<%@include file="/WEB-INF/pages/common/right.jsp" %>
			<!--content right end-->
		</div>
		<script>window._bd_share_config={"common":{"bdSnsKey":{},"bdText":"","bdMini":"2","bdMiniList":false,"bdPic":"","bdStyle":"1","bdSize":"32"},"share":{},"image":{"viewList":["qzone","tsina","tqq","renren","weixin"],"viewText":"分享到：","viewSize":"16"}};with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];</script>					
		<script>
			clock.init("canvas_timer");
			var range = 50;             //距下边界长度/单位px
			var elemt = 500;           //插入元素高度/单位px
			var maxnum = 20;            //设置加载最多次数
			var num = 1;
			var totalheight = 0;
			var main = $(".con ul");                     //主体元素
			var flag = false;
			$(window).scroll(function(){
				var srollPos = $(window).scrollTop();    //滚动条距顶部距离(页面超出窗口的高度)

				//console.log("滚动条到顶部的垂直高度: "+$(document).scrollTop());
				//console.log("页面的文档高度 ："+$(document).height());
				//console.log('浏览器的高度：'+$(window).height());
	
				totalheight = parseFloat($(window).height()) + parseFloat(srollPos);
				if(!document.querySelector(".dataOver")){
					maxnum = 20;
				}
				if(($(document).height()-range) <= totalheight  && num != maxnum) {
					if(!flag){
						flag = true;
						var keyword = $("#keywords").val();
						var loading;
						$.ajax({
							type:"post",
							url:basePath+"/index/load",
							data:{
								pageNo : $(".con ul>li").size(),
								pageSize : 5,
								keyword:keyword,
								channelId:$(".con_h").data("cid")
							},
							beforeSend:function(){
								loading = layer.load($("#keywords"), {shade: false}); 
							},
							error:function(){
								layer.close(loading);
							},
							success:function(data){
								layer.close(loading);
								flag = false;
								if(data == ""){
									maxnum = 1;
									main.append("<div class='dataOver' style='font-size: 20px;text-align: center;line-height: 63px;'>没有更多数据可以加载了。。。。</div>");
								}else{
									
									var html = "";
									data.forEach(function(d){
										html += "<li>"+
										"								<div class='c_div'>"+
										"									<h3><a href='javascript:void(0);'>"+d.title+"</a></h3>"+
										"									<div>"+
										"										<p class='list_img'><a href='javascript:void(0);'><img src='"+basePath+"/resources/"+d.img+"'/></a></p>"+
										"										<p class='list_con'>"+d.description+"<a href='javascript:void(0);' >阅读全文>></a></p>"+
										"									</div>"+
										"									<p class='list_b'><i class='fa fa-clock-o'></i>&nbsp;&nbsp;发表时间:<span>"+d.createTime+"</span>  |  <span><i class='fa fa-user'></i>&nbsp;&nbsp;作者:"+d.author+"</span>  |  <span>分类:<a href='javascript:void(0);'>["+d.channelName+"]</a></span></p>"+
										"									<div class='sanjiao'></div>"+
										"									<div class='arc'></div>"+
										"								</div>"+
										"							</li>"
									});
									main.append(html);
								}
								
							}
						});
					}
				}
			});
			var content ={
				search:function(){
					var keyword = $("#keywords").val();
					
					var loading;
					$.ajax({
						type:"post",
						url:basePath+"/index/load",
						data:{
							pageNo : 0,
							pageSize : 5,
							keyword:keyword
						},
						beforeSend:function(){
							loading = layer.load($("#keywords"), {shade: false}); 
						},
						success:function(data){
							layer.close(loading);
							if(data == ""){
								layer.msg('不好意思、没有找到你想要的内容。。');
							}else{
								var html = "";
								data.forEach(function(d){
									html += "<li>"+
									"								<div class='c_div'>"+
									"									<h3><a href='javascript:void(0);'>"+d.title+"</a></h3>"+
									"									<div>"+
									"										<p class='list_img'><a href='javascript:void(0);'><img src='"+basePath+"/resources/"+d.img+"'/></a></p>"+
									"										<p class='list_con'>"+d.description+"<a href='javascript:void(0);' >阅读全文>></a></p>"+
									"									</div>"+
									"									<p class='list_b'><i class='fa fa-clock-o'></i>&nbsp;&nbsp;发表时间:<span>"+d.createTime+"</span>  |  <span><i class='fa fa-user'></i>&nbsp;&nbsp;作者:"+d.author+"</span>  |  <span>分类:<a href='javascript:void(0);'>["+d.channelName+"]</a></span></p>"+
									"									<div class='sanjiao'></div>"+
									"									<div class='arc'></div>"+
									"								</div>"+
									"							</li>"
								});
								main.html(html);
							}
							
						},
						error:function(){
							layer.close(loading);
						}
					});
				}		
			}
			$(function(){
				$("#backTop").click(function(){
					$("html,body").animate({
						scrollTop:0
					},1000)
				});
				$(window).scroll(function(){
					if($(window).scrollTop() >= 200) {
						$("#backTop").fadeIn(700);
					}else{
						$("#backTop").stop(true,true).fadeOut(1000); // 如果小于等于 200 淡出
					}
				});
			});
		</script>
	</body>
</html>

