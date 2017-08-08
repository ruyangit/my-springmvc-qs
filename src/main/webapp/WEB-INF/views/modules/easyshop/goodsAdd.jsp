<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>商品 - 商家平台</title>
<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#category").on("change",function(){
				if($(this).val()==''){
					$("#btnSubmit").attr("disabled",true);
				}else{
					$("#btnSubmit").attr("disabled",false);
				}
			});
			
			$("#btnSubmit").on("click",function(){
				location.href="${ctx}/easyshop/goods/form?category.id="+$("#category").val();
			});
			
			if($("#category").val()==''){
				$("#btnSubmit").attr("disabled",true);
			}
		});
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="javascript:;">选择商品分类</a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="goods" action="" method="get" class="form-horizontal">
		<div class="control-group">
			<label class="control-label">平台商品分类：</label>
			<div class="controls">
			 	<form:select path="category" cssClass="input-xlarge required">
			 		<form:option value="" label="请选择一个分类"></form:option>
			 		<form:options items="${categoryList }" itemLabel="catStructName" itemValue="id"/>
			 	</form:select>
			</div>
		</div>
		<div class="form-actions">
			<input id="btnSubmit" class="btn btn-primary" type="button" value="下一步" />
		</div>
	</form:form>
</body>
</html>