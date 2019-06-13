<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@include file="/WEB-INF/pages/common/taglib.jsp"%>
<c:forEach items="${contents}" varStatus="contentindex"  var="content">
	<div class="con">
		<c:if test="${contentindex.index==0}">
				<input type="hidden" id="itemCount" value="${itemCount}" />
		</c:if>
		<c:if test="${not empty content.staticLink}">
			<h3><a href="${content.staticLink}" target="_blank">${content.title}</a></h3>
			<div class="con_text">
				<a href="${content.staticLink}" class="img_btn"><img src="${content.img}" alt="" /></a>
				<p>${content.description}<a href="${content.staticLink}" target="_blank" class="read_btn">阅读全文>></a></p>
			</div>
		</c:if>
		
		<c:if test="${empty content.staticLink}">
			<h3><a href="${basePath}/content/html/${content.id}/${content.channelId}" target="_blank">${content.title}</a></h3>
			<div class="con_text">
				<a href="${content.staticLink}" class="img_btn"><img src="${content.img}" alt="" /></a>
				<p>${content.description}<a href="${basePath}/content/html/${content.id}/${content.channelId}" target="_blank" class="read_btn">阅读全文>></a></p>
			</div>
		</c:if>
		
		<div class="clear"></div>
		<div class="c_botton"><p><i class="fa fa-clock-o"></i>&nbsp;&nbsp;发表时间:<span>${wp:timeFormat(content.createTime)}【${wp:formatDate(content.createTime,"yyyy-MM-dd HH:mm:ss")}】</span></p>  | <p><i class="fa fa-user"></i>&nbsp;&nbsp;作者:<span>${content.author}</span></p>  |  <p>分类:<span><a href="list.html">[${content.channelName }]</a></span></p></div>
	</div>
</c:forEach>
