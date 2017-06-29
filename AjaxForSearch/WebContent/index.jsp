<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.0.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#tid").keyup(function() {
			/* 输入的不是空格在进行查找 */
			if($.trim($("#tid").val()).length!=0) {
				//进入该方法对内容进行清空
				$("#did").html("");
				$.ajax({
					type:"GET",
					url:"${pageContext.request.contextPath}/AjaxServlet",
					dataType:"json",
					data:"info="+$(tid).val(),
					success:function(msg) {
						if($(msg).length!=0) {
							//遍历返回的msg对象
							$(msg).each(function(index,ele) {
								//创建div标签
								var eDiv = document.createElement("div");
								//给标签添加信息
								$(eDiv).text(ele)
								//鼠标移动到上面事件
								$(eDiv).mouseover(function(){
									  $(eDiv).css("background-color","gray");
								});
								//鼠标移出事件
								$(eDiv).mouseout(function(){
									  $(eDiv).css("background-color","white");
								});
								//点击事件
								$(eDiv).click(function(){
									//将选中的内容放入到搜索框中
									$("#tid").val(ele);
									$("#did").hide();
								});
								//拼接标签
								$("#did").append($(eDiv));
								//展示信息框
								$("#did").show();
							});
						}else {
							$("#did").hide();
						}
					},
					error:function() {
						alert("失败了")
					}
				});
			}else {
				//隐藏信息框
				$("#did").hide();
			}
		});
		
	});
</script>
<title>Insert title here</title>
</head>
<body>
	<center>
		<div>
			<h1>度娘搜索</h1>
			<div>
				<input name="kw" id="tid"><input type="button" value="度娘一下">
			</div>
			<!-- 位置属性被设置为relative之后，是相对于前面的容器定位的。这个时候不能用top left在定位。应该用margin。
			它可以随窗口大小变化。但大小仍然不会变。要是你设置成width:100%;height:100%;这样就会随着窗口变大变小。 -->
			<div id="did" style="border: 1px solid black;width: 170px;position:relative; margin-right: 70px;display: none">
			</div>
		</div> 
	</center>
</body>
</html>