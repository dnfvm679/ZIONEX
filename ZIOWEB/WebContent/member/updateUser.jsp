<%@page import="java.util.ArrayList"%>
<%@page import="com.dto.CompanyVO"%>
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
				<form action="/ZIOWEB/Factory" method="post">
					<table class="table table-hover">
						<thead>
							<tr>
								<th colspan="2"><input type="hidden" value="updateUser"
									name="cmd" class="tag">유저 수정하기</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th colspan=2 class="tag">필수정보</th>
							</tr>
							<tr>
								<td class="tag">회사ID</td>
								<td>
									<div class="form-group">
										<select class="form-control" name="company_id">
											<%
												if (request.getAttribute("company") != null) {
													ArrayList<CompanyVO> list = (ArrayList<CompanyVO>) request.getAttribute("company");
													for (CompanyVO c : list) {
														if (c.getId().equals(user.getCompany_id())) {
											%>
											<option value="<%=c.getId()%>" selected="selected"><%=c.getName()%></option>
											<%
												} else {
											%>
											<option value="<%=c.getId()%>"><%=c.getName()%></option>
											<%
												}
													}
												}
											%>
										</select>
									</div>
								</td>
							</tr>
							<tr>
								<td class="tag">ID</td>
								<td>
									<div class="form-group">
										<input type="text" class="form-control"
											value="<%=user.getId()%>" placeholder="Enter ID" name="id"
											readonly="readonly">
									</div>
								</td>
							</tr>
							<tr>
								<td class="tag">이름</td>
								<td>
									<div class="form-group">
										<input type="text" class="form-control" maxlength="50"
											value="<%=user.getName()%>" name="name" id="name" required>
									</div>
								</td>
							</tr>
							<tr>
								<th colspan=2 class="tag">부가정보</th>
							</tr>
							<tr>
								<td class="tag">직급</td>
								<td>
									<div class="form-group">
										<input type="text" class="form-control" maxlength="50"
											value="<%=user.getPosition()%>" name="position" required>
									</div>
								</td>
							</tr>
							<tr>
								<td class="tag">부서</td>
								<td>
									<div class="form-group">
										<input type="text" class="form-control" maxlength="30"
											value="<%=user.getTeam()%>" name="team">
									</div>
								</td>
							</tr>

							<tr>
								<td class="tag">전화번호</td>
								<td>
									<div class="form-group">
										<input type="text" class="form-control" maxlength="15"
											value="<%=user.getTel()%>" name="tel">
									</div>
								</td>
							</tr>

							<tr>
								<td class="tag">휴대번호</td>
								<td>
									<div class="form-group">
										<input type="text" class="form-control" maxlength="15"
											value="<%=user.getPhone()%>" name="phone">
									</div>
								</td>
							</tr>
							<tr>
								<td class="tag">Email</td>
								<td>
									<div class="form-group">
										<input type="email" class="form-control" maxlength="50"
											value="<%=user.getEmail()%>" name="email">
									</div>
								</td>
							</tr>
							<tr>
								<td class="tag">주소</td>
								<td>
									<div class="form-group">
										<input type="text" class="form-control" maxlength="250"
											value="<%=user.getAddress()%>" name="address">
									</div>
								</td>
							</tr>
						</tbody>
					</table>

					<div class="float-right">
						<button class="btn btn-primary" type="submit">수정하기</button>
						<button class="btn btn-primary" type="reset">초기화</button>
					</div>
				</form>
			</div>
			<div class="col-sm-1"></div>
		</div>
	</div>
</body>
</html>