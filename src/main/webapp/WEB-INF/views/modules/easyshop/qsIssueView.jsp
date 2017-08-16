<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>问题管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			//$("#name").focus();
			$("#inputForm").validate({
				submitHandler: function(form){
					loading('正在提交，请稍等...');
					form.submit();
				},
				errorContainer: "#messageBox",
				errorPlacement: function(error, element) {
					$("#messageBox").text("输入有误，请先更正。");
					if (element.is(":checkbox")||element.is(":radio")||element.parent().is(".input-append")){
						error.appendTo(element.parent().parent());
					} else {
						error.insertAfter(element);
					}
				}
			});
		});
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/easyshop/user/">会员列表</a></li>
		<li><a href="${ctx}/easyshop/user/form">会员添加</a></li>
		<li class="active"><a href="${ctx}/easyshop/qsIssue/view?userId=${userId}&sn=${sn}">问卷答案</a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="qsIssue" action="" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>
		<div class="control-group">
			<label class="control-label">订单编号：</label>
			<div class="controls">
				<span>${sn }</span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">问卷标题：</label>
			<div class="controls">
				<span>${qsQuestion.title }</span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">问题列表：</label>
			<div class="controls">
				<table id="contentTable" class="table table-striped table-bordered table-condensed">
					<thead>
						<tr>
							<th>题号</th>
							<th>问题</th>
							<th>类型</th>
							<th>选项</th>
							<th>答案</th>
						</tr>
					</thead>
					<tbody>
					<c:if test="${not empty qsIssueList }">
					<c:forEach items="${qsIssueList}" var="qsIssue"  varStatus="i">
						<tr>
							<td>
								Q${qsIssue.sort}、
							</td>
							<td>
								${qsIssue.title}
							</td>
							<td>
								${fns:getDictLabel(qsIssue.questionType, 'question_type', '无')}
							</td>
							<td>
								${qsIssue.options}
							</td>
							<td>
			    				${qsIssue.value}
							</td>
						</tr>
					</c:forEach>
					</c:if>
					<c:if test="${empty qsIssueList }">
					<tr>
							<td colspan="5">
								未完成问卷调查
							</td>
						</tr>
					</c:if>
					</tbody>
				</table>
			</div>
		</div>
	</form:form>
</body>
</html>