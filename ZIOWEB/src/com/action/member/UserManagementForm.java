package com.action.member;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.action.Action;
import com.dao.UsersDAO;
import com.dto.UserVO;

public class UserManagementForm implements Action {
	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "member/userManagement.jsp";
		UsersDAO usersdao = new UsersDAO();
		ArrayList<UserVO> list = usersdao.getUsers(Integer.parseInt(request.getParameter("page")));
		int totalUser = usersdao.totalUser();
		int lastPage = 0;
		if(totalUser%10 == 0) {
			totalUser = totalUser-1;
		}
		lastPage = totalUser/10+1;
		request.setAttribute("userList", list);
		request.setAttribute("lastPage", lastPage);
		RequestDispatcher ds = request.getRequestDispatcher(url);
		ds.forward(request, response);
	}
}
