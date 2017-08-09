<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./taglib.jsp"%>
<html>
<head>
<meta name="decorator" content="front_default" />
<title>问答</title>
<link href="${ctxStatic}/raty/jquery.raty.css"  type="text/css">
<script src="${ctxStatic}/raty/jquery.raty.js"></script>
<style type="text/css">
.content{
margin-bottom: 50px;
}
</style>

</head>
<body>
	<div class="page">
		<c:if test="${not empty message}">
			<script type="text/javascript">
				alert('${message}');
				location.href='${ctx}/question?id=${questionId}';
			</script>
		</c:if>
		<header class="bar bar-nav">
				<h1 class="title">${qsQuestion.title}</h1>
			</header>
		<div class="content">
			<form action="${ctx }/answer/save" method="post" id="myform">
			<input type="hidden" name="questionId" value="${qsQuestion.id}">
			<c:forEach items="${qsIssueList }" var="item" varStatus="i">
				<div class="card">
					<div class="card-header">${item.title}
					<c:if test="${item.questionType==3 && item.maxAn>0}">
					（最多选择${item.maxAn }个答案）
					</c:if>
					</div>
					
					<div class="card-content">
						<div class="card-content-inner">
							<c:choose>
								<c:when test="${item.questionType==1 }">
									<textarea style="width: 100%;height: 80px;border: 0px;" name="name${i.index+1 }"></textarea>
								</c:when>
								<c:when test="${item.questionType==2 }">
									<div id="questionType${i.index+1 }"></div>
									<script type="text/javascript">
										var options = '${item.options}'.split(',');
										var html="";
										$.each(options,function(i,e){
											html+='<div><label><input type="radio" name="name${i.index+1 }" value="'+i+'">&nbsp;'+e+'</label></div>';
										})
										$("#questionType${i.index+1 }").html(html);
									</script>
									
								</c:when>
								<c:when test="${item.questionType==3 }">
									<div id="questionType${i.index+1 }"></div>
									<script type="text/javascript">
										var options = '${item.options}'.split(',');
										var html="";
										$.each(options,function(i,e){
											html+='<div><label><input type="checkbox" name="name${i.index+1 }" value="'+i+'">&nbsp;'+e+'</label></div>';
										})
										$("#questionType${i.index+1 }").html(html);
										
										$("#questionType${i.index+1 } input[type=checkbox]").on("click",function(){
											if($("#questionType${i.index+1 } input[type=checkbox]:checked").length>3){
												$.toast('最多选择${item.maxAn }个答案')
												$(this).prop("checked",false);
											}
										})
									</script>
								</c:when>
								<c:when test="${item.questionType==4 }">
									<div id="ratyScore${i.index+1 }" data-score="0" data-number="${item.options}"></div>
									<script type="text/javascript">
									$('#ratyScore${i.index+1 }').raty({
											path:'${ctxStatic}/raty/images',
											scoreName: 'name${i.index+1 }',
										  score: function() {
										    return $(this).attr('data-score');
										  },
										  number: function() {
										    return $(this).attr('data-number');
										  }
										});
									</script>
									
								</c:when>
							</c:choose>
						</div>
					</div>
					
					<!-- <div class="card-footer">卡脚</div> -->
				</div>
			</c:forEach>
			</form>
		</div>
		<nav class="bar bar-tab">
			<a href="#" class="tab-item external active" id="submitBtn">提交问卷调查</a>
		</nav>
		
	</div>
	<script type="text/javascript">
	$(function(){
		$("#submitBtn").on("click",function(){
			$.toast('你还未完成所有题目')
			$("#myform").submit();
		})
	})
	</script>
</body>
</html>