package jspSamples.unit7.websiteSample;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
/**
 * �ļ�����User.java
 * �ļ�������������̨����Ա�鿴����
*/
public class User
{

    DBConnection DBConn = new DBConnection();
    Function Fun = new Function(); 
   
    /**
     * ��������ListUser
     * ������������̨����Ա��Ϣ�����飩
     * @param toPage:��ҳ��תҳ���ַ��pageNum:ÿҳ��ʾ��¼����
     * @return ���ݿ��ѯ����̨����Ա��Ϣ��ѯ
	 * Created by �����п�
    */
	public String ListUser(String toPage, String pageNum) {
		try {
			Connection Conn = DBConn.getConn();
			Statement stmt = Conn.createStatement();
			ResultSet rs = null;
			StringBuffer resultData = new StringBuffer();
			String sSql = "select * from Admin order by AdminID desc";
			rs = stmt.executeQuery(sSql);
			resultData = Fun.ListUser(resultData, rs, toPage, pageNum);
			rs.close();
			stmt.close();
			Conn.close();
			return resultData.toString();
		} catch (Exception e) {
			return "No";
		}
	}
    
}