<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<div class="right">
	
	<div class="search">
		<div class="timer">
			<canvas id="canvas_timer" width="300" height="300" style="margin: 14px;"></canvas>
		</div>
		<input type="search" name="" id="keywords" value="" placeholder="请输入关键词" />
		<a href="javascript:content.search();">Search</a>
	</div>
	<div class="card">
		<h3>About Me</h3>
		<p>网名：只是这样而已丶</p>
		<p>QQ：xxxxxxxxxx</p>
		<p>Email：xxxxxxxxxx</p>
		<p class="c_last">我走得很慢,但我从不后退!</p>
	</div>
	<c:if test="${not empty push}">
	<div class="tuijian">
		<h3>推荐<span>文章</span></h3>
		<ul>
			<c:forEach items="${push}" var="pc" varStatus="index">
				<li><span>${index.count}</span><a href="${basePath}/${pc.staticLink}">${pc.title}</a></li>
			</c:forEach>
		</ul>	
	</div>
	</c:if>
	<c:if test="${not empty newContent}">
	<div class="new">
		<h3>最新<span style="color:green;">文章</span></h3>
		<ul>
			<c:forEach items="${newContent}" var="nc">
				<li><a href="${basePath}/${nc.staticLink}">${nc.title}</a></li>
			</c:forEach>
		</ul>	
	</div>
	</c:if>
	<div class="share">
		<div class="bdsharebuttonbox"><a href="#" class="bds_more" data-cmd="more"></a><a href="#" class="bds_qzone" data-cmd="qzone" title="分享到QQ空间"></a><a href="#" class="bds_tsina" data-cmd="tsina" title="分享到新浪微博"></a><a href="#" class="bds_tqq" data-cmd="tqq" title="分享到腾讯微博"></a><a href="#" class="bds_renren" data-cmd="renren" title="分享到人人网"></a><a href="#" class="bds_weixin" data-cmd="weixin" title="分享到微信"></a></div>					
	</div>
	<div class="music">
		<embed src="http://www.xiami.com/widget/141555684_177561,1770478681,1771173930,1774662958,1769190585,2103991,_340_346_cccccc_dddddd_0/multiPlayer.swf" type="application/x-shockwave-flash" width="340" height="346" wmode="opaque"></embed>
	</div>
</div>