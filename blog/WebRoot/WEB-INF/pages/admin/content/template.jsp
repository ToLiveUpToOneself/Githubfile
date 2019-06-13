<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@include file="/WEB-INF/pages/common/taglib.jsp"%>
<c:forEach items="${contents}" varStatus="contentindex" var="content">
	<tr>
		<td>${content.id} <c:if test="${contentindex.index==0}">
				<input type="hidden" id="itemCount" value="${itemCount}" />
			</c:if>
		</td>
		<td class="keys" style="white-space: nowrap;text-overflow: ellipsis;overflow: hidden;max-width:600px;">${content.title}</td>
		<td>${content.channelName}</td>
		<td>${content.author}</td>
		<td class="tmui-tips" data-tip="${wp:formatDate(content.createTime,'yyyy-MM-dd mm:hh:ss')}">${wp:timeFormat(content.createTime)}</td>
		<td>
			<wp:if test="${content.isTop==1}">
				<wp:then><a href="javascript:void(0)" class="green" data-mark="isTop" data-opid="${content.id}" data-val="0" onclick="wpAdmin.op(this)" >置顶</a></wp:then>
				<wp:else><a href="javascript:void(0)" class="red" data-mark="isTop" data-opid="${content.id}" data-val="1" onclick="wpAdmin.op(this);" >未置顶</a></wp:else>
			</wp:if>
		</td>
		<td>
			<wp:if test="${content.push==1}">
				<wp:then><a href="javascript:void(0)" class="green" data-mark="push" data-opid="${content.id}" data-val="0" onclick="wpAdmin.op(this)" >是</a></wp:then>
				<wp:else><a href="javascript:void(0)" class="red" data-mark="push" data-opid="${content.id}" data-val="1" onclick="wpAdmin.op(this)" >否</a></wp:else>
			</wp:if>
		</td>
		<td>
			<wp:if test="${content.isDelete==0}">
				<wp:then><a href="javascript:void(0)" class="green" data-mark="isDelete" data-opid="${content.id}" data-val="1" onclick="wpAdmin.op(this)" >未删除</a></wp:then>
				<wp:else><a href="javascript:void(0)" class="red" data-mark="isDelete" data-opid="${content.id}" data-val="0" onclick="wpAdmin.op(this)" >删除</a></wp:else>
			</wp:if>
		</td>
		<td>
			<wp:if test="${content.isComment==1}">
				<wp:then><a href="javascript:void(0)" class="green" data-mark="isComment" data-opid="${content.id}" data-val="0" onclick="wpAdmin.op(this)" >允许</a></wp:then>
				<wp:else><a href="javascript:void(0)" class="red" data-mark="isComment" data-opid="${content.id}" data-val="1" onclick="wpAdmin.op(this)" >不允许</a></wp:else>
			</wp:if>
		</td>
		<td>
			<wp:if test="${content.status==1}">
				<wp:then><a href="javascript:void(0)" class="green" data-mark="status" data-opid="${content.id}" data-val="0" onclick="wpAdmin.op(this)" >发布</a></wp:then>
				<wp:else><a href="javascript:void(0)" class="red" data-mark="status" data-opid="${content.id}" data-val="1" onclick="wpAdmin.op(this)" >未发布</a></wp:else>
			</wp:if>
		</td>
		<td><a href="javascript:void(0);" onclick="wpAdmin.staticHtml(this)" data-opid="${content.id}" data-cid="${content.channelId}" >静态化</a>  <a href="${adminPath}/content/add?id=${content.id}" data-opid="${content.id}"  >修改</a></td>
	</tr>
</c:forEach>