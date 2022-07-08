/******************************************************************************
작성일 : 2022-05-24 오전 11:30
작성자 : 함경환
 ******************************************************************************/

package meta.vo;

public class cartVO {

	private int		cartlist_no;							//장바구니번호 PK
	//상품 VO에서 읽는 정보 세가지 
	//상품번호, 상품가격, 적립률
	private int		pro_no;									//상품번호
	private int		pro_price;								//상품가격
	private int		pro_acc;								//적립률
	//선택한 상품의 수량과 옵션
	private int		quan;									//선택수량
	private String	op01_name;								//옵션1이름
	private int		op01_quan;								//옵션1수량
	private int		op01_price;								//옵션1가격
	private String	op02_name;								//옵션2이름
	private int		op02_quan;								//옵션2수량
	private int		op02_price;								//옵션2가격
	private String	op03_name;								//옵션3이름
	private int		op03_quan;								//옵션3수량
	private int		op03_price;								//옵션3가격
	//이 장바구니 아이템의 총 가격과 총 포인트
	private int		sumPrice;								//총 가격
	private int		sumPoint;								//총 포인트

	//기본 생성자
	public cartVO() {}
	
	//DB에 넣을 용도로 사용하는 생성자
	//상품VO와 수량, 옵션을 직접 넣는다
	public cartVO(
			productsVO vo,										//선택 상품
			int		quan,										//선택 수량
			String	op01_name,									//옵션1이름
			int		op01_quan,									//옵션1수량
			int		op01_price,									//옵션1가격
			String	op02_name,									//옵션2이름
			int		op02_quan,									//옵션2수량
			int		op02_price,									//옵션2가격
			String	op03_name,									//옵션3이름
			int		op03_quan,									//옵션3수량
			int		op03_price									//옵션3가격
			)
		{
			//입력받은 상품 VO에서 상품번호, 상품가격, 적립률을 뽑아낸다
			this.pro_no		 = vo.pro_no();						//상품번호
			this.pro_price	 = vo.price();						//상품가격
			this.pro_acc	 = vo.acc();						//적립률
			//인자로 받은 정보를 넣는다
			this.quan		 = quan;							//선택수량
			this.op01_name	 = op01_name;						//옵션1이름
			this.op01_quan	 = op01_quan;						//옵션1수량
			this.op01_price	 = op01_price;						//옵션1가격
			this.op02_name	 = op02_name;						//옵션2이름
			this.op02_quan	 = op02_quan;						//옵션2수량
			this.op02_price	 = op02_price;						//옵션2가격
			this.op03_name	 = op03_name;						//옵션3이름
			this.op03_quan	 = op03_quan;						//옵션3수량
			this.op03_price	 = op03_price;						//옵션3가격
			//총 가격과, 총 포인트를 계산한다
			this.sumPrice();									//총 가격
			this.sumPoint();									//총 가격
		}

	// DB에서 읽어올때 사용하는 생성자
	public cartVO(
		int		cartlist_no,									//장바구니번호
		int		pro_no,											//상품번호
		int		pro_price,										//상품가격
		int		pro_acc,										//적립률
		int		quan,											//선택수량
		String	op01_name,										//옵션1이름
		int		op01_quan,										//옵션1수량
		int		op01_price,										//옵션1가격
		String	op02_name,										//옵션2이름
		int		op02_quan,										//옵션2수량
		int		op02_price,										//옵션2가격
		String	op03_name,										//옵션3이름
		int		op03_quan,										//옵션3수량
		int		op03_price,										//옵션3가격
		int		sumPrice,										//총 가격
		int		sumPoint										//총 포인트
		)
	{
		this.Cartlist_no(cartlist_no);							//장바구니번호
		this.Pro_no(pro_no);									//상품번호
		this.Pro_price(pro_price);								//상품가격
		this.Pro_acc(pro_acc);									//적립률
		this.Quan(quan);										//선택수량
		this.Op01_name(op01_name);								//옵션1이름
		this.Op01_quan(op01_quan);								//옵션1수량
		this.Op01_price(op01_price);							//옵션1가격
		this.Op02_name(op02_name);								//옵션2이름
		this.Op02_quan(op02_quan);								//옵션2수량
		this.Op02_price(op02_price);							//옵션2가격
		this.Op03_name(op03_name);								//옵션3이름
		this.Op03_quan(op03_quan);								//옵션3수량
		this.Op03_price(op03_price);							//옵션3가격
		this.SumPrice(sumPrice);								//총 가격
		this.SumPoint(sumPoint);								//총 포인트
	}

	//getter
	public	int		Cartlist_no() { return cartlist_no;	}	//장바구니번호
	public	int		Pro_no()	  { return pro_no;		}	//상품번호
	public	int		Pro_price()	  { return pro_price;	}	//상품가격
	public	int		Pro_acc()	  { return pro_acc;		}	//적립률
	public	int		Quan()		  { return quan;		}	//선택수량
	public	String	Op01_name()	  { return op01_name;	}	//옵션1이름
	public	int		Op01_quan()	  { return op01_quan;	}	//옵션1수량
	public	int		Op01_price()  { return op01_price;	}	//옵션1가격
	public	String	Op02_name()	  { return op02_name;	}	//옵션2이름
	public	int		Op02_quan()	  { return op02_quan;	}	//옵션2수량
	public	int		Op02_price()  { return op02_price;	}	//옵션2가격
	public	String	Op03_name()	  { return op03_name;	}	//옵션3이름
	public	int		Op03_quan()	  { return op03_quan;	}	//옵션3수량
	public	int		Op03_price()  { return op03_price;	}	//옵션3가격
	public	int		SumPrice()	  { return sumPrice;	}	//총 가격
	public	int		SumPoint()	  { return sumPoint;	}	//총 포인트

	//setter
	public	void	Cartlist_no(int		cartlist_no	)	{ this.cartlist_no	= cartlist_no;	}	//장바구니번호
	public	void	Pro_no(		int		pro_no		)	{ this.pro_no		= pro_no;		}	//상품번호
	public	void	Pro_price(	int		pro_price	)	{ this.pro_price	= pro_price;	}	//상품가격
	public	void	Pro_acc(	int		pro_acc		)	{ this.pro_acc		= pro_acc;		}	//적립률
	public	void	Quan(		int		quan		)	{ this.quan			= quan;			}	//선택수량
	public	void	Op01_name(	String	op01_name	)	{ this.op01_name	= op01_name;	}	//옵션1이름
	public	void	Op01_quan(	int		op01_quan	)	{ this.op01_quan	= op01_quan;	}	//옵션1수량
	public	void	Op01_price(	int		op01_price	)	{ this.op01_price	= op01_price;	}	//옵션1가격
	public	void	Op02_name(	String	op02_name	)	{ this.op02_name	= op02_name;	}	//옵션2이름
	public	void	Op02_quan(	int		op02_quan	)	{ this.op02_quan	= op02_quan;	}	//옵션2수량
	public	void	Op02_price(	int		op02_price	)	{ this.op02_price	= op02_price;	}	//옵션2가격
	public	void	Op03_name(	String	op03_name	)	{ this.op03_name	= op03_name;	}	//옵션3이름
	public	void	Op03_quan(	int		op03_quan	)	{ this.op03_quan	= op03_quan;	}	//옵션3수량
	public	void	Op03_price(	int		op03_price	)	{ this.op03_price	= op03_price;	}	//옵션3가격
	public	void	SumPrice(	int		sumPrice	)	{ this.sumPrice		= sumPrice;		}	//총 가격
	public	void	SumPoint(	int		sumPoint	)	{ this.sumPoint		= sumPoint;		}	//총 포인트
	
	//총 가격을 계산한다.
	private	void	sumPrice() {
		int opPrice =	this.op01_price * this.op01_quan + 
						this.op02_price * this.op02_quan + 
						this.op03_price * this.op03_quan ;
		this.sumPrice = this.pro_price + opPrice;
	}
	//총 포인트를 계산한다.
	private	void	sumPoint() {
		this.sumPoint = (int)(this.sumPrice * this.pro_acc / 100);
		System.out.println(this.sumPoint);
	}
}
