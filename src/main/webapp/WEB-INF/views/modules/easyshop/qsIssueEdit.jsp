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
		<li><a href="${ctx}/easyshop/qsQuestion/">问卷列表</a></li>
		<li><a href="${ctx}/easyshop/qsQuestion/form">问卷添加</a></li>
		<li class="active"><a href="${ctx}/easyshop/qsIssue/edit?questionId=${qsQuestion.id}">问题<shiro:hasPermission name="easyshop:qsIssue:edit">${not empty qsIssue.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="easyshop:qsIssue:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="qsIssue" action="${ctx}/easyshop/qsIssue/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<input type="hidden" name="questionId" value="${qsQuestion.id}">
		<sys:message content="${message}"/>
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
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
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
			    				<a href="${ctx}/easyshop/qsIssue/edit?id=${qsIssue.id}">修改</a>
								<a href="${ctx}/easyshop/qsIssue/delete?id=${qsIssue.id}" onclick="return confirmx('确认要删除该问题吗？', this.href)">删除</a>
							</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">题号：</label>
			<div class="controls">
				<form:input path="sort" htmlEscape="false" class="input-mini required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">问题：</label>
			<div class="controls">
				<form:input path="title" htmlEscape="false" maxlength="100" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">类型：</label>
			<div class="controls">
				<form:select path="questionType" class="input-mini required">
					<form:option value="" label="请选择"/>
					<form:options items="${fns:getDictList('question_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		
		<div style="display: none" id="type1">
			<div class="control-group">
				<label class="control-label">选项：</label>
				<div class="controls">
					<form:textarea path="options" htmlEscape="false" rows="4" maxlength="255" class="input-xxlarge required"/>
					<span class="help-inline"><font color="red">*</font> </span>
					<div id="dtip"><span class="help-inline">每个选项值以英文“,”号分割 </span></div>
				</div>
			</div>
		</div>
		<div style="display: none" id="type2">
			<div class="control-group">
				<label class="control-label">最多选项：</label>
				<div class="controls">
					<form:input path="maxAn" htmlEscape="false" class="input-xlarge"/>
				</div>
			</div>
		</div>
		
		
		<script type="text/javascript">
		function isshtx(value){
			//评分题处理
			if(value=='4'){
				$("#type1").show();
				$("#type2").hide();
				$("#type1 label.control-label").text("评分：");
				$("#type1 div#dtip").hide();
				$("#options").attr("rows","1");
				$("#options").css("width","80px");
			}else{
				$("#type1 label.control-label").text("选项：");
				$("#type1 div#dtip").show();
				$("#options").attr("rows","4");
				$("#options").removeAttr('style');
			}
			if(value=='1'){//文本题
				$("#type1").hide();
				$("#type2").hide();
			}else if(value=='2'){//单选
				$("#type1").show();
				$("#type2").hide();
			}else if(value=='3'){//复选题
				$("#type1").show();
				$("#type2").show();
			}
		}
		$("#questionType").on("change",function(){
			var value = $(this).val();
			isshtx(value)
			
		});
		var value = $("#questionType").val();
		if(value){
			isshtx(value)
		}
		</script>
		<div class="form-actions">
			<input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>