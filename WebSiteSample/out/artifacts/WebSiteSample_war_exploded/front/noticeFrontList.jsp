<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ page import="jspSamples.unit7.websiteSample.*"%>
<!DOCTYPE html>
<html>
<!--ע�ͣ�ͷ��-->
<head>
<meta charset="GBK">
<!--ע�ͣ���վ����-->
<title>����--�����п�ѧϰ��վ</title>
<!--ע�ͣ�������վ����ʽ-->
<link type="text/css" href="css/style.css" rel="stylesheet">
<!--ע�ͣ�������վ����Ч-->
<script type=" text/javascript" src="js/fwslider.js"></script>
</head>
<!--ע�ͣ�ͷ������-->

<!--ע�ͣ�����-->
<body>
	<div class="bgStyle">
		<div class="header">
			<div class="logo">
				<img src="img/logo.png">
			</div>
			<div class="pull-icon">
				<a id="pull"></a>
			</div>
			<div class="cssmenu">
				<ul>
					<li><a href="index.html">��ҳ</a></li>
					<li><a href="about.html">��ҵ���</a></li>
					<li><a href="noticeFrontList.jsp">����</a></li>
					<li><a href="newsFrontList.jsp">����</a></li>
					<li><a href="product.html">��Ʒ����</a></li>
					<li class="last"><a href="contact.html">��ϵ����</a></li>
				</ul>
			</div>
			<!--�������-->
			<div class="clear"></div>
		</div>
	</div>

	<div class="second_banner">
		<img src="img/notice.jpg">
	</div>

	<div class="container">
		<div class="left">
			<div class="menu_plan">
				<div class="menu_title">
					��˾��̬<br> <span>notice of company</span>
				</div>
				<ul id="tab">
					<li><a href="#">��˾����</a></li>
				</ul>
			</div>
		</div>

		<div class="right">
			<div class="location">
				<span>��ǰλ�ã�<a href="javascript:void(0)" id="a"><a
						href="#">��˾����</a></a></span>
				<div class="brief" id="b">
					<a href="#">��˾����</a>
				</div>
			</div>
			<div style="font-size: 14px; margin-top: 53px; line-height: 36px;">
				<div id="tab_con">
					<div id="tab_con_2"  >
						<table style="margin-top: 70px; width: 100%">
							<tbody>
								<tr class="tt_bg" style="text-align:center">

									<td>�������</td>
									<td>������</td>
									<td>����ʱ��</td>
									<td>����</td>
								</tr>
								<%
										request.setCharacterEncoding("GBK");
										Notice notice = new Notice();
										String pageNum = request.getParameter("intPage");
										String toPage = request.getContextPath() + request.getServletPath()+ "?";
										String sOK = notice.ListNoticeFront(toPage, pageNum);
										if (sOK.equals("No")) {
											out.println("���ݷ��������ִ���");
										} else {
											out.println(sOK);
										}
									%>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="bottom">
		<div class="footer">
			<div class="address">
				Copyright �����п�ѧϰ��վ
				<br> �����п�ѧϰ��վ <br>
				<a href="#">�����п�ѧϰ��վ</a> ����֧�� <a
					href="../admin/login.jsp">��̨</a>
			</div>
		</div>
	</div>
</body>
</html>