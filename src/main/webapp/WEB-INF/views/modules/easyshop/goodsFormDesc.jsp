<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>商品 - 商家平台</title>
<meta name="decorator" content="default" />
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
		<li><a href="${ctx}/easyshop/goods/form?id=${goods.id}&category.id=${goods.category.id}">商品信息${not empty goods.id?'修改':'添加'}</a></li>
		<li  class="active" ><a href="${ctx}/easyshop/goods/form?id=${goods.id}&viewName=goodsFormDesc">商品描述</a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="goods" action="${ctx}/easyshop/goods/save" method="post" class="form-horizontal">
		<input type="hidden" name="viewName" value="${viewName }">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label">商品关键字：</label>
			<div class="controls">
				<form:input path="keywords" htmlEscape="false" maxlength="255" class="input-xxlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">简单描述：</label>
			<div class="controls">
				<form:textarea path="goodsBrief" htmlEscape="false" rows="4" maxlength="255" class="input-xxlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">产品图片：</label>
			<div class="controls">
				<form:hidden id="goodsImg" path="goodsImg" htmlEscape="false" maxlength="255" class="input-xlarge"/>
				<sys:ckfinder input="goodsImg" type="images" uploadPath="/easyshop/goods" selectMultiple="false"/>
			</div>
		</div>
	
		<div class="control-group">
			<label class="control-label">详细描述：</label>
			<div class="controls">
				<form:textarea id="content" htmlEscape="true"  path="goodsDesc" rows="4" maxlength="200" class="input-xxlarge"/>
				<sys:ckeditor replace="content" uploadPath="/easyshop/goods" />
			</div>
		</div>
		
		
		<div class="form-actions">
			<input id="btnSubmit" class="btn btn-primary" type="submit" value="保存"/>&nbsp;
		</div>
	</form:form>
</body>
</html>