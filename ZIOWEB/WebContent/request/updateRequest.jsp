<%@page import="java.io.File"%>
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
			<div class="col-sm-1"></div>
			<div class="col-sm-10" style="text-align: center">
				<form
					action="/ZIOWEB/Factory?cmd=updateRequest&id=<%=requestvo.getId()%> "
					method="post" enctype="multipart/form-data">
					<table class="table table-hover">
						<thead>
							<tr>
								<th colspan="2">글 수정하기</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td class="tag">제목</td>
								<td>
									<div class="form-gruop">
										<input class="form-control" name="title"
											value="<%=requestvo.getTitle()%>">
									</div>
								</td>
							</tr>
							<tr>
								<td class="tag">작성자</td>
								<td><%=requestvo.getUser_id()%></td>
							</tr>
							<tr>
								<td class="tag">작성일자</td>
								<td><%=requestvo.getRequest_date()%></td>
							</tr>
							<tr>
								<td class="tag">내용</td>
								<td>
									<div class="form-group">
										<textarea id="requestwrite" class="form-control" rows="1"
											maxlength="2048" cols="1" name="content"
											placeholder="Enter Content"><%=requestvo.getContent()%></textarea>
									</div>
								</td>
							</tr>
							<tr>
								<td>첨부파일<a id="add" class="btn btn-primary">+</a> <a
									id="remove" class="btn btn-primary">-</a></td>
								<td id="fileUpload">
									<%
										String saveDir = application.getRealPath("/filestorage/" + request.getParameter("id"));
										File dir = new File(saveDir);

										String fName[] = dir.list();
										if (fName != null) {
											for (String fileName : fName) {
												out.write(fileName + "<a class='btn btn-danger' href='/ZIOWEB/FileDelete?id=" + requestvo.getId()
														+ "&fileName=" + fileName + "'>삭제하기</a><br>");
											}
										}
									%>
								</td>
							</tr>
						</tbody>
					</table>

					<div class="float-right">
						<%
							if (requestvo.getUser_id().equals((String) session.getAttribute("userid"))) {
						%>
						<button class="btn btn-primary" type="submit">수정하기</button>
						<%
							}
						%>
					</div>

				</form>
			</div>
			<div class="col-sm-1"></div>
		</div>
	</div>
	<script>
	
		var i = 0;
		$("#add").click(function() {
			if (i < 4) {
				$("#fileUpload").append("<div id=i><br><input class='form-control' type='file' name='file'+i></div>");
				i++;
			}
		});
	
		$("#remove").click(function() {
			if (i > 0) {
				i--;
				$("#i").remove();
			}
		});
	</script>
</body>
</html>