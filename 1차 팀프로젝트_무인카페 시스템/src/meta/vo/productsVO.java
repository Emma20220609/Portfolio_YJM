/******************************************************************************

작성일 : 2022-05-19 오후 4:09
작성자 : 함경환
******************************************************************************/

package meta.vo;

import java.util.ArrayList;

import meta.dto.productsDTO;

public class productsVO {

/*	category		카테고리
	VARCHAR(4)		cat_no			카테고리번호
	VARCHAR(4)		group			그룹
	VARCHAR(2)		depth			심도
	VARCHAR(20)		cat_name		카테고리명 */

/*	def_product		기본상품
	INT				def_no			기본상품번호
	VARCHAR(4)		cat_no			카테고리번호
	VARCHAR(30)		def_hname		한글상품명
	VARCHAR(50)		def_ename		영문상품명
	TEXT			def_info		상품설명
	INT				def_rcpv		레시피개수 */

/*	div_product		세부상품
	INT				div_no			세부상품번호
	INT				def_no			기본상품번호
	VARCHAR(20)		div_name		세부상품명
	INT				volume			용량
	VARCHAR(4)		unit			단위
	INT				uprice			단가
	INT				price			판매가 */

/*	nutrition		영양정보
	INT				nutri_no		영양정보번호
	INT				def_no			기본상품번호
	VARCHAR(30)		nutri_name		영양성분명
	INT				nutri_quan		영양성분수량
	VARCHAR(4)		nutri_unit		단위 */

/*	product_image	상품이미지
	INT				pro_imgno		상품이미지번호
	INT				def_no			기본상품번호
	VARCHAR(255)	pro_lname		논리파일명
	VARCHAR(255)	pro_pname		물리파일명 */

/*	def_recipe		기본레시피
	INT				rec_no			기본레시피번호
	INT				div_no			세부상품번호
	INT				raw_no			기본재료번호
	INT				rcp_quan		수량 */

/*	raw				기본재료
	INT				raw_no			기본재료번호
	VARCHAR(30)		raw_name		재료이름
	VARCHAR(4)		unit			단위 */

/*	st_product		매장상품
	INT				pro_no			매장상품번호
	INT				st_no			매장번호
	INT				div_no			세부상품번호
	INT				pro_uprice		단가
	INT				pro_price		판매가
	VARCHAR(2)		pro_accok		적립여부
	INT	NULL		pro_acc			적립률
	VARCHAR(2)		pro_recom		추천여부
	VARCHAR(2)		pro_sell		판매여부
	VARCHAR(2)		pro_chrcp		레시피변경 */

/*	sale_product	판매상품
	INT				sp_no			판매상품번호
	INT				st_no			매장번호
	INT				machine_no		판매기계번호
	INT				pro_no			매장상품번호
	INT				sp_inven		재고량
	INT				sp_count		판매가능수량 */

/*	pro_list		매장상품 뷰
	int(11)			pro_no			매장상품번호
	varchar(20)		name			세부상품명
	varchar(30)		hname			상품명(한글)
	varchar(50)		ename			상품명(영문)
	varchar(20)		cat				카테고리명
	text			info			상품설명
	int(11)			volume			용량
	varchar(4)		unit			단위
	int(11)			price			판매가
	int(11)			acc				적립률
	varchar(2)		flag_recom		추천여부
	varchar(2)		flag_sell		판매여부
	varchar(2)		flag_rec		레시피변경 */

/*	menu_list		메뉴이름 뷰
	int(11)			def_no			기본상품번호
	varchar(30)		def_hname		상품명(한글)
	varchar(50)		def_ename		상품명(영문)
	varchar(2)		pro_sell		판매여부 */

/*	nu_list			영양정보 뷰
	int(11)			pro_no			매장상품번호
	varchar(30)		def_hname		상품명(한글)
	varchar(30)		nutri_name		영양성분명
	int(11)			nutri_quan		영양성분수량
	varchar(4)		nutri_unit		단위 */

/*	// 판매 상품 정보		pro_list table
	private int 	pro_no;								//	pro_no		from	st_product		매장상품번호
	private	String	name;								//	div_name	from	div_product		세부상품명
	private	String	hname;								//	def_hname	from	def_product		상품명(한글)
	private	String	ename;								//	def_ename	from	def_product		상품명(영문)
	private String 	cat;								//	cat_name	from	category		카테고리명
	private	String	info;								//	def_info	from	def_product		상품설명
	private	int		volume;								//	volume		from	div_product		용량
	private	String	unit;								//	unit		from	div_product		단위
	private	int		price;								//	pro_price	from	st_product		판매가
	private	int		acc;								//	pro_acc		from	st_product		적립률
	private	String	flag_recom;							//	pro_recom	from	st_product		추천여부
	private	String	flag_sell;							//	pro_sell	from	st_product		판매여부
	private	String	flag_rec;							//	pro_chrcp	from	st_product		레시피변경유무

	// 재고 정보
	private	int		sp_no;								//	sp_no		from	sale_product	판매상품번호
	private	int		sp_count;							//	sp_count	from	sale_product	판매가능수량
	private	int		sp_inven;							//	sp_inven	from	sale_product	재고량

	// 판매 상품 분류 목록
	private int		def_no;								//	def_no		from	def_product		기본상품번호
	private String	def_hname;							//	def_hname	from	def_product		상품명(한글)
	private String	def_ename;							//	def_ename	from	def_product		상품명(영문)
	private String	pro_sell;							//	pro_sell	from	st_product		판매여부

	//추가정보
	private	int		pro_uprice;							//	pro_uprice	from	st_product		단가

	//정보 찾기용
	private	String	cat_no;								//카테고리번호
	private	int		def_no;								//기본상품번호
	private	int		div_no;								//세부상품번호
	private	int		nutri_no;							//영양정보번호

	//영양 정보
	private ArrayList<nutriVO>	nutriList;				//상품 영양정보 객체
	private	String	nutri_name;							//영양성분명
	private	int		nutri_quan;							//영양성분수량
	private	String	nutri_unit;							//단위

	//상품 이미지
	private	imageVO[]	images;							//상품 이미지 객체 배열
	private	int		pro_imgno;							//상품이미지번호(PK)
	private	String	pro_lname;							//논리파일명
	private	String	pro_pname;							//물리파일명

	//상품 판매 정보
	private	int		def_rcpv;							//레시피개수
	private ArrayList<recipeVO>	reciList;				//상품 레시피 객체

	private	int		rec_no;								//	rec_no	from	def_recipe	기본레시피번호(PK)
	private	int		div_no;								//	div_no	from	def_recipe	세부상품번호(FK)
	private	rawVO	raw;								//기본본재료객체

	private	int		raw_no;								//기본재료번호(PK)
	private	String	raw_name;							//재료이름
	private	String	unit;								//단위

	private	int		rcp_quan;							//수량 */

	// 판매 상품 정보		pro_list table
	private int 	pro_no;										//	pro_no		from	st_product		매장상품번호
	private	String	name;										//	div_name	from	div_product		세부상품명
	private	String	hname;										//	def_hname	from	def_product		상품명(한글)
	private	String	ename;										//	def_ename	from	def_product		상품명(영문)
	private String 	cat;										//	cat_name	from	category		카테고리명
	private	String	info;										//	def_info	from	def_product		상품설명
	private	int		volume;										//	volume		from	div_product		용량
	private	String	unit;										//	unit		from	div_product		단위
	private	int		price;										//	pro_price	from	st_product		판매가
	private	int		acc;										//	pro_acc		from	st_product		적립률
	private	String	flag_recom;									//	pro_recom	from	st_product		추천여부
	private	String	flag_sell;									//	pro_sell	from	st_product		판매여부
	private	String	flag_rec;									//	pro_chrcp	from	st_product		레시피변경유무
	// 재고 정보
	private	int		sp_no;										//	sp_no		from	sale_product	판매상품번호
	private	int		sp_count;									//	sp_count	from	sale_product	판매가능수량
	private	int		sp_inven;									//	sp_inven	from	sale_product	재고량
	//추가 정보
	private	int		pro_uprice;									//	pro_uprice	from	st_product		단가
	private ArrayList<nutriVO>	nutriList;						//	상품 영양정보 객체
	private	ArrayList<imageVO>	images;							//	상품 이미지 객체 배열
	private	int		def_rcpv;									//	레시피개수
	private ArrayList<recipeVO>	reciList;						//	상품 레시피 객체

	public productsVO() {}
	
	public productsVO(productsDTO DTO, String type)
	{
		if(type.equals("menu_list"))
		{
			this.pro_no(DTO.GetInt("def_no"));
			this.hname(DTO.GetValue("def_hname"));
			this.ename(DTO.GetValue("def_ename"));	
		}else
		{
			this.pro_no(DTO.GetInt("pro_no"));
			this.name(DTO.GetValue("name"));
			this.hname(DTO.GetValue("hname"));
			this.ename(DTO.GetValue("ename"));
			this.cat(DTO.GetValue("cat"));
			this.proinfo(DTO.GetValue("info"));
			this.volume(DTO.GetInt("volume"));
			this.unit(DTO.GetValue("unit"));
			this.price(DTO.GetInt("price"));
			this.acc(DTO.GetInt("acc"));
			this.flag_recom(DTO.GetValue("flag_recom"));
			this.flag_sell(DTO.GetValue("flag_sell"));
			this.flag_rec(DTO.GetValue("flag_rec"));
		}
	}

	public	int		pro_no()				{ return pro_no;		}	// 	pro_no		from	st_product		매장상품번호
	public	String	name()					{ return name;			}	// 	div_name	from	div_product		세부상품명
	public	String	hname()					{ return hname;			}	// 	def_hname	from	def_product		상품명(한글)
	public	String	ename()					{ return ename;			}	// 	def_ename	from	def_product		상품명(영문)
	public	String	cat()					{ return cat;			}	// 	cat_name	from	category		카테고리명
	public	String	proinfo()				{ return info;			}	// 	def_info	from	def_product		상품설명
	public	int		volume()				{ return volume;		}	// 	volume		from	div_product		용량
	public	String	unit()					{ return unit;			}	// 	unit		from	div_product		단위
	public	int		price()					{ return price;			}	// 	pro_price	from	st_product		판매가
	public	int		acc()					{ return acc;			}	// 	pro_acc		from	st_product		적립률
	public	String	flag_recom()			{ return flag_recom;	}	// 	pro_recom	from	st_product		추천여부
	public	String	flag_sell()				{ return flag_sell;		}	// 	pro_sell	from	st_product		판매여부
	public	String	flag_rec()				{ return flag_rec;		}	// 	pro_chrcp	from	st_product		레시피변경유무
	public	int		sp_no()					{ return sp_no;			}	// 	sp_no		from	sale_product	판매상품번호
	public	int		sp_count()				{ return sp_count;		}	// 	sp_count	from	sale_product	판매가능수량
	public	int		sp_inven()				{ return sp_inven;		}	// 	sp_inven	from	sale_product	재고량
	public	int		pro_uprice()			{ return pro_uprice;	}	// 	pro_uprice	from	st_product		단가
	public	ArrayList<nutriVO> nutriList()	{ return nutriList;		}	//	상품 영양정보 객체
	public	ArrayList<imageVO> images()		{ return images;		}	//상품 이미지 객체 배열
	public	int		def_rcpv()				{ return def_rcpv;		}	//레시피개수
	public	ArrayList<recipeVO> reciList()	{ return reciList;		}	//상품 레시피 객체

	public	void pro_no(	int		pro_no		) { this.pro_no		 = pro_no;			}	//	pro_no		from	st_product		매장상품번호
	public	void name(		String	name		) { this.name		 = name;			}	//	div_name	from	div_product		세부상품명
	public	void hname(		String	hname		) { this.hname		 = hname;			}	//	def_hname	from	def_product		상품명(한글)
	public	void ename(		String	ename		) { this.ename		 = ename;			}	//	def_ename	from	def_product		상품명(영문)
	public	void cat(		String	cat			) { this.cat		 = cat;				}	//	cat_name	from	category		카테고리명
	public	void proinfo(	String	info		) { this.info		 = info;			}	//	def_info	from	def_product		상품설명
	public	void volume(	int		volume		) { this.volume		 = volume;			}	//	volume		from	div_product		용량
	public	void unit(		String	unit		) { this.unit		 = unit;			}	//	unit		from	div_product		단위
	public	void price(		int		price		) { this.price		 = price;			}	//	pro_price	from	st_product		판매가
	public	void acc(		int		acc			) { this.acc		 = acc;				}	//	pro_acc		from	st_product		적립률
	public	void flag_recom(String	flag_recom	) { this.flag_recom	 = flag_recom;		}	//	pro_recom	from	st_product		추천여부
	public	void flag_sell(	String	flag_sell	) { this.flag_sell	 = flag_sell;		}	//	pro_sell	from	st_product		판매여부
	public	void flag_rec(	String	flag_rec	) { this.flag_rec	 = flag_rec;		}	//	pro_chrcp	from	st_product		레시피변경유무
	public	void sp_no(		int		sp_no		) { this.sp_no		 = sp_no;			}	//	sp_no		from	sale_product	판매상품번호
	public	void sp_count(	int		sp_count	) { this.sp_count	 = sp_count;		}	//	sp_count	from	sale_product	판매가능수량
	public	void sp_inven(	int		sp_inven	) { this.sp_inven	 = sp_inven;		}	//	sp_inven	from	sale_product	재고량
	public	void pro_uprice(int		pro_uprice	) { this.pro_uprice	 = pro_uprice;		}	//	pro_uprice	from	st_product		단가
	public	void nutriList(	ArrayList<nutriVO> nutriList) { this.nutriList = nutriList;	}	//	상품 영양정보 객체
	public	void images(	ArrayList<imageVO> images	) { this.images		 = images;	}	//상품 이미지 객체 배열
	public	void def_rcpv(	int		def_rcpv	) { this.def_rcpv	 = def_rcpv;		}	//레시피개수
	public	void reciList(	ArrayList<recipeVO> reciList) { this.reciList = reciList;	}	//상품 레시피 객체
	
	public	void	getInfo(String str)
	{
		System.out.println("call from "		  + str						);				//어디서 호출했는지
		System.out.println( "pro_no_______: " + this.pro_no()			);			//	pro_no		from	st_product		매장상품번호
		System.out.println( "name_________: " + this.name()				);			//	div_name	from	div_product		세부상품명
		System.out.println( "hname________: " + this.hname()			);			//	def_hname	from	def_product		상품명(한글)
		System.out.println( "ename________: " + this.ename()			);			//	def_ename	from	def_product		상품명(영문)
		System.out.println( "cat__________: " + this.cat()				);			//	cat_name	from	category		카테고리명
		System.out.println( "info_________: " + this.proinfo()			);			//	def_info	from	def_product		상품설명
		System.out.println( "volume_______: " + this.volume()			);			//	volume		from	div_product		용량
		System.out.println( "unit_________: " + this.unit()				);			//	unit		from	div_product		단위
		System.out.println( "price________: " + this.price()			);			//	pro_price	from	st_product		판매가
		System.out.println( "acc__________: " + this.acc()				);			//	pro_acc		from	st_product		적립률
		System.out.println( "flag_recom___: " + this.flag_recom()		);			//	pro_recom	from	st_product		추천여부
		System.out.println( "flag_sell____: " + this.flag_sell()		);			//	pro_sell	from	st_product		판매여부
		System.out.println( "flag_rec_____: " + this.flag_rec()			);			//	pro_chrcp	from	st_product		레시피변경유무
		System.out.println( "sp_no________: " + this.sp_no()			);			//	sp_no		from	sale_product	판매상품번호
		System.out.println( "sp_count_____: " + this.sp_count()			);			//	sp_count	from	sale_product	판매가능수량
		System.out.println( "sp_inven_____: " + this.sp_inven()			);			//	sp_inven	from	sale_product	재고량
		System.out.println( "pro_uprice___: " + this.pro_uprice()		);			//	pro_uprice	from	st_product		단가
//		System.out.println( "nutriList____: " + this.nutriList()		);			//	상품 영양정보 객체
//		System.out.println( "images_______: " + this.images()			);			//	상품 이미지 객체 배열
		System.out.println( "def_rcpv_____: " + this.def_rcpv()			);			//	레시피개수
//		System.out.println( "reciList_____: " + this.reciList()			);			//	상품 레시피 객체
	}
}