package meta.vo;

public class myfavinfoVO {
	// myfavinfo 테이블
	private int		no;											// 옵션선택번호
	private int		raw_no;										// 기본재료번호
	private int		myf_quan;									// 수량
	private String	tbl_name;									// 테이블이름
	private int		dbr_sno;									// 레코드일련번호
	private int		optionPrice;								// 옵션 가격

	public myfavinfoVO() {}
	
	//주문 생성시 사용하는 생성자
	public myfavinfoVO(int raw_no, int myf_quan) {
		this.raw_no		 = raw_no;								// 기본재료번호
		this.myf_quan	 = myf_quan;							// 수량
	}
	
	//DB에서 읽어올때 사용하는 생성자
	public myfavinfoVO(int no, int raw_no, int myf_quan, String tbl_name, int dbr_sno) {
		this.no			 = no;									// 옵션선택번호
		this.raw_no		 = raw_no;								// 기본재료번호
		this.myf_quan	 = myf_quan;							// 수량
		this.tbl_name	 = tbl_name;							// 테이블이름
		this.dbr_sno	 = dbr_sno;								// 레코드일련번호
	}
	
	public	int		No()		{ return no;		}
	public	int		Raw_no()	{ return raw_no;	}
	public	int		Myf_quan()	{ return myf_quan;	}
	public	String	Tbl_name()	{ return tbl_name;	}
	public	int		Dbr_sno()	{ return dbr_sno;	}

	public	void	No(			int		no			) { this.no			 = no;			}
	public	void	Raw_no(		int		raw_no		) { this.raw_no		 = raw_no;		}
	public	void	Myf_quan(	int		myf_quan	) { this.myf_quan	 = myf_quan;	}
	public	void	Tbl_name(	String	tbl_name	) { this.tbl_name	 = tbl_name;	}
	public	void	Dbr_sno(	int		dbr_sno		) { this.dbr_sno	 = dbr_sno;		}
	
	public int sumPrice() {
		if(this.Raw_no() == 3) return this.myf_quan * 500;
		return 0;
	}
}
