package com.action.request;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.action.Action;
import com.dao.RequestDAO;
import com.dto.RequestVO;

public class GetNewRequestListAction implements Action {
	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		RequestDAO requestdao = new RequestDAO();
		ArrayList<RequestVO> list = null;
		JSONArray arr = new JSONArray();
		list = requestdao.getRequestList(1);
		for (RequestVO r : list) {
			JSONObject jsonobj = new JSONObject();
			jsonobj.put("id", r.getId());
			jsonobj.put("num", r.getReq_index());
			jsonobj.put("title", r.getTitle());
			jsonobj.put("state", r.getProcess_state_name());
			jsonobj.put("name", r.getUser_name());
			jsonobj.put("date", r.getRequest_date().toString());
			arr.add(jsonobj);
		}
		JSONObject jsonobj2 = new JSONObject();
		jsonobj2.put("list", arr);
		out.print(jsonobj2);
	}
}
