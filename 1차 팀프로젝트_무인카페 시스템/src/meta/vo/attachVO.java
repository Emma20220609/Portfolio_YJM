package meta.vo;

import java.io.File;
import java.util.UUID;

public class attachVO
{
	private	int		file_no;	//첨부파일번호(PK)
	private	int		board_no;	//게시글번호(PK)(FK)
	private	int		ad_no;		//직원번호(PK)(FK)
	private	String	att_lname;	//논리파일명
	private	String	att_pname;	//물리파일명

	public	int		getFile_no()	{ return file_no;	}
	public	int		getBoard_no()	{ return board_no;	}
	public	int		getAd_no()		{ return ad_no;		}
	public	String	getAtt_lname()	{ return att_lname;	}
	public	String	getAtt_pname()	{ return att_pname;	}

	public	void	setFile_no(	 int	file_no		) { this.file_no	= file_no;	}
	public	void	setBoard_no( int	board_no	) { this.board_no	= board_no;	}
	public	void	setAd_no(	 int	ad_no		) { this.ad_no		= ad_no;	}
	public	void	setAtt_lname(String	att_lname	) { this.att_lname	= att_lname;}
	public	void	setAtt_pname(String	att_pname	) { this.att_pname	= att_pname;}
	
	public void setAttach(String uploadPath,String filename)
	{
		if(filename == null || filename.equals(""))
		{
			this.att_lname = "";
			this.att_pname = "";			
			return;
		}
		//확장자를 얻는다.
		//String filename = "dog.Jpg";
		String extension = "";				

		int i = filename.lastIndexOf('.');
		if (i > 0) 
		{
			extension = filename.substring(i+1);
		}
		extension = extension.toLowerCase();
		
		String phyname		= UUID.randomUUID().toString() + "." + extension;
		String srcName		= uploadPath + "/" + filename;
		String targetName	= uploadPath + "/" + phyname;
		File srcFile		= new File(srcName);
		File targetFile		= new File(targetName);
		srcFile.renameTo(targetFile);		
		
		this.att_lname = filename;
		this.att_pname = phyname;
	}
	
}