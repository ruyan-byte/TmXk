<%@ page contentType="text/html; charset=GBK" language="java"%>
<%@ page import="jspSamples.unit7.websiteSample.*"%>
<%
	request.setCharacterEncoding("GBK"); //ע��:���ñ��뷽ʽΪGBK
%>
<%
	News news = new News();
	String NewsID = request.getParameter("NewsID");    				//��ȡ���ż�¼Ψһ����
	if (news.DelNews(NewsID))										//�������ύ����̨����ȡ����ֵ
		out.print("<script>alert('ɾ�����ųɹ�!');location.href='news.jsp';</script>");
	else {
		out.print("<script>alert('ɾ������ʧ��!');location.href='news.jsp';</script>");
	}
%>
