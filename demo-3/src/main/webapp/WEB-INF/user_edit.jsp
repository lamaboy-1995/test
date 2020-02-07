<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		   $(".box-footer")
		   .on("click",".btn-cancel",doCancel)
		   .on("click",".btn-save",doSave);
	});

	function doCancel() {
		//alert("doCancel");
		$("#div1").load("/ajax");
	};
	function doSave(){
		alert("保存。。。")
		 //1.params
		 var rowData=$("#mainContentId").data("rowData");
		 var params=doGetEditFormData();
		 if(rowData){
		    params.id=rowData.user.id;
		 }
		 //1.url
		 var insertUrl="user/doSaveObject";
		 var updateUrl="user/doUpdateObject";
		 var url=rowData?updateUrl:insertUrl;
		 //2.获取表单数据
		 //3.发起异步请求
		 $.post(url,params,function(result){
			 if(result.state==1){
				 alert(result.message);
				 doCancel();
			 }else{
				 alert(result.message);
			 }
		 })
	 }
</script>
</head>
<body>
<div id="div1">
	<div class="form-group" align="center">
		<h1>修改</h1>
		<table>
			<tr>
				<td>姓名:</td>
				<td><input type="text" name="username" /></td>
			</tr>
			<tr>
				<td>年龄:</td>
				<td><input type="text" name="age" /></td>
			</tr>
			<tr>
				<td>性别:</td>
				<td><input type="text" name="sex" /></td>
			</tr>
		</table>
	</div>
	<br/>
	<div class="box-footer" align="center">
		<button type="button" class="btn-cancel">返回</button>
          <button type="button" class="btn-save">保存</button>
	</div>
	</div>
</body>
</html>
