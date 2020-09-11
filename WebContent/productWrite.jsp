<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/css.css">
<script type="text/javascript" 
src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="script/product.js"></script> 
<title>상품관리</title>
</head>
<body>
<div id="wrap" align="center">
<h1>상품 등록 - 관리자 페이지</h1>
<form method="post" encType="multipart/form-data" name="frm">
	<table>
		<tr>
			<th>상&nbsp;&nbsp;품&nbsp;&nbsp;명</th>
			<td><input type="text" name="name" size="80"></td>
		</tr>	
		<tr>
			<th>가&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;격</th>
			<td><input type="number" name="price" size="80">원</td>
		</tr>
		<tr>
			<th>사&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;진</th>
			<td>
				<input type="file" name="pictureUrl">
				(주의사항 : 이미지를 변경하고자 할 때만 선택하시오)
			</td>
		</tr>
		<tr>
			<th>설&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;명</th>
			<td><textarea rows="10" cols="80" name="description"></textarea></td>
		</tr>
	</table>
	<br><br>
	<input type="submit" value="등록"  onclick="return productCheck()">
	<input type="reset" value="다시작성">
	<input type="button" value="목록" onclick="loaction.href='productList.do'">
</form>
</div>
</body>
</html>