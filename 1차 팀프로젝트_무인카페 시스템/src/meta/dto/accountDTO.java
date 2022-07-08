/******************************************************************************
* 수정자 : 함경환
* 수정일 : 2022-05-25 오후 03:56
******************************************************************************/
package meta.dto;

import meta.dbms.DBManager;
import meta.vo.accountVO;

public class accountDTO extends DBManager
{
	public	final	static	int	ERROR			=	99;

	public	final	static	int	NOT_DUPLICATE	=	0;
	public	final	static	int	DUPLICATE		=	1;

	public	final	static	int	DEACTIVATE		=	2;
	public	final	static	int	ACTIVATE		=	3;

	private	String	sql			= "";
	private String	where		= "";
	private	String	tableName	= "account";
	private	String	className	= "accountDTO";

	//	계정 생성	//	리턴값 : true-등록완료, false-오류
	public boolean Create(accountVO vo)
	{
		vo.info(className + " Create");												//받아온 vo의 정보를 출력한다.
		//계정 중복 검사 fno
		if(vo.fno() != null && IsDuplicate(vo.fno(),"fno") == accountDTO.DUPLICATE)
			{ System.out.println(className + " Create [IsDuplicate] fno DUPLICATE"); return false; }
		//계정 중복 검사 id
		if(vo.id() != null && IsDuplicate(vo.id(),"id") == accountDTO.DUPLICATE)
			{ System.out.println(className + " Create [IsDuplicate] id DUPLICATE"); return false; }

		System.out.println(className + " Create [DB open]");							//데이터베이스에 연결한다.
		if(this.DBOpen() == false) { System.out.println(className + " Create [DB open] fail"); return false; }

		//admin 테이블에 Insert하는 구문을 만든다.
		sql	 ="";
		sql += "insert into " + tableName + " (";
		sql += " fno,";																//고유번호
		sql += " id,";																//아이디
		sql += " pw,";																//비밀번호
		sql += " level,";															//계정구분 0,1
		sql += " level_str,";														//계정구분 0:이용자,1:관리자
		sql += " name,";															//이름
		sql += " nickname,";														//닉네임
		sql += " gen,";																//성별 0,1
		sql += " gen_str,";															//성별 0:여성, 1:남성
		if( vo.age() != null) { sql += " age,"; }									//생일
		sql += " hp,";																//핸드폰번호
		sql += " em,";																//이메일
		sql += " cre_date,";														//생성일
		sql += " last_date,";														//최종접속일
		sql += " act,";																//활성여부 0,1
		sql += " act_str,";															//활성여부 0:비활성,1:활성
		sql += " st_no,";															//담당매장번호관리자
		sql += " ad_po,";															//직급관리자
		sql += " point,";															//적립금
		sql += " deposit,";															//예치금
		sql += " card_name,";														//카드사명
		sql += " card_no,";															//신용카드번호
		sql += " pay_method,";														//결제수단선택 0,1,2
		sql += " pay_str";															//결제수단선택 0:예치금,1:적립금,2:신용카드
		sql += ") \n";
		sql += "values ( ";
		sql += " '"		+	vo.fno()		+	"', 	\n";						//고유번호
		sql += " '"		+	vo.id()			+	"', 	\n";						//아이디
		sql += " md5('"	+	vo.pw()			+	"'), 	\n";						//비밀번호
		sql += " '"		+	vo.level()		+	"', 	\n";						//계정구분 0,1
		sql += " '"		+	vo.level_str()	+	"', 	\n";						//계정구분 0:이용자,1:관리자
		sql += " '"		+	vo.name()		+	"', 	\n";						//이름
		sql += " '"		+	vo.nickname()	+	"', 	\n";						//닉네임
		sql += " '"		+	vo.gen()		+	"', 	\n";						//성별 0,1
		sql += " '"		+	vo.gen_str()	+	"', 	\n";						//성별 0:여성, 1:남성
		if(vo.age() != null) { sql += " '" + vo.age() + "', \n"; }					//생일
		sql += " '"		+	vo.hp()			+	"', 	\n";						//핸드폰번호
		sql += " '"		+	vo.em()			+	"', 	\n";						//이메일
		sql += " now()"	+						", 		\n";						//생성일
		sql += " now()"	+						", 		\n";						//최종접속일
		sql += " '"		+	vo.act()		+	"', 	\n";						//활성여부 0,1
		sql += " '"		+	vo.act_str()	+	"', 	\n";						//활성여부 0:비활성,1:활성
		sql += " '"		+	vo.st_no()		+	"', 	\n";						//담당매장번호관리자
		sql += " '"		+	vo.ad_po()		+	"', 	\n";						//직급관리자
		sql += " "		+	vo.point()		+	", 		\n";						//적립금
		sql += " "		+	vo.deposit()	+	", 		\n";						//예치금
		sql += " '"		+	vo.card_name()	+	"', 	\n";						//카드사명
		sql += " '"		+	vo.card_no()	+	"', 	\n";						//신용카드번호
		sql += " '"		+	vo.pay_method()	+	"', 	\n";						//결제수단선택 0,1,2
		sql += " '"		+	vo.pay_str()	+	"'  	\n";						//결제수단선택 0:예치금,1:적립금,2:신용카드
		sql += ")";
		System.out.println(className + " Create [make SQL] :\n" + sql);
		System.out.println(className + " Create [run SQL]");
		this.RunSQL(sql);
		//데이터베이스 연결을 종료한다.
		System.out.println(className + " Create [DB close]");
		this.DBClose();
		return true;
	}

	//	계정 활성 검사 no	//	리턴값 : ERROR - 오류, ACTIVATE - 활성, DEACTIVATE - 비활성
	public int CheckActivete(int no)
	{
		//데이터베이스에 연결한다.
		if(this.DBOpen() == false) { System.out.println(className + " CheckActivete [DB open] fail"); return ERROR; }

		//활성 검사 SQL을 실행한다.
		sql = "select no from " + tableName + " where no = '" + no +"' and act = '1' ";
		System.out.println(className + " CheckActivete [make SQL] :\n" + sql);
		System.out.println(className + " CheckActivete [Open Query]");
		this.OpenQuery(sql);
		if(this.GetNext() == true)
		{
			//계정이 활성상태임
			System.out.println(className + " CheckActivete [result] : ACTIVATE");
			System.out.println(className + " CheckActivete [close Query]");
			this.CloseQuery();
			System.out.println(className + " CheckActivete [DB close]");
			this.DBClose();
			return ACTIVATE;
		}
		//계정이 비활성상태임
		System.out.println(className + " CheckActivete [result] : DEACTIVATE");
		System.out.println(className + " CheckActivete [close Query]");
		this.CloseQuery();
		//데이터베이스 연결을 종료한다.
		System.out.println(className + " CheckActivete [DB close]");
		this.DBClose();
		return DEACTIVATE;
	}

	//	계정 활성 검사 fno, id	//	리턴값 : ERROR - 오류, ACTIVATE - 활성, DEACTIVATE - 비활성
	public int CheckActivete(String str, String type)
	{
		//type이 "id"나 "fno"의 값이 아닐때
		if(!type.equals("id") && !type.equals("fno")) { System.out.println(className + " CheckActivete [parameta] ERROR"); return ERROR; }

		//계정이 있는지 확인한다
		if(IsDuplicate(str,type) == accountDTO.NOT_DUPLICATE) { System.out.println(className + " CheckActivete [result] account are not exist"); return ERROR; }

		//데이터베이스에 연결한다.
		if(this.DBOpen() == false)
		{ System.out.println(className + " CheckActivete [DB open] fail"); return ERROR; }

		//type에 따라 where 문을 결정한다.
		where =	(type.equals("id")) ? "where id = '" + str + "' " : "where fno = '" + str + "' " ;

		//활성검사 SQL을 실행한다.
		sql = "select no from " + tableName + " " + where + "and act = '1' ";
		System.out.println(className + " CheckActivete [make SQL] :\n" + sql);
		System.out.println(className + " CheckActivete [Open Query]");
		this.OpenQuery(sql);
		if(this.GetNext() == true)
		{
			//계정이 활성상태임
			System.out.println(className + " CheckActivete [result] : ACTIVATE");
			System.out.println(className + " CheckActivete [close Query]");
			this.CloseQuery();
			System.out.println(className + " CheckActivete [DB close]");
			this.DBClose();
			return ACTIVATE;
		}

		//활성검사 SQL을 실행한다.
		sql = "select no from " + tableName + " " + where + "and act = '0' ";
		System.out.println(className + " CheckActivete [make SQL] :\n" + sql);
		System.out.println(className + " CheckActivete [Open Query]");
		this.OpenQuery(sql);
		if(this.GetNext() == true)
		{
			//계정이 비활성상태임
			System.out.println(className + " CheckActivete [result] : DEACTIVATE");
			System.out.println(className + " CheckActivete [close Query]");
			this.CloseQuery();
			//데이터베이스 연결을 종료한다.
			System.out.println(className + " CheckActivete [DB close]");
			this.DBClose();
			return DEACTIVATE;
		}
		//계정이 비활성상태임
		System.out.println(className + " CheckActivete [result] : DEACTIVATE");
		System.out.println(className + " CheckActivete [close Query]");
		this.CloseQuery();
		//데이터베이스 연결을 종료한다.
		System.out.println(className + " CheckActivete [DB close]");
		this.DBClose();
		return DEACTIVATE;
	}

	//	계정 중복 검사 no	//	리턴값 : ERROR - 오류, DUPLICATE - 중복, NOT_DUPLICATE - 중복아님
	public int IsDuplicate(int no)
	{
		//데이터베이스에 연결한다.
		if(this.DBOpen() == false) { System.out.println(className + " IsDuplicate [DB open] fail"); return ERROR; }

		//중복검사 SQL을 실행한다.
		sql = "select no from " + tableName + " where no = " + no;
		System.out.println(className + " IsDuplicate [make SQL] :\n" + sql);
		System.out.println(className + " IsDuplicate [Open Query]");
		this.OpenQuery(sql);
		if(this.GetNext() == true)
		{
			//no가 중복됨
			System.out.println(className + " IsDuplicate [result] : DUPLICATE");
			System.out.println(className + " IsDuplicate [close Query]");
			this.CloseQuery();
			System.out.println(className + " IsDuplicate [DB close]");
			this.DBClose();
			return DUPLICATE;
		}
		System.out.println(className + " IsDuplicate [result] : NOT_DUPLICATE");
		System.out.println(className + " IsDuplicate [close Query]");
		this.CloseQuery();
		//데이터베이스 연결을 종료한다.
		System.out.println(className + " IsDuplicate [DB close]");
		this.DBClose();
		return NOT_DUPLICATE;
	}

	//	계정 중복 검사 fno, id 	//	리턴값 : ERROR - 오류, DUPLICATE - 중복, NOT_DUPLICATE - 중복아님
	public int IsDuplicate(String str, String type)
	{
		//str이 비정상일때
		if(str.equals("") || str == null) { System.out.println(className + " IsDuplicate [parameta] ERROR"); return ERROR; }
		//type이 "id"나 "fno"의 값이 아닐때
		if(!type.equals("id") && !type.equals("fno")) { System.out.println(className + " IsDuplicate [parameta] ERROR"); return ERROR; }

		//데이터베이스에 연결한다.
		if(this.DBOpen() == false) { System.out.println(className + " IsDuplicate [DB open] fail"); return ERROR; }

		//type에 따라 where 문을 결정한다.
		where =	(type.equals("id")) ? "where id = '" + str + "' " : "where fno = '" + str + "' " ;

		//중복검사 SQL을 실행한다.
		sql = "select no from " + tableName + " " + where;
		System.out.println(className + " IsDuplicate [make SQL] :\n" + sql);
		System.out.println(className + " IsDuplicate [Open Query]");
		this.OpenQuery(sql);
		if(this.GetNext() == true)
		{
			//계정이 중복됨
			System.out.println(className + " IsDuplicate [result] : DUPLICATE");
			System.out.println(className + " IsDuplicate [close Query]");
			this.CloseQuery();
			System.out.println(className + " IsDuplicate [DB close]");
			this.DBClose();
			return DUPLICATE;
		}
		System.out.println(className + " IsDuplicate [result] : NOT_DUPLICATE");
		System.out.println(className + " IsDuplicate [close Query]");
		this.CloseQuery();
		//데이터베이스 연결을 종료한다.
		System.out.println(className + " IsDuplicate [DB close]");
		this.DBClose();
		return NOT_DUPLICATE;
	}

	//	아이디를 찾는다 이름, 이메일, 전화번호 	//	리턴값 : null - 찾기 실패, accountVO - 찾기 성공
	public accountVO Searchid(String str,String type)
	{
		accountVO vo = null;

		//type이 "name", "hp", "em"의 값이 아닐때
		if(!type.equals("name") && !type.equals("hp") && !type.equals("em")) { System.out.println(className + " Searchid [parameta] ERROR"); return vo; }

		//type에 따라 where 문을 결정한다.
		where =	(type.equals("name"))	?	"where name = '" + str + "' "	:
				(type.equals("hp"))	?	"where hp = '" + str + "' "	:
													"where em = '" + str + "' " ;

		//데이터베이스에 연결한다.
		if(this.DBOpen() == false) { System.out.println(className + " Searchid [DB open] fail"); return vo; }

		//	name, hp, em 중 하나를 이용하여 id를 가져온다.
		sql  = "select no, fno, id from " + tableName + " " + where;
		System.out.println(className + " Searchid [make SQL] :\n" + sql);
		System.out.println(className + " Searchid [Open Query]");
		this.OpenQuery(sql);
		if(this.GetNext() == false)
		{
			//데이터베이스 연결을 종료한다.
			System.out.println(className + " Searchid [close Query]");
			this.CloseQuery();
			System.out.println(className + " Searchid [DB close]");
			this.DBClose();
			return vo;
		}

		//로그인 사용자 VO를 생성한다.
		vo = new accountVO();
		vo.no(this.GetInt("no"));
		vo.fno(this.GetValue("fno"));
		vo.id(this.GetValue("id"));

		//데이터베이스 연결을 종료한다.
		System.out.println(className + " Searchid [close Query]");
		this.CloseQuery();
		System.out.println(className + " Searchid [DB close]");
		this.DBClose();
		return vo;
	}

	//	비밀번호를 찾는다 id 필수, 이메일 혹은 전화번호 필요	//	리턴값 : null - 찾기 실패, accountVO - 찾기 성공
	public accountVO Searchpw(String id, String em, String hp)
	{
		accountVO vo = null;

		//type에 따라 where 문을 결정한다.
		where =	"where id = '" + id + "' and hp = '" + hp + "' and em = '" + em + "' " ;

		//데이터베이스에 연결한다.
		if(this.DBOpen() == false) { System.out.println(className + " Searchpw [DB open] fail"); return vo; }

		//id, hp 혹은 em를 이용하여 아이디 정보를 가져온다.
		sql  = "select no, fno from " + tableName + " " + where;
		System.out.println(className + " Searchpw [make SQL] :\n" + sql);
		System.out.println(className + " Searchpw [Open Query]");
		this.OpenQuery(sql);
		if(this.GetNext() == false)
		{
			//데이터베이스 연결을 종료한다.
			System.out.println(className + " Searchpw [close Query]");
			this.CloseQuery();
			System.out.println(className + " Searchpw [DB close]");
			this.DBClose();
			return vo;
		}

		//로그인 사용자 VO를 생성한다.
		vo = new accountVO();
		vo.no(this.GetInt("no"));
		vo.fno(this.GetValue("fno"));
		vo.em(em);
		vo.id(id);

		//데이터베이스 연결을 종료한다.
		System.out.println(className + " Searchpw [close Query]");
		this.CloseQuery();
		System.out.println(className + " Searchpw [DB close]");
		this.DBClose();
		return vo;
	}

	public int deactivate(accountVO vo)
	{
		//데이터베이스에 연결한다.
		if(this.DBOpen() == false) { System.out.println(className + " deactivate [DB open] fail"); return ERROR; }

		//계정이 있는지 확인한다
		if( IsDuplicate(vo.no()) != accountDTO.DUPLICATE) { System.out.println(className + " deactivate [result] account are not exist"); return NOT_DUPLICATE; }

		// 비활성 상태로 변경한다
		sql  = "update " + tableName + " ";
		sql += "set act = '0' ";			//0:비활성 1:활성
		sql += "where no = " + vo.no();
		System.out.println(className + " deactivate [make SQL] : " + sql);
		System.out.println(className + " deactivate [run SQL]");
		this.RunSQL(sql);
		//데이터베이스 연결을 종료한다.
		System.out.println(className + " deactivate [DB close]");
		this.DBClose();
		return DEACTIVATE;
	}

	//리턴값 : null - 로그인 실패, adminVO - 로그인 성공
	public accountVO Login(accountVO vo)
	{
		vo.info("accountVO Login");
		//계정 중복 검사 fno
		if(vo.fno()!=null)
		{
//			if(IsDuplicate(vo.fno(),"fno")==accountDTO.DUPLICATE)
//			{ System.out.println(className + " Login [result] fno are not exist"); return null; }
			//계정 활성 검사 fno
			if(CheckActivete(vo.fno(),"fno") == accountDTO.DEACTIVATE)
			{ System.out.println(className + " Login [CheckActivete] fno DEACTIVATE"); return null; }
		}
		//계정 중복 검사 id
		if(vo.id()!=null)
		{
//			if(IsDuplicate(vo.id(),"id")!=accountDTO.DUPLICATE)
//			{ System.out.println(className + " Login  [result] id are not exist"); return null; }
			//계정 활성 검사 id
			if(CheckActivete(vo.id(),"id") == accountDTO.DEACTIVATE)
			{ System.out.println(className + " Login [CheckActivete] id DEACTIVATE"); return null; }
		}

		//데이터베이스에 연결한다.
		if(this.DBOpen() == false) { System.out.println(className + " Login [DB open] fail"); return null; }

		//fno, id 여부에 따라 where 문을 결정한다.
		where =	(vo.fno()!=null)	?	"where fno = '"	+ vo.fno()	+ "' "	:
				(vo.id()!=null)		?	"where id = '"	+ vo.id()	+ "' and pw = md5('" + vo.pw() +"') "	: "";

		//fno, id,pw를 이용하여 로그인 정보를 가져온다.
		sql  = "select * from " + tableName + " ";
		sql += where;
		System.out.println(className + " Login [make SQL] : " + sql);
		System.out.println(className + " Login [Open Query]");
		this.OpenQuery(sql);
		if(this.GetNext() == false)
		{
			//데이터베이스 연결을 종료한다.
			System.out.println(className + " Login [Close Query]");
			this.CloseQuery();
			System.out.println(className + " Login [DB Close]");
			this.DBClose();
			return null;
		}

		//로그인 사용자 VO를 생성한다.
		accountVO loginVO = new accountVO(
			this.GetInt("no"			),										//일련번호
			this.GetValue("fno"			),										//고유번호
			this.GetValue("id"			),										//아이디
			"",																	//비밀번호
			this.GetValue("level"		),										//계정구분 0,1
			this.GetValue("name"		),										//이름
			this.GetValue("nickname"	),										//닉네임
			this.GetValue("gen"			),										//성별
			this.GetValue("age"			),										//생일
			this.GetValue("hp"			),										//핸드폰번호
			this.GetValue("em"			),										//이메일
			this.GetDate("cre_date"		),										//생성일
			this.GetDate("last_date"	),										//최종접속일
			this.GetValue("act"			),										//활성여부 0,1
			this.GetInt("st_no"			),										//담당매장번호관리자
			this.GetValue("ad_po"		),										//직급관리자
			this.GetInt("point"			),										//적립금
			this.GetInt("deposit"		),										//예치금
			this.GetValue("card_name"	),										//카드사명
			this.GetValue("card_no"		),										//신용카드번호
			this.GetValue("pay_method"	)
		);

		//생성된 vo의 정보를 출력한다.
		System.out.println(className + " Login [created vo info] : ");
		loginVO.info(className + " Login");
		System.out.println(className + " Login [Close Query]");
		this.CloseQuery();

		//로그인 기록을 갱신한다.
		sql  = " update " + tableName + " set last_date = now() ";
		sql += " where no = " + loginVO.no();
		System.out.println(className + " Login [update admin last_date]");
		System.out.println(className + " Login [nake SQL] : " + sql);
		System.out.println(className + " Login [run SQL]");
		this.RunSQL(sql);
		System.out.println(className + " Login [Close Query]");
		this.CloseQuery();

		//로그인 로그를 기록한다 //0= 직원 1=회원
		sql  = "insert into access (account_kind, account_no, acc_time) ";
		sql += "values ( " + loginVO.level() + ", " + loginVO.no() + ", now() )";
		System.out.println(className + " Login [write log] ");
		System.out.println(className + " Login [make SQL] : " + sql);
		System.out.println(sql);
		System.out.println(className + " Login [run SQL] ");
		this.RunSQL(sql);
		System.out.println(className + " Login [Close Query]");
		this.CloseQuery();

		//데이터베이스 연결을 종료한다.
		System.out.println(className + " Login [DB Close]");
		this.DBClose();
		return loginVO;
	}

		//	계정 변경	//	리턴값 : true-완료, false-오류
		public boolean Update(accountVO vo)
		{
			vo.info(className + " Update");												//받아온 vo의 정보를 출력한다.

			//계정이 있는지 확인한다.
			if(vo.fno()!=null)
			{ if(IsDuplicate(vo.fno(),"fno")!=accountDTO.DUPLICATE) { System.out.println(className + " Update [result] account are not exist"); return false; }}
			if(vo.id()!=null)
			{ if(IsDuplicate(vo.id(),"id")!=accountDTO.DUPLICATE) { System.out.println(className + " Update [result] account are not exist"); return false; }}

			System.out.println(className + " Update [DB open]");							//데이터베이스에 연결한다.
			if(this.DBOpen() == false) { System.out.println(className + " Update [DB open] fail"); return false; }

			//admin 테이블에 Insert하는 구문을 만든다.
			sql	 ="";
			sql += "update " + tableName + " set ";
			if(vo.id() != null && !vo.id().equals("")) {
										sql += "id =  '"			+	vo.id()			+	"', 	\n";}	//아이디
			if(vo.pw() != null && !vo.pw().equals("")) {
										sql += "pw =  md5('"		+	vo.pw()			+	"'), 	\n";}	//비밀번호
			if(vo.level() != null && !vo.level().equals("")) {
										sql += "level =  '"			+	vo.level()		+	"', 	\n";	//계정구분 0,1
										sql += "level_str =  '"		+	vo.level_str()	+	"', 	\n";}	//계정구분 0:이용자,1:관리자
			if(vo.name() != null && !vo.name().equals("")) {
										sql += "name =  '"			+	vo.name()		+	"', 	\n";}	//이름
			if(vo.nickname() != null && !vo.nickname().equals("")) {
										sql += "nickname =  '"		+	vo.nickname()	+	"', 	\n";}	//닉네임
			if(vo.gen() != null && !vo.gen().equals("")) {
										sql += "gen =  '"			+	vo.gen()		+	"', 	\n";	//성별 0,1
										sql += "gen_str =  '"		+	vo.gen_str()	+	"', 	\n";}	//성별 0:여성, 1:남성
			if(vo.age() != null && !vo.age().equals("")) {
										sql += "age =  '"			+	vo.age()		+	"', 	\n";}	//생일
			if(vo.hp() != null && !vo.hp().equals("")) {
										sql += "hp =  '"			+	vo.hp()			+	"', 	\n";}	//핸드폰번호
			if(vo.em() != null && !vo.em().equals("")) {
										sql += "em =  '"			+	vo.em()			+	"', 	\n";}	//이메일
										sql += "last_date =  now()"	+						", 		\n";	//최종접속일
			if(vo.act() != null && !vo.act().equals("")) {
										sql += "act =  '"			+	vo.act()		+	"', 	\n";	//활성여부 0,1
										sql += "act_str =  '"		+	vo.act_str()	+	"', 	\n";}	//활성여부 0:비활성,1:활성
										sql += "st_no =  '"			+	vo.st_no()		+	"', 	\n";	//담당매장번호관리자
										sql += "ad_po =  '"			+	vo.ad_po()		+	"', 	\n";	//직급관리자
										sql += "point =  "			+	vo.point()		+	", 		\n";	//적립금
										sql += "deposit =  "		+	vo.deposit()	+	", 		\n";	//예치금
			if(vo.card_name() != null && !vo.card_name().equals("")) {
										sql += "card_name =  '"		+	vo.card_name()	+	"', 	\n";}	//카드사명
			if(vo.card_no() != null && !vo.card_no().equals("")) {
										sql += "card_no =  '"		+	vo.card_no()	+	"', 	\n";}	//신용카드번호
			if(vo.pay_method() != null && !vo.pay_method().equals("")) {
										sql += "pay_method =  '"	+	vo.pay_method()	+	"', 	\n";	//결제수단선택 0,1,2
										sql += "pay_str =  '"		+	vo.pay_str()	+	"'  	\n";}	//결제수단선택 0:예치금,1:적립금,2:신용카드
										sql += "where no = "		+	vo.no();
			System.out.println(className + " Update [make SQL] :\n" + sql);
			System.out.println(className + " Update [run SQL]");
			this.RunSQL(sql);
			//데이터베이스 연결을 종료한다.
			System.out.println(className + " Update [DB close]");
			this.DBClose();
			return true;
		}

		//비밀번호 업데이트용
		public boolean UpdatePW(String id, String pw)
		{
			//계정이 있는지 확인한다.
			if(!id.equals(""))
			{ if(IsDuplicate(id,"id")!=accountDTO.DUPLICATE) { System.out.println(className + " UpdatePW [result] account are not exist"); return false; }}

			System.out.println(className + " UpdatePW [DB open]");							//데이터베이스에 연결한다.
			if(this.DBOpen() == false) { System.out.println(className + " UpdatePW [DB open] fail"); return false; }

			//admin 테이블에 Insert하는 구문을 만든다.
			sql	 ="";
			sql += "update " + tableName + " set pw = md5('" + pw + "') where id = '" + id + "'";
			System.out.println(className + " UpdatePW [make SQL] :\n" + sql);
			System.out.println(className + " UpdatePW [run SQL]");
			this.RunSQL(sql);
			//데이터베이스 연결을 종료한다.
			System.out.println(className + " UpdatePW [DB close]");
			this.DBClose();
			return true;
		}
}