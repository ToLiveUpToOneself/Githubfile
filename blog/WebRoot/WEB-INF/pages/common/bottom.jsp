<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- content end-->
<div id="backTop" class="fa fa-angle-double-up"></div>
<!-- footer -->
<div id="footer">
	<c:if test="${not empty links}">
		<div class="f_link">
			<span>友情链接：</span>
			<ul>
				<c:forEach items="${links}" var="link">
					<li><a href="${link.link}" target="_blank" >${link.name}</a></li>
				</c:forEach>
			</ul>
		</div>
	</c:if>
	
	<p>CopyRight:2017 Design by wenp <a href="http://www.miitbeian.gov.cn" target="_blank">黔ICP备16001362号</a></p>
</div>