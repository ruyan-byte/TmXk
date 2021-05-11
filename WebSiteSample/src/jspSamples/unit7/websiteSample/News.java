package jspSamples.unit7.websiteSample;

import java.sql.Connection;			//����Java�������ݿ������ã�
import java.sql.ResultSet;			//����Java�������ݿ������ã�
import java.sql.Statement;  		//����Java�������ݿ������ã�
/**
 * �ļ�����News.java                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
 * �ļ��������������Ź���ģ�����ɾ�Ĳ鹦�ܲ���
*/
public class News {

	DBConnection DBConn = new DBConnection();                             //�������ݿ�����
	Function Fun = new Function();									      //���빦���������֤���롢ҳ����Ⱦ�ȡ�

	/**
     * ��������ListNews
     * ����������ʵ�������б�ҳ�����飩
     * @param toPage:��ҳ��תҳ���ַ��pageNum:ÿҳ��ʾ��¼����
     * @return ���ݿ��ѯ�������б��ַ��������
	 * Created by �����п�
    */
	public String ListNews(String toPage, String pageNum) {
		try {
			Connection Conn = DBConn.getConn();						//��ȡ���ݿ�
			Statement stmt = Conn.createStatement();				//�������ݿ�����״̬
			ResultSet rs = null;									//�����������ѯ
			StringBuffer resultData = new StringBuffer();			//��������ַ�������
			String sSql = "select * from News order by NewsID desc";//�������ݿ��ѯ���
			rs = stmt.executeQuery(sSql);							//ִ�����ݿ��ѯ
			resultData=Fun.ListNews(resultData,rs,toPage,pageNum);  //��ȡ���ط�ҳ���
			rs.close();												//�رս������ѯ����
			stmt.close();											//�ر����ݿ�����
			Conn.close();
		    return resultData.toString();							//��ǰ̨���ؽ����
		} catch (Exception e) {
			return "No";											//����ȡ���ݿ�ʧ�ܣ����ء�No��
		}
	}
	
	
	
	/**
     * ��������AddNews
     * ���������������������ݼ�¼��������
     * @param newsData:��Ҫ�ύ����������
     * @return �����������״̬�����ء�yes����˵�������ɹ�����������ʧ�ܡ�
	 * Created by �����п�
    */
	public String AddNews(String [] newsData)
    {			
		try
    	{
    		Connection Conn = DBConn.getConn();						  //��ȡ���ݿ�
	    	Statement stmt = Conn.createStatement();				  //�������ݿ�����״̬
	    	ResultSet rs = null;									  //�����������ѯ	
	    	String sSql = "select * from News order by NewsID desc";  //�������ݿ��ѯ���
	    	rs = stmt.executeQuery(sSql); 							  //ִ�����ݿ��ѯ
	    	String result=Fun.AddNews(Conn,stmt,rs,newsData);		  //��ȡ��ѯ���
	    	return result;											  //����result ���
	    }catch(Exception e){
            return "���ʧ��";											  //����ȡ���ݿ�ʧ�ܣ����ء����ʧ�ܡ�
        }
     }
	
	
	
	/**
     * ��������DelNews
     * ����������ɾ�������������ݡ���ɾ��
     * @param newsId:����Ψһ����
     * @return ����ɾ�����״̬������true��˵��ɾ���ɹ�������ɾ��ʧ�ܡ�
	 * Created by �����п�
    */
	public boolean DelNews(String newsId)
    {	
    	try{
	    	Connection Conn = DBConn.getConn();				//��ȡ���ݿ�
	    	Statement stmt = Conn.createStatement();		//�������ݿ�����״̬
	    	int NewsID = Fun.StrToInt(newsId);				//���ַ���newsIdת��Ϊ��������NewsID
	    	return Fun.DelNews(Conn,stmt,NewsID);			//ɾ�����ݲ�����ɾ�����
    	}catch(Exception e){
    		return false;
    	}
	}
	
	
	/**
     * ��������EditNews
     * �����������޸ĵ����������ݡ����ģ�
     * @param newsId:����Ψһ����;newsData:�޸�����
     * @return �����޸ĺ��״̬������"yes"��˵���޸ĳɹ��������޸�ʧ�ܡ�
	 * Created by �����п�
    */
	public String EditNews(String[] newsData, String newsId) {
		try {
			Connection Conn = DBConn.getConn();				//��ȡ���ݿ�
			Statement stmt = Conn.createStatement();		//�������ݿ�����״̬
			return Fun.EditNews(Conn,stmt,newsData,newsId); //�޸Ĳ��������ҷ���״̬
		} catch (Exception e) {
			return "���ݿ�����ʧ��!";
		}
	}
	
	
	/**
     * ��������ListNewsFront
     * ����������ǰ̨�����б�ҳ�档
     * @param toPage:��ҳ��תҳ���ַ��pageNum:ÿҳ��ʾ��¼����
     * @return ���ݿ��ѯ�������б��ַ��������
	 * Created by �����п�
    */
	public String ListNewsFront(String toPage,String pageNum)
    {			
		try
    	{
    		Connection Conn = DBConn.getConn();
	    	Statement stmt = Conn.createStatement();
	    	ResultSet rs = null;
    		StringBuffer resultData = new StringBuffer();
    		String sSql = "select * from News order by NewsID desc";
	    	rs = stmt.executeQuery(sSql);
	    	resultData=Fun.ListNewsFront(resultData,rs,toPage,pageNum);  		//��ȡ���ط�ҳ���
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
     * ��������FrontNewsDetail
     * ����������ǰ̨��������ҳ�档
     * @param id:���¼�¼Ψһ����
     * @return ���ݿ��ѯ�����������ַ��������
	 * Created by �����п�
    */
	public String FrontNewsDetail(String id) {
		try {
			Connection Conn = DBConn.getConn();
			Statement stmt = Conn.createStatement();
			ResultSet rs = null;
			int NewsID = Fun.StrToInt(id);
			if (NewsID == 0)
				return "No";
			else {
				try {
					String sql = "select * from News where NewsID=" + NewsID;
					rs = stmt.executeQuery(sql);
					StringBuffer sb = new StringBuffer();
					sb=Fun.FrontNewsDetail(sb, rs);
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
