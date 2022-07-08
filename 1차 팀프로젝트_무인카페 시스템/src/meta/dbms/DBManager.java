/******************************************************************************
* 수정자 : 함경환
* 수정일 : 2022-05-25 오후 03:28
******************************************************************************/
package meta.dbms;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBManager
{
	private	Connection	conn	= null;
	private	String		host;
	private	String		userid;
	private	String		passwd;

	private	Statement	stmt;
	private	ResultSet	result;

	protected String 	sql			= "";
	protected String 	where		= "";
	protected String 	className	= "";
	protected String 	tableName	= "";
	protected String 	methodName	= "";

	public DBManager()
	{
		this.host	= "jdbc:mysql://silverwoods.synology.me:3306/CTEAM?useUnicode=true&characterEncoding=utf-8&serverTimezone=UTC";
		this.userid	= "CTEAM";
		this.passwd	= "E2en_java_(team";
	}

/* 인자값을 이용한 DB 접속용 생성자********************************************************************************************************
	public DBManager(String userid, String passwd)
	{
		this.host	= "jdbc:mysql://silverwoods.synology.me:3306/CTEAM?useUnicode=true&characterEncoding=utf-8&serverTimezone=UTC";
		this.userid	= userid;
		this.passwd	= passwd;
	}

	public DBManager(String IP, String database, String userid, String passwd)
	{
		this.host	 = "jdbc:mysql://";
		this.host	+= IP += "/"+ database;
		this.host	+= "?useUnicode=true&characterEncoding=utf-8";
		this.host	+= "&serverTimezone=UTC";
		this.userid	= userid;
		this.passwd	= passwd;
	}
******************************************************************************************************************************************/

	//DB를 연결한다. //리턴값 : 성공시 true, 실패시 false
	public boolean DBOpen()
	{
		try
		{
			//JDBC 드라이버를 로딩한다.
			Class.forName("com.mysql.cj.jdbc.Driver");
			//데이터베이스에 연결한다.
			conn = DriverManager.getConnection(host,userid,passwd);
			return true;
		}catch(Exception e) { e.printStackTrace(); return false; }
	}

	//DB를 닫는다.
	public void DBClose() { try { conn.close(); }catch (Exception e) { e.printStackTrace(); } }

	//Insert, Update, Delete SQL 구문 처리
	public boolean RunSQL(String sql)
	{
		try
		{
			//작업 처리용 클래스를 할당 받는다.
			Statement stmt = conn.createStatement();
			//SQL 구문을 실행한다.
			stmt.executeUpdate(sql);
			stmt.close();
		}catch(Exception e) { e.printStackTrace(); return false; }
		return true;
	}

	//SQL Select 문장을 실행한다.
	public boolean OpenQuery(String sql)
	{
		try
		{
			//작업 처리용 클래스를 할당 받는다.
			stmt = conn.createStatement();
			//결과를 result로 받는다
			result = stmt.executeQuery(sql);
			return true;
		}catch(Exception e) { e.printStackTrace(); return false; }
	}

	//SQL Select 문장을 종료한다.
	public	void	CloseQuery() {				try { result.close(); stmt.close();		} catch (SQLException e) { e.printStackTrace(); }				}
	//다음 결과를 가져온다.
	public	boolean	GetNext() {					try { return result.next();				} catch (SQLException e) { e.printStackTrace(); return false; }	}
	//컬럼 값을 가져온다.
	public	String	GetValue(String column) {	try { return result.getString(column);	} catch (SQLException e) { e.printStackTrace(); return null; }	}
	//컬럼 값을 정수로 가져온다.
	public	int		GetInt(String column) {		try { return result.getInt(column);		} catch (SQLException e) { e.printStackTrace(); return 0; }		}
	//컬럼 값을 날짜로 가져온다.
	public	Date	GetDate(String column) {	try { return result.getDate(column);	} catch (SQLException e) { e.printStackTrace(); return null; }	}
	//컬럼 값을 객체로 가져온다.
	public	Object	GetObj(String column) {		try { return result.getObject(column);	} catch (SQLException e) { e.printStackTrace(); return null; }	}
	//작은 따옴표를 변환한다.
	public	String _R(String value) { return value.replace("'","''"); }

	// DBmanager를 상속받은 DTO에서 사용할 레코드 삭제용 메소드
	public boolean Delete(String columnName, int cartlist_no)
	{
		methodName = "Delete";
		//데이터베이스에 연결한다.
		System.out.println(className + " " + methodName + " [DB open]");
		if(this.DBOpen() == false) { System.out.println(className + " " + methodName + " [DB open] fail"); return false; }
		//DB 정보를 삭제한다.
		where =	(columnName == null)	?	"" : " where " + columnName + " = " + cartlist_no ;
		sql  = "delete from " + tableName + " ";
		sql += where;
		System.out.println(className + " " + methodName + " [make SQL] :\n" + sql);
		System.out.println(className + " " + methodName + " [run SQL]");
		this.RunSQL(sql);
		//데이터베이스 연결을 종료한다.
		System.out.println(className + " " + methodName + " [DB close]\n");
		this.DBClose();
		return true;
	}
}