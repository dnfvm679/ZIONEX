<%@page import="com.dto.CommonCodeVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.io.PrintWriter"%>
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
								<th colspan="2"><input type="hidden" value="finishRequest"
									name="cmd"> <input type="hidden" class="form-control"
									value="<%=request.getParameter("id")%>"
									placeholder="Enter Title" name="id" readonly> 요청 완료하기</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>처리완료일</td>
								<td>
									<div class="form-group">
										<input type="date" class="form-control" maxlength="100"
											placeholder="yyyy-MM-dd" name="date">
									</div>
								</td>
							</tr>
							<tr>
								<td>처리공수</td>
								<td>
									<div class="input-group mb-3">
										<input type="number" class="form-control" name="time">
										<div class="input-group-prepend">
											<select class="form-control" name="unit">
												<option value="M/M">M/M</option>
												<option value="M/D">M/D</option>
												<option value="M/H">M/H</option>
											</select>
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<td>처리내용</td>
								<td>
									<div class="form-group">
										<textarea id="requestwrite" class="form-control" rows="1"
											maxlength="2048" cols="1" name="content"
											placeholder="Enter Content"></textarea>
									</div>
								</td>
							</tr>
						</tbody>
					</table>

					<div class="float-right">
						<button class="btn btn-primary" type="submit">완료하기</button>
						<button class="btn btn-primary" type="reset">초기화</button>
					</div>
				</form>
			</div>
			<div class="col-sm-1"></div>
		</div>
	</div>
</body>
</html>