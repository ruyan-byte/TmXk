<%@ page contentType="text/html; charset=GBK" language="java" %>
<%@ page import="jspSamples.unit7.websiteSample.*"%>
<%
	request.setCharacterEncoding("GBK");
	News news = new News();
	String Action = request.getParameter("Action");
	
	if (Action!=null && Action.equals("Add"))
	{
		String [] s = new String[2];                 //�����ַ�������
		s[0] = request.getParameter("NewsTitle");	 //��ȡ���ű���	
		s[1] = request.getParameter("NewsContent");  //��ȡ��������
		String result = news.AddNews(s);			 //�����ż�¼�����ύ����̨
		if (result.equals("Yes"))				     //���ݷ��صĽ���ж�ҳ������
		{
			out.print("<script>alert('������ųɹ�!');location.href='news.jsp';</script>");
			return;
		}
		else 
		{
			out.print("<script>alert('�������ʧ��!');location.href='news.jsp';</script>");
			return;
		}
	}
%>