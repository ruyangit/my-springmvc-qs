<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>商品 - 商家平台</title>
<meta name="decorator" content="default" />
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
		<li class="active"><a href="${ctx}/easyshop/goods/">商品列表</a></li>
	</ul>
	<form:form id="searchForm" modelAttribute="goods" action="${ctx}/easyshop/goods/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>商品货号：</label>
				<form:input path="goodsSn" htmlEscape="false" maxlength="60" class="input-medium"/>
			</li>
			<li><label>商品名称：</label>
				<form:input path="goodsName" htmlEscape="false" maxlength="120" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>缩略图</th>
				<th>商品名称</th>
				<th>唯一货号</th>
				<th>积分</th>
				<th>上架</th>
				<th>精品</th>
				<th>新品</th>
				<th>热销</th>
				<th>库存</th>
				<th>排序</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="goods">
			<tr>
				<td></td>
				<td>
				<a href="${ctx}/easyshop/goods/form?id=${goods.id}&category.id=${goods.category.id}">${goods.goodsName }</a>
				<div style="display: none">
    				<a href="${ctx}/easyshop/goods/form?id=${goods.id}">修改</a>
    				<a href="${ctx}/easyshop/goods/form?id=${goods.id}">预览</a>
					<a href="${ctx}/easyshop/goods/delete?id=${goods.id}" onclick="return confirmx('确认要删除该商品吗？', this.href)">删除</a>
				</div>
				</td>
				<td>${goods.goodsSn }</td>
				<td>${goods.integral }</td>
				<td>${goods.isOnSale }</td>
				<td>${goods.isBest }</td>
				<td>${goods.isNew }</td>
				<td>${goods.isHot }</td>
				<td>${goods.goodsNumber }</td>
				<td>${goods.storeSort }</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>