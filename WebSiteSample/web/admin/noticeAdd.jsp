<%@ page contentType="text/html; charset=GBK" language="java" %>
<%@ page import="jspSamples.unit7.websiteSample.*"%>
<%
	request.setCharacterEncoding("GBK");
	Notice notice = new Notice();
	String Action = request.getParameter("Action");

	if (Action != null && Action.equals("Add")) {
		String[] s = new String[2];
		s[0] = request.getParameter("NoticeTitle");
		s[1] = request.getParameter("NoticeContent");
		String sNews = notice.AddNotice(s);
		if (sNews.equals("Yes")) {
			out.print("<script>alert('��ӹ���ɹ�!');location.href='notice.jsp';</script>");
			return;
		} else {
			out.print("<script>alert('��ӹ���ʧ��!');location.href='notice.jsp';</script>");
			return;
		}
	}
%>