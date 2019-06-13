<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@include file="/WEB-INF/pages/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
		<meta name="Author" content="${content.author}" />
		<meta name="Keywords" content="${content.keywords}" />
		<meta name="Description" content="${content.description}" />
		<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0" />
		<title>${content.title}</title>
		<link rel="stylesheet" href="${rPath}/css/detail.css" />
		<%@include file="/WEB-INF/pages/common/common.jsp" %>
		<style>
			body{
				text-shadow: none;
			}
		</style>
	</head>
	<body>
		<!--header start-->
		<c:import url="${basePath}/header" />
		<!--header end-->
		<!--content start-->
		<div id="content" data-id="${content.id}">
			<!--content left start-->
			<div class="left">
				<p class="con_h"><i></i>您当前所在位置 : <a href="${basePath}">首页</a> / <a href="${basePath}/${content.channelId==2?'web':content.channelId==3?'java':content.channelId==4?'nt':content.channelId==5?'sl':''}">${content.channelId==2?'Web前端':content.channelId==3?'Java':content.channelId==4?'网络技术':content.channelId==5?'慢生活':''}</a> / <a href="javascript:void(0);"></a></p>
				<div class="con">
					<h2>${content.title}</h2>
					<div  class="detail">
						${content.content}
					</div>			
					<div class="con_f">
						<p>发布时间 : <span>${wp:formatDate(content.createTime,"yyyy-MM-dd HH:mm:ss")}</span>作者 : <span>${content.author }</span> 浏览量: <span class="hits">${content.hits}</span></p>
					</div>
				</div>
				<div class="con_wz">
					<div class="next">
						<span>快速导航：</span>								
						<p>上一篇 : <a href="${content.previousLink}">${content.previousTitle}</a></p>
						<p>下一篇 : <a href="${content.nextLink}">${content.nextTitle}</a></p>
					</div>
					<div class="like">
						<span>猜你喜欢：</span>
						<ul>
							<c:forEach items="${guessCon}" var="guess">
								<li><a href="${guess.staticLink }">${guess.title}</a></li>
							</c:forEach>
						</ul>
						<div class="clear" style="border:none;"></div>
					</div>
				</div>
				<!-- UY BEGIN -->
				<div id="uyan_frame"></div>
				<script type="text/javascript" src="http://v2.uyan.cc/code/uyan.js?uid=2136520"></script>
				<!-- UY END -->
			</div>
			<!--content left end-->
			<!--content right start-->
			<%@include file="/WEB-INF/pages/common/right.jsp" %>
			<!--content right end-->
		</div>
		<!-- content end-->
		<!-- footer -->
		<div id="footer">
			<p>CopyRight:2017 Design by wenp <a href="http://www.miitbeian.gov.cn" target="_blank">黔ICP备16001362号</a></p>
		</div>
		
		<script>window._bd_share_config={"common":{"bdSnsKey":{},"bdText":"","bdMini":"2","bdMiniList":false,"bdPic":"","bdStyle":"1","bdSize":"32"},"share":{},"image":{"viewList":["qzone","tsina","tqq","renren","weixin"],"viewText":"分享到：","viewSize":"16"}};with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];</script>			
		<script>
			clock.init("canvas_timer");
		</script>
		
		<!-- 显示代码高亮  start-->
		<script src="${basePath}/edit/ueditor.parse.js"></script>
		<script>
			setTimeout(function(){
				//高两部分的选择器
				uParse(".detail",{
					'highlightJsUrl':'${basePath}/edit/third-party/SyntaxHighlighter/shCore.js',
					'highlightCssUrl':'${basePath}/edit/third-party/SyntaxHighlighter/shCoreDefault.css'
				});
			},300);
			
			$(function(){
				
				var cid = $("#content").data("id");
				wpAjax.request({
					path:"${basePath}",
					model:"content",
					method:"queryHits",
					success:function(data){
						if(data != -1){
							$(".hits").text(data);
						}else{
							$(".hits").text("系统错误");
						}
						
					}
				},{"id":cid});
				if(sessionStorage.getItem("cid")){
					
				}else{
					sessionStorage.setItem("cid", cid);
					wpAjax.request({
						path:"${basePath}",
						model:"content",
						method:"saveHits",
						success:function(data){

						}
					},{"id":cid});
				}
				
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
		<!-- 显示代码高亮  end-->
	</body>
</html>
