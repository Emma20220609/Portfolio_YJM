package meta.vo;

import java.io.File;
import java.util.UUID;

public class imageVO
{
	private	int		pro_imgno;		//상품이미지번호
	private	int		pro_no;			//상품번호
	
	private	String	pro_lname;		//논리파일명
	private	String	pro_pname;		//물리파일명

	public	int		img_no()	{ return pro_imgno;	}
	public	int		pro_no()	{ return pro_no;	}
	public	String	img_lname()	{ return pro_lname;	}
	public	String	img_pname()	{ return pro_pname;	}

	public	void	img_imgno(int		pro_imgno)	{ this.pro_imgno = pro_imgno;	}
	public	void	pro_no(int			pro_no)		{ this.pro_no	 = pro_no;		}
	public	void	img_lname(String	pro_lname)	{ this.pro_lname = pro_lname;	}
	public	void	img_pname(String	pro_pname)	{ this.pro_pname = pro_pname;	}
	
	public void setAttach(String uploadPath,String filename)
	{
		if(filename == null || filename.equals(""))
		{
			this.pro_lname = "";
			this.pro_pname = "";			
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
		
		this.pro_lname = filename;
		this.pro_pname = phyname;
	}
}
