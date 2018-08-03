<%@page import="com.dto.UserVO"%>
<%@page import="com.util.DBManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta content="charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Google jQuery file -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- Bootstrap file -->
<link rel="stylesheet" href="/ZIOWEB/css/bootstrap.css">
<link rel="stylesheet" href="/ZIOWEB/css/custom.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script src="/ZIOWEB/js/bootstrap.js"></script>
<title>ZIOWEB</title>
</head>
<body>
	<%
		UserVO user = (UserVO) request.getAttribute("user");
	%>
	<div class="container-fluid">
		<br>
		<div class="row">
			<div class="col-sm-1"></div>
			<div class="col-sm-10">
				<table class="table table-hover">
					<thead>
						<tr>
							<th class="label" colspan="2">유저 상세보기</th>
						</tr>
					</thead>
					<tbody>

						<tr>
							<td class="label">회사ID</td>
							<td><%=user.getCompany_id()%></td>
						</tr>
						<tr>
							<td class="label">사용자ID</td>
							<td><%=user.getId()%></td>
						</tr>
						<tr>
							<td class="label">이름</td>
							<td><%=user.getName()%></td>
						</tr>
						<tr>
							<td class="label">직급</td>
							<td><%=user.getPosition()%></td>
						</tr>
						<tr>
							<td class="label">부서</td>
							<td><%=user.getTeam()%></td>
						</tr>
						<tr>
							<td class="label">주소</td>
							<td><%=user.getAddress()%></td>
						</tr>
						<tr>
							<td class="label">전화번호</td>
							<td><%=user.getTel()%></td>
						</tr>
						<tr>
							<td class="label">휴대번호</td>
							<td><%=user.getPhone()%></td>
						</tr>
						<tr>
							<td class="label">Email</td>
							<td><%=user.getEmail()%></td>
						</tr>
					</tbody>
				</table>

				<div class="float-right">
					<%
						if (session.getAttribute("userid").toString().equals("ADMIN")) {
					%>
					<a class="btn btn-primary" data-remote="/ZIOWEB/Factory?cmd=updateUserForm&userid=<%=user.getId()%>"
						href="#" data-toggle="modal" data-target="#updateModal" data-dismiss="modal">수정하기</a>
					<a class="btn btn-primary"
						href="/ZIOWEB/Factory?cmd=deleteUser&userid=<%=user.getId()%>">삭제하기</a>
					<%
						}
					%>
				</div>
			</div>
			<div class="col-sm-1"></div>
		</div>
	</div>
</body>
</html>