package jspSamples.unit7.websiteSample;

import java.sql.*;						
import java.util.*;
import java.io.*;


public class DBConnection					
{

    private String FileName;			
    private int DBType;					
    private Connection conn;			
    private String MySqlDriver;			
    private String MySqlURL; 			
        
   
    public DBConnection()
    {
    	conn = null;
    }

	public  Connection getConn()
	{

		//DBType= new Function().StrToInt(getPara("DBType"));
		DBType=1;

		switch(DBType)
		{
			case 1:return(getConnToMySql());
			default:return null;
		}	
	}
	
	
	public String getPara(String ParaName) 
	{
		FileName="../DBConfig.property";
		Properties prop= new Properties();
		try
		{
			InputStream is=getClass().getResourceAsStream(FileName);
			prop.load(is);
			if(is!=null) is.close();
		}
		catch(Exception e) {
			return "Error!";
		}
		return prop.getProperty(ParaName);
	}
	
	
    public Connection getConnToMySql()
    {
//		try{
//	 		MySqlDriver = getPara("MySQLDriver");
//	    	MySqlURL = getPara("MySQLURL");
//	    	Class.forName(MySqlDriver).newInstance();
//	    	conn = DriverManager.getConnection(MySqlURL);
//	    	}catch(Exception e){
//	    	}
		try{
			MySqlDriver = "org.gjt.mm.mysql.Driver";
			MySqlURL = "jdbc:mysql://127.0.0.1:3306/unit7website?user=fairchild&password=huiko8213@K&useUnicode=true&characterEncoding=UTF-8";
			Class.forName(MySqlDriver).newInstance();
			conn = DriverManager.getConnection(MySqlURL);
		}catch(Exception e){
		}
	    return conn;
    }       
    
}
