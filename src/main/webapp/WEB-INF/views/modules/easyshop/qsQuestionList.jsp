<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>问卷管理</title>
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
		<li class="active"><a href="${ctx}/easyshop/qsQuestion/">问卷列表</a></li>
		<shiro:hasPermission name="easyshop:qsQuestion:edit"><li><a href="${ctx}/easyshop/qsQuestion/form">问卷添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="qsQuestion" action="${ctx}/easyshop/qsQuestion/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>标题：</label>
				<form:input path="title" htmlEscape="false" maxlength="100" class="input-medium"/>
			</li>
			<li><label>状态：</label>
				<form:select path="status" class="input-medium">
					<form:option value="" label="请选择发布状态"/>
					<form:options items="${fns:getDictList('question_status')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>标题</th>
				<th>状态</th>
				<th>更新时间</th>
				<shiro:hasPermission name="easyshop:qsQuestion:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="qsQuestion">
			<tr>
				<td><a href="${ctx}/easyshop/qsQuestion/form?id=${qsQuestion.id}">
					${qsQuestion.title}
				</a></td>
				<td>
					${fns:getDictLabel(qsQuestion.status, 'question_status', '无')}
				</td>
				<td><fmt:formatDate value="${qsQuestion.updateDate }" pattern="yyyy-MM-dd HH:mm:ss"/> </td>
				<shiro:hasPermission name="easyshop:qsQuestion:edit"><td>
    				<a href="${ctx}/easyshop/qsIssue/edit?questionId=${qsQuestion.id}">问题编辑</a>&nbsp;
    				<a href="/front/question/get?id=${qsQuestion.id}" target="_blank">查看问卷</a>&nbsp;
    				<a href="${ctx}/easyshop/qsQuestion/form?id=${qsQuestion.id}">编辑</a>&nbsp;
					<a href="${ctx}/easyshop/qsQuestion/delete?id=${qsQuestion.id}" onclick="return confirmx('确认要删除该问卷吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>