<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>商品品牌信息管理</title>
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
		<li class="active"><a href="${ctx}/easyshop/brand/">品牌列表</a></li>
		<shiro:hasPermission name="easyshop:brand:edit"><li><a href="${ctx}/easyshop/brand/form">品牌添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="brand" action="${ctx}/easyshop/brand/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>品牌名称：</label>
				<form:input path="brandName" htmlEscape="false" maxlength="60" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>品牌LOGO</th>
				<th>品牌名称</th>
				<th>品牌网址</th>
				<th>品牌描述</th>
				<th>排序</th>
				<th>是否显示</th>
				<shiro:hasPermission name="easyshop:brand:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="brand">
			<tr>
				<td>
					<img alt="" src="${brand.brandLogo}" width="80" height="80">
				</td>
				<td>${brand.brandName}</td>
				<td>${brand.siteUrl}</td>
				<td>${brand.brandDesc}</td>
				<td>${brand.sort}</td>
				<td>${brand.isShow}</td>
				<shiro:hasPermission name="easyshop:brand:edit"><td>
    				<a href="${ctx}/easyshop/brand/form?id=${brand.id}">修改</a>
					<a href="${ctx}/easyshop/brand/delete?id=${brand.id}" onclick="return confirmx('确认要删除该商品品牌信息吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>