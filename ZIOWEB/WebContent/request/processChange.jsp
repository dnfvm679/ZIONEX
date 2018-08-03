<%@page import="com.dto.CommonCodeVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.dto.RequestVO"%>
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
		<%
			RequestVO requestvo = (RequestVO) request.getAttribute("requestvo");
		%>
		<div class="container-fluid">
			<br>
			<div class="row">
				<div class="col-sm-8" style="text-align: center">
					<table class="table table-hover">
						<thead>
							<tr>
								<th colspan="4">글 상세보기</th>
							</tr>
						</thead>
						<tbody>
							<%
								if (session.getAttribute("userid") != null) {
									if (session.getAttribute("userid").toString().equals("ADMIN")) {
							%>
							<tr>
								<td class="tag" colspan="2">요청 ID</td>
								<td colspan="2"><%=requestvo.getId()%></td>
							</tr>
							<%
								}
								}
							%>
							<tr>
								<td class="tag" colspan="2">제목</td>
								<td colspan="2"><%=requestvo.getTitle()%></td>
							</tr>
							<tr>
								<td class="tag" colspan="2">작성자</td>
								<td colspan="2"><%=requestvo.getUser_name()%></td>
							</tr>
							<tr>
								<td class="tag" colspan="2">작성일자</td>
								<td colspan="2"><%=requestvo.getRequest_date()%></td>
							</tr>
							<tr>
								<td class="tag" colspan="2">내용</td>
								<td colspan="2">
									<div><%=requestvo.getContent()%></div>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<!-- End of Show request -->

				<div class="col-sm-4">
					<%
						ArrayList<CommonCodeVO> list = (ArrayList<CommonCodeVO>) request.getAttribute("codelist");
					%>
					<form action="/ZIOWEB/Factory" method="post">
						<input type="hidden" name="cmd" value="processChange">
						<input
							type="hidden" name="request_id" value="<%=requestvo.getId()%>">
						<input type="hidden" name="user_name"	value="<%=requestvo.getUser_name()%>">
						<input type="hidden" name="user_id"	value="<%=requestvo.getUser_id()%>">
						<table class="table table-hover">
							<thead>
								<tr>
									<th colspan="2">요청 상태</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td class="tag">처리 상태</td>
									<td>
										<div class="form-group">
											<select class="form-control" name="process_state_id">
												<%
													for (CommonCodeVO c : list) {
														if (c.getGroup_id().equals("PROCESS_STATE")) {
															if (!c.getId().equals("S04")) {
																if (requestvo.getProcess_state_id().equals(c.getId())) {
												%>
												<option value="<%=c.getId()%>" selected><%=c.getName()%></option>
												<%
													} else {
												%>
												<option value="<%=c.getId()%>"><%=c.getName()%></option>
												<%
													}
															}
														}
													}
												%>
											</select>
										</div>
									</td>
								</tr>

								<tr>
									<td class="tag">처리 담당자ID</td>
									<td>
										<div class="form-group">
											<%
												if (requestvo.getManager_id() != null) {
											%>
											<input class="form-control" type="text" name="manager_id"
												value="<%=requestvo.getManager_id()%>"
												placeholder="담당자 ID를 입력해주세요">
											<%
												} else {
											%>
											<input class="form-control" type="text" name="manager_id"
												placeholder="담당자 ID를 입력해주세요">
											<%
												}
											%>
										</div>
									</td>
								</tr>

								<tr>
									<td class="tag">처리 분류</td>
									<td>
										<div class="form-group">
											<select class="form-control" name="process_type_id">
												<%
													for (CommonCodeVO c : list) {
														if (c.getGroup_id().equals("PROCESS_TYPE")) {
															if (requestvo.getProcess_type_id() != null && requestvo.getProcess_type_id().equals(c.getId())) {
												%>
												<option value="<%=c.getId()%>" selected><%=c.getName()%></option>
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
									<td class="tag">처리 형태</td>
									<td>
										<div class="form-group">
											<select class="form-control" name="process_form_id">
												<%
													for (CommonCodeVO c : list) {
														if (c.getGroup_id().equals("PROCESS_FORM")) {
															if (requestvo.getProcess_form_id() != null && requestvo.getProcess_form_id().equals(c.getId())) {
												%>
												<option value="<%=c.getId()%>" selected><%=c.getName()%></option>
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
							</tbody>
						</table>
						<button class="btn btn-primary float-right" type="submit">처리상태변경</button>
					</form>
				</div>
				<!-- End of Process Change Table -->
			</div>
		</div>
</body>
</html>