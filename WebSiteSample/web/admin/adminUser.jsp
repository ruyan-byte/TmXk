<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ page import="jspSamples.unit7.websiteSample.*"%>

<!doctype html>
<html class="no-js">
<head>
<meta charset="GBK">
<title>�����п�ѧϰ��վ</title>
<link rel="stylesheet" href="css/amazeui.min.css" />
<link rel="stylesheet" href="css/admin.css" />
<script src="js/main.js"></script>
</head>
<body style="background-color:#CDDBE8;">
	<header class="am-topbar admin-header" style="background-color:#2167A9;height:60px">
		<div class="am-topbar-brand" style="color:white;font-size:20px">
			<img src="img/logo1.png" width="50px"/><strong>&nbsp;&nbsp;�����п�ѧϰ��վ</strong> <small>��̨����</small>
		</div>
		<div class="am-collapse am-topbar-collapse"  id="topbar-collapse">
			<ul
				class="am-nav am-nav-pills am-topbar-nav am-topbar-right admin-header-list">
				<li class="am-dropdown" ><a class="am-dropdown-toggle" style="color:white"
					href="login.jsp"> �˳� </a></li>
			</ul>
		</div>
	</header>

	<div class="am-cf admin-main" style="height:760px;background:#CDDBE8;">
		<!-- ע�ͣ����˵� -->
		<div class="admin-sidebar am-offcanvas" style="background-color:#859FCD;margin:10px 10px" id="admin-offcanvas">
			<div class="am-offcanvas-bar admin-offcanvas-bar" style="height:200px">
				<ul class="am-list admin-sidebar-list" >
					<li style="background-color:#859FCD;"><a href="news.jsp" style="color:white"title="���Ź���">
					<img src="img/title1.png" width="25px"/> ���Ź���</a></li>
					<li style="background-color:#859FCD;"><a href="notice.jsp" style="color:white" title="�������">
					<img src="img/title2.png" width="25px"/>  �������</a></li>
					<li style="background-color:#859FCD;"><a href="adminUser.jsp" style="color:white" title="����Ա����">
					<img src="img/title3.png" width="25px"/> ����Ա����</a></li>
				</ul>
			</div>
		</div>

		<!-- ע�ͣ�����Ա��Ϣ -->
		<div class="admin-content" style="margin:10px 10px">

			<div class="am-cf am-padding">
				<div class="am-fl am-cf">
					<strong>��̨����</strong>/ <strong>����Ա��Ϣ</strong>
				</div>
			</div>


			<div class="am-g" style="height: 300px">
				<div class="am-u-sm-12">
					<form class="am-form">
						<table class="am-table am-table-striped am-table-hover table-main">
							<thead>
								<tr>
									<th class="table-title">�û���</th>
									<th class="table-title">�û�����</th>
									<th class="table-title">����ʱ��</th>
								</tr>
							</thead>
							<tbody>
								<%
										request.setCharacterEncoding("GBK");
									    User user = new User();
										String strPage = request.getParameter("intPage");
										String sPage = request.getContextPath() + request.getServletPath()+ "?";
										String sOK = user.ListUser(sPage, strPage);
										if (sOK.equals("No")) {
											out.println("���ݷ��������ִ���");
										} else {
											out.println(sOK);
										}
									%>
							</tbody>
						</table>
					</form>
				</div>
			</div>
		</div>
	</div>

	<footer>
		<hr>
		<p style="text-align: center;color:#2167A9" class="am-padding-left">�����п�ѧϰ��վ</p>
	</footer>

</body>
</html>
