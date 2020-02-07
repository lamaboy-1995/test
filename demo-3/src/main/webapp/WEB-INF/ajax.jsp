<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>您好Springboot</title>

<script type="text/javascript" src="/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		   $(".input-group-btn")
		   .on("click",".btn-update",doLoadEditUI)
		   .on("click",".btn-delete",doDeleteObjects);
		  
	});
	
	function doDeleteObjects(){
		//alert("doDeleteObjects()")
		var id = document.getElementById("td_id").innerHTML;
		alert("id="+id)
		if(!confirm("确认删除吗"))
			return;
		var url = "/deleteUser";
		var params = {"id":id.toString()};
		alert("参数："+params);
		//console.log(JSON.stringify(id));
		$.post(url,params,function(result){
			alert("异步请求");
		});
	};

	function doLoadEditUI() {
		//alert("doLoadEditUI()")
		/* var url = "/doLoadEditUI"
		$("#mainContentId").load(url, function() {
			$(".input-group-btn").html();
		}) */
		$("#body1").load("/doLoadEditUI");
	};

	
	$(function() {
		//alert("ajax加载成功！")
		$.get("/findAjaxUser", function(result) {
			//alert("方法正确返回");
			if (result.status == 200) {
				addTr(result.data);
				//alert(result.msg);
			} else {
				alert(result.msg)
			}
		});
	})

	//data: [user1,user2,user3,user4]
	function addTr(data) {

		var trs = "";
		//遍历返回值结果
		$(data)
				.each(
						function(index, user) {
							//动态获取每一个user JS对象
							//var user = data[index];
							var id = user.id;
							var name = user.name;
							var age = user.age;
							var sex = user.sex;
							trs += "<tr align='center' class='input-group-btn'>"
									+ "<td id='td_id'>"+ id+ "</td>"
									+ "<td>"+ name+ "</td>"
									+ "<td>"+ age+ "</td>"
									+ "<td>"+ sex+ "</td>"
									+ "<td>"+ "<button type='button' class='btn btn-default btn-update'>修改</button>"
											+ "<button type='button' class='btn btn-default btn-delete'>删除</button>"
									+ "</td>" 
									+ "</tr>";

						});

		//将tr标签追加到table中
		$("#tab1").append(trs);
	}
</script>
</head>
<body id="body1">
	<table id="tab1" class='input-group-btn' border="1px" width="65%" align="center">
		<tr>
			<td colspan="6" align="center"><h3>学生信息</h3></td>
		</tr>
		<tr>
			<th>编号</th>
			<th>姓名</th>
			<th>年龄</th>
			<th>性别</th>
			<th>操作</th>
		</tr>
	</table>
</body>
</html>