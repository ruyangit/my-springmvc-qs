<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>商品 - 商家平台</title>
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
			$("#btnSubmitNext").on("click",function(){
				//$("#viewName").val("goodsFormDesc");
				$("input[name='isOnSale']").eq(1).attr("checked",true);
				$("#inputForm").submit();
			});
		});
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/easyshop/goods/">商品列表</a></li>
		<li class="active"><a href="${ctx}/easyshop/goods/form">商品添加</a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="goods" action="${ctx}/easyshop/goods/save" method="post" class="form-horizontal">
		<input type="hidden" id="viewName" name="viewName">
		<form:hidden path="storeId"/>
		<form:hidden path="category.id"/>
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label">商品的名称：</label>
			<div class="controls">
				<form:input path="goodsName" htmlEscape="false" maxlength="120" class="input-xxlarge measure-input  required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">商品库存数量：</label>
			<div class="controls">
				<form:input path="goodsNumber" htmlEscape="false" maxlength="5" class="input-mini required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">商品报警数量：</label>
			<div class="controls">
				<form:input path="warnNumber" htmlEscape="false" maxlength="3" class="input-mini required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">兑换积分数：</label>
			<div class="controls">
				<form:input path="integral" htmlEscape="false" maxlength="11" class="input-mini required"/>
				<span class="help-inline"><font color="red">*</font> </span>
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
		
		<div class="control-group">
			<label class="control-label">是否上架：</label>
			<div class="controls">
				<form:radiobuttons path="isOnSale" items="${fns:getDictList('yes_no')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
			</div>
		</div>
		
		<div class="control-group">
			<label class="control-label">排序：</label>
			<div class="controls">
				<form:input path="sort" htmlEscape="false" maxlength="11" class="input-mini"/>
			</div>
		</div>
		
		<div class="form-actions">
			<c:if test="${empty goods.id }">
			<input id="btnSubmit" class="btn btn-inverse" type="submit" value="直接发布"/>&nbsp;
			<input id="btnSubmitNext" class="btn btn-primary" type="button" value="临时保存"/>&nbsp;
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
			</c:if>
			<c:if test="${not empty goods.id }">
			<input id="btnSubmit" class="btn btn-primary" type="submit" value="保存"/>&nbsp;
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
			</c:if>
		</div>
	</form:form>
</body>
</html>