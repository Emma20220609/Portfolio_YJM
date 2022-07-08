/******************************************************************************
* 수정자 : 함경환
* 수정일 : 2022-05-25 오후 03:56
******************************************************************************/
package meta.vo;

import java.util.Date;

public class accountVO
{
	private	int			no;									//일련번호
	private	String		fno;								//고유번호
	private	String		id;									//아이디
	private	String		pw;									//비밀번호
	private	String		level;								//계정구분 0,1
	private	String		level_str;							//계정구분 0:이용자,1:관리자
	private	String		name;								//이름
	private	String		nickname;							//닉네임
	private	String		gen;								//성별 0,1
	private	String		gen_str;							//성별 0:여성 , 1:남성
	private	String		age;								//생일
	private	String		hp;									//핸드폰번호
	private	String		em;									//이메일
	private	Date		cre_date;							//생성일
	private	Date		last_date;							//최종접속일
	private	String		act;								//활성여부 0,1
	private	String		act_str;							//활성여부 0:비활성,1:활성
	private	int			st_no;								//담당매장번호관리자
	private	String		ad_po;								//직급관리자
	private	int			point;								//적립금
	private	int			deposit;							//예치금
	private	String		card_name;							//카드사명
	private	String		card_no;							//신용카드번호
	private	String		pay_method;							//결제수단선택 0,1,2
	private	String		pay_str;							//결제수단선택 0:예치금,1:적립금,2:신용카드

	/* 기본 생성자 */
	public	accountVO() {}

	/* 바코드로 로그인시 사용 */
	public	accountVO(String fno) { this.fno(fno); this.level("0"); }

	/* 아이디 비번으로 로그인시 사용 */
	public	accountVO(String id, String pw) { this.id(id); this.pw(pw); }

	/* 선불 카드 생성 고유번호, 이용자, 활성, 예치금, 지불방식 : 예치금 */
	public	accountVO(String fno, int deposit)
	{
		this.fno(fno);										//고유번호
		this.level("0");								//계정구분	0
		this.act("1");									//활성여부 1
		this.pay_method("0");							//결제수단선택 0
//		this.age("1970-01-01");
		this.deposit(deposit);								//예치금
	}

	// HOME 회원가입용
	public	accountVO(
			String		fno,									//고유번호
			String		id,										//아이디
			String		pw,										//비밀번호
			String		level,									//계정구분 0,1
			String		name,									//이름
			String		hp,										//핸드폰번호
			String		em										//이메일
		)
		{
			this.fno(		 fno			);					//고유번호
			this.id(		 id				);					//아이디
			this.pw(		 pw				);					//비밀번호
			this.level(		 "0"			);					//계정구분 0,1
			this.level_str(	 this.level()	);					//계정구분 0:이용자,1:관리자
			this.name(		 name			);					//이름
			this.hp(		 hp				);					//핸드폰번호
			this.em(		 em				);					//이메일
			this.act(		 "1"			);					//활성여부 0,1
			this.act_str(	 this.act()		);					//활성여부 0:비활성,1:활성
		}

	/* DTO 용 생성자 */
	public	accountVO(
		int			no,										//일련번호
		String		fno,									//고유번호
		String		id,										//아이디
		String		pw,										//비밀번호
		String		level,									//계정구분 0,1
		String		name,									//이름
		String		nickname,								//닉네임
		String		gen,									//성별 0,1
		String		age,									//생일
		String		hp,										//핸드폰번호
		String		em,										//이메일
		Date		cre_date,								//생성일
		Date		last_date,								//최종접속일
		String		act,									//활성여부 0,1
		int			st_no,									//담당매장번호관리자
		String		ad_po,									//직급관리자
		int			point,									//적립금
		int			deposit,								//예치금
		String		card_name,								//카드사명
		String		card_no,								//신용카드번호
		String		pay_method 								//결제수단선택 0,1,2
	)
	{
		this.no(		 no			);					//일련번호
		this.fno(		 fno		);					//고유번호
		this.id(		 id			);					//아이디
		this.pw(		 pw			);					//비밀번호
		this.level(		 level		);					//계정구분 0,1
		this.name(		 name		);					//이름
		this.nickname(	 nickname	);					//닉네임
		this.gen(		 gen		);					//성별 0,1
		this.age(		 age		);					//생일
		this.hp(		 hp			);					//핸드폰번호
		this.em(		 em			);					//이메일
		this.cre_date(	 cre_date	);					//생성일
		this.last_date(	 last_date	);					//최종접속일
		this.act(		 act		);					//활성여부 0,1
		this.st_no(		 st_no		);					//담당매장번호관리자
		this.ad_po(		 ad_po		);					//직급관리자
		this.point(		 point		);					//적립금
		this.deposit(	 deposit	);					//예치금
		this.card_name(	 card_name	);					//카드사명
		this.card_no(	 card_no	);					//신용카드번호
		this.pay_method( pay_method	);					//결제수단선택 0,1,2
		this.level_str(	 level		);					//계정구분 0:이용자,1:관리자
		this.gen_str(	 gen		);					//성별 0:여성, 1:남성
		this.act_str(	 act		);					//활성여부 0:비활성,1:활성
		this.pay_str(	 pay_method	);					//결제수단선택 0:예치금,1:적립금,2:신용카드
	}

/**	@return	no			*/	public	int			no()		 { return no;			}	//일련번호
/**	@return	fno			*/	public	String		fno()		 { return fno;			}	//고유번호
/**	@return	id			*/	public	String		id()		 { return id;			}	//아이디
/**	@return	pw			*/	public	String		pw()		 { return pw;			}	//비밀번호
/**	@return	level		*/	public	String		level()		 { return level;		}	//계정구분 0,1
/**	@return	name		*/	public	String		name()		 { return name;			}	//이름
/**	@return	nickname	*/	public	String		nickname()	 { return nickname;		}	//닉네임
/**	@return	gen			*/	public	String		gen()		 { return gen;			}	//성별 0,1
/**	@return	age			*/	public	String		age()		 { return age;			}	//생일
/**	@return	hp			*/	public	String		hp()		 { return hp;			}	//핸드폰번호
/**	@return	em			*/	public	String		em()		 { return em;			}	//이메일
/**	@return	cre_date	*/	public	Date		cre_date()	 { return cre_date;		}	//생성일
/**	@return	last_date	*/	public	Date		last_date()	 { return last_date;	}	//최종접속일
/**	@return	act			*/	public	String		act()		 { return act;			}	//활성여부 0,1
/**	@return	st_no		*/	public	int			st_no()		 { return st_no;		}	//담당매장번호관리자
/**	@return	ad_po		*/	public	String		ad_po()		 { return ad_po;		}	//직급관리자
/**	@return	point		*/	public	int			point()		 { return point;		}	//적립금
/**	@return	deposit		*/	public	int			deposit()	 { return deposit;		}	//예치금
/**	@return	card_name	*/	public	String		card_name()	 { return card_name;	}	//카드사명
/**	@return	card_no		*/	public	String		card_no()	 { return card_no;		}	//신용카드번호
/**	@return	pay_method	*/	public	String		pay_method() { return pay_method;	}	//결제수단선택 0,1,2
/**	@return	level_str	*/	public	String		level_str()	 { return level_str;	}	//계정구분 0:이용자,1:관리자
/**	@return	gen_str		*/	public	String		gen_str()	 { return gen_str;		}	//성별 0:여성, 1:남성
/**	@return	act_str		*/	public	String		act_str()	 { return act_str;		}	//활성여부 0:비활성,1:활성
/**	@return	pay_str		*/	public	String		pay_str()	 { return pay_str;		}	//결제수단선택 0:예치금,1:적립금,2:신용카드

/**	@param	no			no			to set	*/	public	void	no(			int			no			) { this.no			= no;		 }	//일련번호
/**	@param	fno			fno			to set	*/	public	void	fno(		String		fno			) { this.fno		= fno;		 }	//고유번호
/**	@param	id			id			to set	*/	public	void	id(			String		id			) { this.id			= id;		 }	//아이디
/**	@param	pw			pw			to set	*/	public	void	pw(			String		pw			) { this.pw			= pw;		 }	//비밀번호
/**	@param	level		level		to set	*/	public	void	level(		String		level		) { this.level		= level;	this.level_str(level); }	//계정구분 0,1
/**	@param	name		name		to set	*/	public	void	name(		String		name		) { this.name		= name;		 }	//이름
/**	@param	nickname	nickname	to set	*/	public	void	nickname(	String		nickname	) { this.nickname	= nickname;	 }	//닉네임
/**	@param	gen			gen			to set	*/	public	void	gen(		String		gen			) { this.gen		= gen;		this.gen_str(gen); }	//성별
/**	@param	age			age			to set	*/	public	void	age(		String		age			) { this.age		= age;		 }	//생일
/**	@param	hp			hp			to set	*/	public	void	hp(			String		hp			) { this.hp			= hp;		 }	//핸드폰번호
/**	@param	em			em			to set	*/	public	void	em(			String		em			) { this.em			= em;		 }	//이메일
/**	@param	cre_date	cre_date	to set	*/	public	void	cre_date(	Date		cre_date	) { this.cre_date	= cre_date;	 }	//생성일
/**	@param	last_date	last_date	to set	*/	public	void	last_date(	Date		last_date	) { this.last_date	= last_date; }	//최종접속일
/**	@param	act			act			to set	*/	public	void	act(		String		act			) { this.act		= act;		this.act_str(act); }	//활성여부 0,1
/**	@param	st_no		st_no		to set	*/	public	void	st_no(		int			st_no		) { this.st_no		= st_no;	 }	//담당매장번호관리자
/**	@param	ad_po		ad_po		to set	*/	public	void	ad_po(		String		ad_po		) { this.ad_po		= ad_po;	 }	//직급관리자
/**	@param	point		point		to set	*/	public	void	point(		int			point		) { this.point		= point;	 }	//적립금
/**	@param	deposit		deposit		to set	*/	public	void	deposit(	int			deposit		) { this.deposit	= deposit;	 }	//예치금
/**	@param	card_name	card_name	to set	*/	public	void	card_name(	String		card_name	) { this.card_name	= card_name; }	//카드사명
/**	@param	card_no		card_no		to set	*/	public	void	card_no(	String		card_no		) { this.card_no	= card_no;	 }	//신용카드번호
/**	@param	pay_method	pay_method	to set	*/	public	void	pay_method(	String		pay_method	) { this.pay_method	= pay_method;this.pay_str(pay_method);}	//결제수단선택 0,1,2
/**	@param	level		level_str	to set	*/	public	void	level_str(	String		level		) { this.level_str	= (level.equals("0")) ? "이용자" : (level.equals("1")) ? "관리자" : "";	}	//계정구분	0:이용자/1:관리자
/**	@param	gen			gen_str		to set	*/	public	void	gen_str(	String		gen			) { this.gen_str	= (gen.equals("0")) ? "여성" : (gen.equals("1")) ? "남성" : "";			}	//성별 0:여성, 1:남성
/**	@param	act			act_str		to set	*/	public	void	act_str(	String	act				) { this.act_str	= (act.equals("0")) ? "비활성" : (act.equals("1")) ? "활성" : "";		}	//활성여부 0:비활성/1:활성
/**	@param	pay			pay_str		to set	*/	public	void	pay_str(	String	pay				) { this.pay_str	= (pay_method.equals("0")) ? "예치금" : (pay_method.equals("1")) ? "적립금" : (pay_method.equals("2")) ? "신용카드" : "";}	//결제수단선택 0:예치금/1:적립금/2:신용카드

	public	void	info(String str)
	{
		System.out.println("call from "		+ str				);				//어디서 호출했는지
		System.out.println("no________: " + this.no()			);				//일련번호
		System.out.println("fno_______: " + this.fno()		);				//고유번호
		System.out.println("id________: " + this.id()			);				//아이디
		System.out.println("pw________: " + this.pw()			);				//비밀번호
		System.out.println("level_____: " + this.level()		);				//계정구분 0,1
		System.out.println("level_str_: " + this.level_str()	);				//계정구분 0:이용자,1:관리자
		System.out.println("name______: " + this.name()		);				//이름
		System.out.println("nickname__: " + this.nickname()	);				//닉네임
		System.out.println("gen_______: " + this.gen()		);				//성별 0,1
		System.out.println("gen_str___: " + this.gen_str()	);				//성별 0:여성, 1:남성
		System.out.println("age_______: " + this.age()		);				//생일
		System.out.println("hp________: " + this.hp()			);				//핸드폰번호
		System.out.println("em________: " + this.em()			);				//이메일
		System.out.println("cre_date__: " + this.cre_date()	);				//생성일
		System.out.println("last_date_: " + this.last_date()	);				//최종접속일
		System.out.println("act_______: " + this.act()		);				//활성여부 0,1
		System.out.println("act_str___: " + this.act_str()	);				//활성여부 0:비활성,1:활성
		System.out.println("st_no_____: " + this.st_no()		);				//담당매장번호관리자
		System.out.println("ad_po_____: " + this.ad_po()		);				//직급관리자
		System.out.println("point_____: " + this.point()		);				//적립금
		System.out.println("deposit___: " + this.deposit()	);				//예치금
		System.out.println("card_name_: " + this.card_name()	);				//카드사명
		System.out.println("card_no___: " + this.card_no()	);				//신용카드번호
		System.out.println("pay_method: " + this.pay_method()	);				//결제수단선택 0,1,2
		System.out.println("pay_str___: " + this.pay_str()	);				//결제수단선택 0:예치금,1:적립금,2:신용카드
	}
}