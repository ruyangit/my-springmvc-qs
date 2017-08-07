<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>会员信息管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			
		});
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/easyshop/user/">会员信息列表</a></li>
		<shiro:hasPermission name="easyshop:user:edit"><li><a href="${ctx}/easyshop/user/form">会员信息添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="user" action="${ctx}/easyshop/user/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>姓名：</label>
				<form:input path="name" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li><label>登录名称：</label>
				<form:input path="username" htmlEscape="false" maxlength="255" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>姓名</th>
				<th>性别0：未知1：男2：女</th>
				<th>微信</th>
				<th>QQ</th>
				<th>电话</th>
				<th>更新时间</th>
				<th>登录名称</th>
				<th>integral</th>
				<shiro:hasPermission name="easyshop:user:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="user">
			<tr>
				<td><a href="${ctx}/easyshop/user/form?id=${user.id}">
					${user.name}
				</a></td>
				<td>
					${user.gender}
				</td>
				<td>
					${user.wechat}
				</td>
				<td>
					${user.qq}
				</td>
				<td>
					${user.phone}
				</td>
				<td>
					<fmt:formatDate value="${user.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${user.username}
				</td>
				<td>
					${user.integral}
				</td>
				<shiro:hasPermission name="easyshop:user:edit"><td>
    				<a href="${ctx}/easyshop/user/form?id=${user.id}">修改</a>
					<a href="${ctx}/easyshop/user/delete?id=${user.id}" onclick="return confirmx('确认要删除该会员信息吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>