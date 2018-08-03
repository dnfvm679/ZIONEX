package com.action.request;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.action.Action;
import com.dao.RequestDAO;
import com.dao.UsersDAO;
import com.dto.RequestVO;
import com.dto.UserVO;
import com.util.SendMail;

public class ProcessChangeAction implements Action {
	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UsersDAO usersdao = new UsersDAO();
		UserVO uservo = usersdao.getUser(request.getParameter("user_id"));
		String to = uservo.getEmail();
		String subject = "[CSM] 대응 메일 내용 전달의 건";
		String state = request.getParameter("process_state_id");
		String name = uservo.getName();
		if (state.equals("S02")) {
			String content = "- <br>" + "<br>" + "안녕하세요. " + name + " 님.<br>"
					+ "자이오넥스 CST 입니다.<br>" + "<br>" + "문의하신 내용에 대해 확인 작업을 진행한 후 회신 드리겠습니다.<br>"
					+ "확인 작업에 시간이 소요될 수 있음을 미리 말씀 드립니다. <br>" + "<br>" + "※ 문의 사항이 발생할 경우 전화 혹은 메일로 문의를 드릴 수 있습니다.<br>"
					+ "<br>" + "감사합니다.<br>" + "<br>" + "-<br>" + "<br>" + "감사합니다.<br>"
					+ "-----------------------------------------------<br>" + "<br>"
					+ "ZIONEX Inc. Client Support Team<br>" + "<br>" + "T: 055-313-1203 | F: 055-313-1205 <br>" + "<br>"
					+ "-----------------------------------------------";
			new SendMail(to, subject, content);
		}
		RequestVO requestvo = new RequestVO();
		requestvo.setId(request.getParameter("request_id"));
		requestvo.setProcess_form_id(request.getParameter("process_form_id"));
		requestvo.setProcess_type_id(request.getParameter("process_type_id"));
		requestvo.setProcess_state_id(request.getParameter("process_state_id"));
		requestvo.setManager_id(request.getParameter("manager_id"));
		RequestDAO requestdao = new RequestDAO();
		if (requestdao.updateProcess(requestvo)) {
			String url = "Factory?cmd=getRequestList&page=1";
			response.sendRedirect(url);
		} else {
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('Update Failed');");
			out.println("</script>");
		}
	}
}
