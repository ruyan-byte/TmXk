<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ page import="jspSamples.unit7.websiteSample.*"%>
<%
	request.setCharacterEncoding("GBK"); //ע��:���ñ��뷽ʽΪGBK
%>
<!doctype html>
<html>
<head>
<meta charset="GBK">
<title>�����п�ѧϰ��վ</title>
<link rel="stylesheet" href="css/amazeui.min.css"/>
<link rel="stylesheet" href="css/admin.css"/>
<script src="js/main.js"></script>
<script src="js/news.js"></script>
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
					<img src="img/title2.png" width="25px"/> �������</a></li>
					<li style="background-color:#859FCD;"><a href="adminUser.jsp" style="color:white" title="����Ա����">
					<img src="img/title3.png" width="25px"/> ����Ա����</a></li>
				</ul>
				
			</div>
		</div>
		
		<!-- ע�ͣ������б� -->
		<div class="admin-content" style="margin:10px 10px">
			<div class="am-cf am-padding">
				<div class="am-fl am-cf">
					<strong>��̨����</strong>/ <strong>���Ź���</strong>
				</div>
			</div>
			<div class="am-g">
				<div class="am-u-sm-12 am-u-md-6">
					<div class="am-btn-toolbar">
						<div class="am-btn-group am-btn-group-xs">
							<button type="button" class="am-btn am-btn-warning"
								data-am-modal="{target: '#new-popup'}">
								<span class="am-icon-plus"></span> �������
							</button>
						</div>
					</div>
				</div>
			</div>

			<div class="am-g" style="height: 300px">
				<div class="am-u-sm-12">
					<form class="am-form">
						<table class="am-table am-table-striped am-table-hover table-main">
							<thead>
								<tr>
									<th class="table-id">���</th>
									<th class="table-title">���ű���</th>
									<th class="table-title">������</th>
									<th class="table-author">����ʱ��</th>
									<th class="table-author">����</th>
								</tr>
							</thead>
							<tbody>
<%
	request.setCharacterEncoding("GBK");
	News news = new News();
	String pageNum = request.getParameter("intPage");						   //ע�ͣ���ȡÿҳ��ʾ��¼������
	String toPage = request.getContextPath() + request.getServletPath()+ "?";  //ע�ͣ���ȡ��תҳ��ĵ�ַ
	String sOK = news.ListNews(toPage, pageNum);							   //ע�ͣ����÷���ListNews����ȡ��̨���ص�ҳ����
	if (sOK.equals("No")) {
			out.println("���ݷ��������ִ���!");  //ע�ͣ����ء�No����˵������ʧ��
	} else {
			out.println(sOK);              //ע�ͣ���ʾ�ɹ�����Ⱦ�����ֵ
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
	
	<!-- ע�ͣ��������� -->
	<div class="am-popup" id="new-popup">
			<div class="am-popup-inner">
				<div class="am-popup-hd">
					<h4 class="am-popup-title">
						�������
					</h4>
					<span data-am-modal-close class="am-close">&times;</span>
				</div>

				<div class="am-popup-bd">
					<!-- ע�ͣ��ύ�������ݼ�¼ -->
					<form action="newsAdd.jsp" method="post"
						class="am-form" id="new-msg">
						<fieldset>
							<div class="am-form-group">
								<label for="doc-vld-ta-2-1">
									���ű��⣺
								</label>
								<input name="NewsTitle" type="text" maxlength="32"
									placeholder="���������ű���" data-validation-message="����Ϊ��" required />
							</div>
							<div class="am-form-group">
								<label for="doc-vld-ta-2-1">
									�������ݣ�
								</label>
								<textarea name="NewsContent" cols="30" rows="10"
									placeholder="�������������ݡ����������#�ָ���" data-validation-message="����Ϊ��" required></textarea>
							</div>
							
							<input name="Action" type="hidden" value="Add">
							
							<button class="am-btn am-btn-secondary" type="submit">
								�ύ
							</button>
							<button onclick='$("#new-popup").modal("close");'
								class="am-btn am-btn-secondary" type="button">
								�ر�
							</button>
						</fieldset>
					</form>
					<!-- ע�ͣ��ύ�������ݼ�¼���� -->
				</div>

			</div>
		</div>
		<!-- ע�ͣ��������Ž��� -->
		
		
		<!-- ע�ͣ�ɾ�����ſ�ʼ -->
		<div class="am-modal am-modal-confirm" tabindex="-1" id="my-confirm">
			<div class="am-modal-dialog">
				<div class="am-modal-bd">
					ȷ��Ҫɾ����ǰ������
				</div>
				<div class="am-modal-footer">
					<span class="am-modal-btn" data-am-modal-cancel>ȡ��</span>
					<span class="am-modal-btn" data-am-modal-confirm>ȷ��</span>
				</div>
			</div>
		</div>
		<!-- ע�ͣ�ɾ�����Ž��� -->
		
		<!-- ע�ͣ��޸����ſ�ʼ -->
		<div class="am-popup" id="edit-popup">
			<div class="am-popup-inner">
				<div class="am-popup-hd">
					<h4 class="am-popup-title">
						�޸�����
					</h4>
					<span data-am-modal-close class="am-close">&times;</span>
				</div>

				<div class="am-popup-bd">
					<form action="newsEdit.jsp" method="post"
						class="am-form" id="edit-msg">
						<fieldset>
							<div class="am-form-group">
								<label for="doc-vld-ta-2-1">
									���ű��⣺
								</label>
								<input id="upd_NewsTitle" name="upd_NewsTitle" type="text" maxlength="32"
									placeholder="���������ű���" data-validation-message="����Ϊ��" required />
							</div>
							<div class="am-form-group">
								<label for="doc-vld-ta-2-1">
									�������ݣ�
								</label>
								<textarea id="upd_NewsContent" name="upd_NewsContent"  cols="30" rows="10"
									placeholder="��������������" data-validation-message="����Ϊ��" required></textarea>
							</div>
							
							<input name="Action" type="hidden" value="Edit">
							<input id="newsId" name="newsId" type="hidden" value="">
							
							<button class="am-btn am-btn-secondary" type="submit">
								�ύ
							</button>
							<button onclick='$("#edit-popup").modal("close");'
								class="am-btn am-btn-secondary" type="button">
								�ر�
							</button>
						</fieldset>
					</form>
				</div>
			</div>
		</div>
		<!-- ע�ͣ��޸����Ž��� -->
		
</body>
</html>
