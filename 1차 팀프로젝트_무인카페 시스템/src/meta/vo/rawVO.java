package meta.vo;

public class rawVO
{
	private	int		raw_no;		//기본재료번호(PK)
	private	String	raw_name;	//재료이름
	private	String	unit;		//단위

	public	int		raw_no()	{ return raw_no;	}	//기본재료번호(PK)
	public	String	raw_name()	{ return raw_name;	}	//재료이름
	public	String	raw_unit()	{ return unit;		}	//단위

	public	void	raw_no(	 int	raw_no	) { this.raw_no	  =	raw_no;	 }	//기본재료번호(PK)
	public	void	raw_name(String	raw_name) { this.raw_name =	raw_name;}	//재료이름
	public	void	raw_unit(String	unit	) { this.unit	  =	unit;	 }	//단위
}
