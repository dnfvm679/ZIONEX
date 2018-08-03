<%@page import="com.dto.CompanyVO"%>
<%@page import="java.util.ArrayList"%>
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
		<div class="container-fluid">
			<br>
			<div class="row">
				<div class="col-sm-1"></div>
				<div class="col-sm-10" style="text-align: center">
					<form action="/ZIOWEB/Factory" method="post">
						<table class="table table-hover">
							<thead>
								<tr>
									<th colspan="2"><input type="hidden" value="addUser"
										name="cmd">유저 추가하기</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th colspan="2">필수정보</th>
								</tr>
								<tr>
									<td>회사ID</td>
									<td>
										<div class="form-group">
											<select class="form-control" name="company_id">
												<%
													if (request.getAttribute("company") != null) {
														ArrayList<CompanyVO> list = (ArrayList<CompanyVO>) request.getAttribute("company");
														for (CompanyVO c : list) {
												%>
												<option value="<%=c.getId()%>"><%=c.getName()%></option>
												<%
													}
													}
												%>
											</select>
										</div>
									</td>
								</tr>
								<tr>
									<td>ID</td>
									<td>
										<div class="form-group">
											<input type="text" class="form-control"
												value="<%="USER_" + (String) request.getAttribute("userid")%>"
												placeholder="Enter ID" name="id" readonly="readonly">
										</div>
									</td>
								</tr>
								<tr>
									<td>이름</td>
									<td>
										<div class="form-group">
											<input type="text" class="form-control" maxlength="50"
												placeholder="Enter Name" name="name" id="name" required>
										</div>
									</td>
								</tr>
								
								<tr>
									<td>Email</td>
									<td>
										<div class="form-group">
											<input type="email" class="form-control" maxlength="50"
												placeholder="Enter Email" name="email" required>
										</div>
									</td>
								</tr>
								<tr>
									<th colspan=2>부가정보</th>
								</tr>
								<tr>
									<td>직급</td>
									<td>
										<div class="form-group">
											<input type="text" class="form-control" maxlength="50"
												placeholder="Enter Position" name="position" >
										</div>
									</td>
								</tr>
								<tr>
									<td>부서</td>
									<td>
										<div class="form-group">
											<input type="text" class="form-control" maxlength="30"
												placeholder="Enter team" name="team">
										</div>
									</td>
								</tr>

								<tr>
									<td>전화번호</td>
									<td>
										<div class="form-group">
											<input type="text" class="form-control" maxlength="15"
												placeholder="Enter Tel" name="tel">
										</div>
									</td>
								</tr>

								<tr>
									<td>휴대번호</td>
									<td>
										<div class="form-group">
											<input type="text" class="form-control" maxlength="15"
												placeholder="Enter Phone" name="phone">
										</div>
									</td>
								</tr>
								<tr>
									<td>주소</td>
									<td>
										<div class="form-group">
											<input type="text" class="form-control" maxlength="250"
												placeholder="Enter Address" name="address">
										</div>
									</td>
								</tr>
							</tbody>
						</table>

						<div class="float-right">
							<button class="btn btn-primary" type="submit">추가하기</button>
							<button class="btn btn-primary" type="reset">초기화</button>
						</div>
					</form>
				</div>
				<div class="col-sm-1"></div>
			</div>
		</div>
</body>
</html>