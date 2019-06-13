<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@include file="/WEB-INF/pages/common/taglib.jsp"%>
<c:forEach items="${permissions}" varStatus="permissionindex" var="permission">
	<tr>
		<td>${permission.id} <c:if test="${permissionindex.index==0}">
				<input type="hidden" id="itemCount" value="${itemCount}" />
			</c:if>
		</td>
		<td>${permission.title}</td>
		<td class="tmui-tips"
			tip="${wp:formatDate(permission.createTime,'yyyy-MM-dd mm:hh:ss')}">
			${wp:timeFormat(permission.createTime)}</td>
		<td>
			<wp:if test="${permission.isDelete==1}">
				<wp:then><a href="javascript:void(0)" class="green" data-mark="isDelete" data-opid="${permission.id}" data-val="0" onclick="wpAdmin.op(this)" >未删除</a></wp:then>
				<wp:else><a href="javascript:void(0)" class="red" data-mark="isDelete" data-opid="${permission.id}" data-val="1" onclick="wpAdmin.op(this)" >删除</a></wp:else>
			</wp:if>
		</td>
		<td><a href="javascript:void(0);">未删除</a></td>
	</tr>
</c:forEach>

