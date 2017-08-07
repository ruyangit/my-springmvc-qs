<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>商品分类管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#name").focus();
			$("#inputForm").validate({
				submitHandler: function(form){
					loading('正在提交，请稍等...');
					form.submit();
				},
				errorContainer: "#messageBox",
				errorPlacement: function(error, element) {
					$("#messageBox").text("输入有误，请先更正。");
					if (element.is(":checkbox") || element.is(":radio") || element.parent().is(".input-append")){
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
		<li><a href="${ctx}/easyshop/category/">商品分类列表</a></li>
		<li class="active"><a href="${ctx}/easyshop/category/form?id=${category.id}&parent.id=${categoryparent.id}">商品分类<shiro:hasPermission name="easyshop:category:edit">${not empty category.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="easyshop:category:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="category" action="${ctx}/easyshop/category/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label">分类名称：</label>
			<div class="controls">
				<form:input path="catName" htmlEscape="false" maxlength="90" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">中文名称分类结构：</label>
			<div class="controls">
				<form:input path="catStructName" htmlEscape="false" maxlength="255" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">分类图片：</label>
			<div class="controls">
				<form:input path="categoryImg" htmlEscape="false" maxlength="255" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">分类的关键字,可能是为了搜索：</label>
			<div class="controls">
				<form:input path="keywords" htmlEscape="false" maxlength="255" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">层级：</label>
			<div class="controls">
				<form:input path="catLevel" htmlEscape="false" maxlength="11" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">分类描述：</label>
			<div class="controls">
				<form:input path="catDesc" htmlEscape="false" maxlength="255" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">上级该分类的父类ID,取值于该表的id字段:</label>
			<div class="controls">
				<sys:treeselect id="parent" name="parent.id" value="${category.parent.id}" labelName="parent.name" labelValue="${category.parent.name}"
					title="该分类的父类ID,取值于该表的id字段" url="/easyshop/category/treeData" extId="${category.id}" cssClass="" allowClear="true"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">不确定字段,按名和表设计猜,应该是该分类的单独模板文件的名字：</label>
			<div class="controls">
				<form:input path="templateFile" htmlEscape="false" maxlength="50" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">该分类的计量单位：</label>
			<div class="controls">
				<form:input path="measureUnit" htmlEscape="false" maxlength="15" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">该分类的单独的样式表的包括文件部分的文件路径：</label>
			<div class="controls">
				<form:input path="style" htmlEscape="false" maxlength="150" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">该分类的最高和最低价之间的价格分级,当大于1时,会根据最大最小价格区间分成区间,会在页面显示价格范围,如0-300,300-600,600-900这种;：</label>
			<div class="controls">
				<form:input path="grade" htmlEscape="false" maxlength="1" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">如果该字段有值,则该分类将还会按照该值对应在表goods_attr的goods_attr_id所对应的属性筛选，如，封面颜色下有红，黑分类筛选：</label>
			<div class="controls">
				<form:input path="filterAttr" htmlEscape="false" maxlength="255" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">是否在前台页面显示1显示;0不显示：</label>
			<div class="controls">
				<form:input path="isShow" htmlEscape="false" maxlength="1" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">排序号码：</label>
			<div class="controls">
				<form:input path="sort" htmlEscape="false" maxlength="11" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">备注信息：</label>
			<div class="controls">
				<form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="255" class="input-xxlarge "/>
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="easyshop:category:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>