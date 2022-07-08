package meta.vo;

public class recipeVO
{
	private	int		rec_no;		//기본레시피번호(PK)

	private	int		def_no;		//기본상품번호(FK)
	private	String	cat_no;		//카테고리번호(FK)
	private	int		div_no;		//세부상품번호(FK)

	private	rawVO	raw;		//기본본재료객체
	private	int		rcp_quan;	//수량

	public	int		rec_no()	{ return rec_no;	}
	public	int		def_no()	{ return def_no;	}
	public	int		div_no()	{ return div_no;	}
	public	String	cat_no()	{ return cat_no;	}
	public	rawVO	raws()		{ return raw;		}
	public	int		rcp_quan()	{ return rcp_quan;	}

	public	void	rec_no(	 int	rec_no	) { this.rec_no		= rec_no;	}
	public	void	def_no(	 int	def_no	) { this.def_no		= def_no;	}
	public	void	div_no(	 int	div_no	) { this.div_no		= div_no;	}
	public	void	cat_no(	 String	cat_no	) { this.cat_no		= cat_no;	}
	public	void	raws(	 rawVO	raws	) { this.raw		= raws;		}
	public	void	rcp_quan(int	rcp_quan) { this.rcp_quan	= rcp_quan;	}
}
