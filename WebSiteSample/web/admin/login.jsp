<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ page import="jspSamples.unit7.websiteSample.*"%>
<%
	request.setCharacterEncoding("GBK"); //ע��:���ñ��뷽ʽΪGBK
	String Action = request.getParameter("Action"); //ע��:�ж��Ƿ�������¼��
	if (Action != null && Action.equals("Login")) {
		String User = request.getParameter("User"); //ע��:�õ���¼�û���
		String Pwd = request.getParameter("Pwd"); //ע��:�õ���¼����
		out.println("<script>alert('" + User + "');</script>");
		out.println("<script>alert('" + Pwd + "');</script>");
		Login login = new Login(); //ע�ͣ��½���¼��Login
		boolean isOK = login.LoginCheck(User, Pwd); //ע�ͣ����÷���LoginCheck���жϷ���ֵ���滹�Ǽ�
		if (isOK) {
			//���isOK=true��˵����֤�ɹ������Խ����̨ҳ��news.jsp 
			out.println("<SCRIPT LANGUAGE='JavaScript'>alert('��¼�ɹ���');location.href='news.jsp';</SCRIPT>");
		} else {
			//���isOK=false��˵����֤ʧ�ܣ��޷������̨ҳ��
			out.println("<SCRIPT LANGUAGE='JavaScript'>alert('��¼ʧ�ܣ�');location.href='login.jsp';</SCRIPT>");
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="GBK">
<title>��̨��¼-�����п�ѧϰ��վ</title>
<link rel="stylesheet" href="css/amazeui.min.css" />
<script src="js/main.js"></script>
</head>
<!--ע�ͣ����뱳��ͼ-->
<body style="background: url(img/login-bg.png) no-repeat">
	<!--ע�ͣ���˾����ͼƬ-->
	<div class="header" style="text-align: center; margin-top: 100px">
		<div class="am-g">
			<img src="img/loginTitle.png" />
		</div>
	</div>
	<!--ע�ͣ���¼��-->
	<div class="am-g" style="margin-top: 20px">
		<div class="am-u-lg-6  am-u-md-10  am-u-sm-centered"
			style="background: url(img/loginForm.png) no-repeat; height: 479px; width: 695px">
			<!--ע�ͣ���¼��-->
			<form action="login.jsp" method="post" class="am-form login-form"
				style="padding: 50px 0px 0px 120px; width: 550px"
				onSubmit="return LoginCheck()">
				<label for="name"> �û���: </label> <input type="text" name="User"
					id="User" value=""> <br> <label for="ps"> ����:</label>
				<input type="password" name="Pwd" id="Pwd" value=""> <br>
				<!--ע�ͣ���¼��ť-->
				<div class="am-cf">
					<input name="Action" type="hidden" value="Login"> <input
						type="submit" value="�� ¼" id="save"
						style="width: 100%; border-radius: 0.5em;"
						class="am-btn am-btn-primary am-btn-sm am-round">
				</div>
			</form>
		</div>
	</div>
</body>
</html>