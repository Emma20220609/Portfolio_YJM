/******************************************************************************
* 수정자 : 함경환
* 수정일 : 2022-05-25 오후 03:28
******************************************************************************/
package meta.dto;

import java.util.ArrayList;

import	meta.dbms.*;
import	meta.vo.*;

public class BoardDTO extends DBManager
{
	//게시물을 등록한다.
	public boolean Insert(boardVO vo)
	{
		//데이터베이스에 연결한다.
		if(this.DBOpen() == false) return false;

		//게시물 등록 SQL 실행
		String sql  = "";
		sql += " insert into board (no, board_title, board_date, board_kind, board_note) ";
		sql += " values (";
		sql += " '"	+	vo.getno()						+	"', ";
		sql += " '"	+	vo.checkForSql(vo.getBoard_title())	+	"', ";
		sql += " 	now()		, ";
		sql += " '"	+	vo.checkForSql(vo.getBoard_kind())	+	"', ";
		sql += " '"	+	vo.checkForSql(vo.getBoard_note())	+	"' )";
		System.out.println(sql);
		this.RunSQL(sql);

		//등록된 게시물의 번호를 얻는다.
		sql = "select last_insert_id() as no ";
		this.OpenQuery(sql);
		this.GetNext();
		int board_no = this.GetInt("no");
		this.CloseQuery();
		vo.setBoard_no(board_no);

		//첨부파일을 등록한다.
		if(vo.getAttachs() != null)
		{
			for(attachVO attach : vo.getAttachs())
			{
				sql  = "insert into attach (board_no, ad_no, att_pname, att_lname) ";
				sql += "values (";
				sql += " " + vo.getBoard_no() + ",";
				sql += " " + vo.getno() + ",";
				sql += "'" + attach.getAtt_pname() + "',";
				sql += "'" + attach.getAtt_lname() + "')";
				this.RunSQL(sql);
			}
		}
		//데이터베이스 연결을 종료한다.
		this.DBClose();
		return true;
	}
	
	//게시물을 삭제한다.
	public boolean Delete(String board_no)
	{
		//데이터베이스에 연결한다.
		if(this.DBOpen() == false) return false;

		String sql = "";

		//댓글 정보를 삭제한다.
		sql  = " delete from comment ";
		sql += " where board_no = " + board_no + " ";
		this.RunSQL(sql);

		//첨부파일을 삭제한다.
		sql  = " delete from attach ";
		sql += " where board_no = " + board_no + " ";
		this.RunSQL(sql);

		//게시물을 삭제한다.
		sql  = " delete from board ";
		sql += " where board_no = " + board_no + " ";
		this.RunSQL(sql);

		//데이터베이스 연결을 종료한다.
		this.DBClose();
		return true;
	}

	//게시물 정보를 변경한다.
	public boolean Update(boardVO vo)
	{
		//데이터베이스에 연결한다.
		if(this.DBOpen() == false) return false;

		String sql = "";

		//게시물을 업데이트 한다.
		sql  = " update board ";
		sql += " set ";
		sql += " board_title = '"	+ vo.checkForSql(vo.getBoard_title())	+ "', ";
		sql += " board_kind = '"	+ vo.checkForSql(vo.getBoard_kind())	+ "', ";
		sql += " board_note = '"	+ vo.checkForSql(vo.getBoard_note())	+ "'  ";
		sql += " where board_no = "	+ vo.getBoard_no() ;
		this.RunSQL(sql);

		//첨부파일을 업데이트 한다.
		if(vo.getAttachs() != null)
		{
			for(attachVO attach : vo.getAttachs())
			{
				System.out.println("첨부파일 업데이트");
				sql = "delete from attach where board_no = " + vo.getBoard_no() + " ";
				this.RunSQL(sql);
				sql  = "insert into attach (board_no, ad_no, att_pname, att_lname) ";
				sql += "values (";
				sql += " " + vo.getBoard_no() + ",";
				sql += " " + vo.getno() + ",";
				sql += "'" + attach.getAtt_pname() + "',";
				sql += "'" + attach.getAtt_lname() + "')";
				this.RunSQL(sql);
			}
		}

		//데이터베이스 연결을 종료한다.
		this.DBClose();
		return true;
	}

	//게시물 정보를 조회한다.
	public boardVO Read(int board_no,boolean isHit)
	{
		boardVO vo = null;
		String sql = "";

		//데이터베이스에 연결한다.
		if(this.DBOpen() == false) return vo;

		//조회수 증가
		if(isHit == true)
		{
			sql  = "update board set board_hit = board_hit + 1 where board_no = " + board_no;
			this.RunSQL(sql);
		}

		//게시물의 정보를 얻는다.
		sql  = "select board_no,no,board_title,board_kind,board_note,board_date,board_hit ";
		sql += "from board ";
		sql += "where board_no = '" + board_no + "' ";
		System.out.println(sql);
		this.OpenQuery(sql);
		if(this.GetNext() == false)
		{
			this.CloseQuery();
			//데이터베이스 연결을 종료한다.
			this.DBClose();
			return vo;
		}
		//새 객체를 생성하고, 읽어온 게시글을 저장한다.
		vo = new boardVO();
		vo.setBoard_no(board_no);							//게시글번호
		vo.setno(this.GetInt("no"));						//직원번호
		vo.setBoard_title(this.GetValue("board_title"));	//제목
		vo.setBoard_kind(this.GetValue("board_kind"));		//게시글구분
		vo.setBoard_note(this.GetValue("board_note"));		//내용
		vo.setBoard_date(this.GetValue("board_date"));		//작성일
		vo.setBoard_hit(this.GetInt("board_hit"));			//조회수
		this.CloseQuery();

		//첨부파일을 읽어온다.
		sql  = "select file_no, board_no, ad_no, att_pname, att_lname ";
		sql += "from attach ";
		sql += "where board_no = '" + board_no + "' ";
		ArrayList<attachVO> attachs = new ArrayList<attachVO>(); 
		this.OpenQuery(sql);
		while(this.GetNext() == true)
		{
			//첨부파일 객체를 생성하고, DB에서 읽어온 정보를 저장한다.
			attachVO attach = new attachVO();
			attach.setFile_no(this.GetInt("file_no"));
			attach.setBoard_no(this.GetInt("board_no"));
			attach.setAd_no(this.GetInt("ad_no"));
			attach.setAtt_lname(this.GetValue("att_lname"));
			attach.setAtt_pname(this.GetValue("att_pname"));
			//리스트에 attach객체를 add한다
			attachs.add(attach);
		}
		vo.setAttachs(attachs);
		this.CloseQuery();
		//데이터베이스 연결을 종료한다.
		this.DBClose();
		return vo;
	}
}
