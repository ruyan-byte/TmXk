<%@ page contentType="text/html; charset=GBK" language="java"%>
<%@ page import="jspSamples.unit7.websiteSample.*"%>
<%
	request.setCharacterEncoding("GBK"); //ע��:���ñ��뷽ʽΪGBK
%>
<%
	Notice notice = new Notice();
	String IP = request.getRemoteAddr(); //�õ��ͻ���Ip��ַ
	String AdminName = (String) session.getAttribute("AdminName");
	String NewsID = request.getParameter("NewsID");

	if (notice.DelNotice(NewsID))
		out.print("<script>alert('ɾ������ɹ�!');location.href='notice.jsp';</script>");
	else {
		out.print("<script>alert('ɾ������ʧ��!');location.href='notice.jsp';</script>");
	}
%>
