package jspSamples.unit7.websiteSample;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

public class Notice
{

    DBConnection DBConn = new DBConnection();
    Function Fun = new Function(); 
    
 
    /**
     * ��������ListNotice
     * ����������ʵ�ֹ����б�ҳ�����飩
     * @param toPage:��ҳ��תҳ���ַ��pageNum:ÿҳ��ʾ��¼����
     * @return ���ݿ��ѯ�������б��ַ��������
    */
    public String ListNotice(String toPage,String pageNum)
    {			
    	try {
			Connection Conn = DBConn.getConn();						     //��ȡ���ݿ�
			Statement stmt = Conn.createStatement();				     //�������ݿ�����״̬
			ResultSet rs = null;									     //�����������ѯ
			StringBuffer resultData = new StringBuffer();			     //��������ַ�������
			String sSql = "select * from Notice order by NoticeId desc"; //�������ݿ��ѯ���
			rs = stmt.executeQuery(sSql);							     //ִ�����ݿ��ѯ
			resultData=Fun.ListNotice(resultData,rs,toPage,pageNum);     //��ȡ���ط�ҳ���
			rs.close();												     //�رս������ѯ����
			stmt.close();											     //�ر����ݿ�����
			Conn.close();											     //�ر����ݿ�
			return resultData.toString();							     //��ǰ̨���ؽ����
		} catch (Exception e) {
			return "No";											     //����ȡ���ݿ�ʧ�ܣ����ء�No��
		}
    	
    }
    
    

     public String AddNotice(String [] noticeData)
     {			
 		try
     	{
     		Connection Conn = DBConn.getConn();
 	    	Statement stmt = Conn.createStatement();
     		
 	    	ResultSet rs = null;
 	    	String sSql = "select * from Notice order by NoticeId desc";   // ȡ����¼��Ψһ����ֵ
 	    	rs = stmt.executeQuery(sSql);
 	    	String result=Fun.AddNotice(Conn,stmt,rs,noticeData);		   //��ȡ��ѯ���
	    	return result;											       //����result ���
 	    	
 	    }catch(Exception e)
         {
             e.printStackTrace();
             return "�������쳣!";
         }
      }
     
     

	public boolean DelNotice(String id) {
		try {
			Connection Conn = DBConn.getConn();
			Statement stmt = Conn.createStatement();
			int ID = Fun.StrToInt(id);
			return Fun.DelNotice(Conn, stmt, ID);					 //ɾ�����ݲ�����ɾ�����
		} catch (Exception e) {
			return false;
		}
	}
	
	
	/**
     * ��������EditNotice
     * �����������޸ĵ����������ݡ���ɾ��
     * @param id:����Ψһ����;noticeData:�޸�����
     * @return �����޸ĺ��״̬������"yes"��˵���޸ĳɹ��������޸�ʧ�ܡ�
	 * Created by �����п�
    */
	public String EditNotice(String[] noticeData, String id) {
		try {
			Connection Conn = DBConn.getConn();
			Statement stmt = Conn.createStatement();
			return Fun.EditNotice(Conn, stmt, noticeData, id);      //�޸Ĳ��������ҷ���״̬
		} catch (Exception e) {
			return "���ݿ�����ʧ��!";
		}
	}
	
	/**
     * ��������ListNoticeFront
     * ����������ǰ̨�����б�ҳ�档
     * @param toPage:��ҳ��תҳ���ַ��pageNum:ÿҳ��ʾ��¼����
     * @return ���ݿ��ѯ�������б��ַ��������
	 * Created by �����п�
    */
	public String ListNoticeFront(String toPage,String pageNum)
    {			
		try
    	{
    		Connection Conn = DBConn.getConn();
	    	Statement stmt = Conn.createStatement();
	    	ResultSet rs = null;
    		StringBuffer resultData = new StringBuffer();
    		String sSql = "select * from Notice order by NoticeId desc";
	    	rs = stmt.executeQuery(sSql);
	    	resultData=Fun.ListNoticeFront(resultData,rs,toPage,pageNum);  		//��ȡ���ط�ҳ���
			rs.close();
    		stmt.close();
    		Conn.close();
    		return resultData.toString();	
    	}catch(Exception e)
        {
            return "No";
        }
    }
	
	/**
     * ��������FrontNoticeDetail
     * ����������ǰ̨��������ҳ�档
     * @param id:���¼�¼Ψһ����
     * @return ���ݿ��ѯ�����Ź����ַ��������
	 * Created by �����п�
    */
	public String FrontNoticeDetail(String id) {
		try {
			Connection Conn = DBConn.getConn();
			Statement stmt = Conn.createStatement();
			ResultSet rs = null;
			int ID = Fun.StrToInt(id);
			if (ID == 0)
				return "No";
			else {
				try {
					String sql = "select * from Notice where NoticeId=" + ID;
					rs = stmt.executeQuery(sql);
					StringBuffer sb = new StringBuffer();
					sb=Fun.FrontNoticeDetail(sb, rs);
					rs.close();
					stmt.close();
					Conn.close();
					return sb.toString();
				} catch (Exception e) {
					Conn.rollback();
					Conn.close();
					return "No";
				}
			}
		} catch (Exception e) {
			return "No";
		}

	}
	
}
     