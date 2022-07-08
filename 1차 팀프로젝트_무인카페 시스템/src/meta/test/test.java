/******************************************************************************
* 수정자 : 함경환
* 수정일 : 2022-05-25 오후 03:56
******************************************************************************/
package meta.test;

import meta.dto.*;
import meta.vo.*;
import meta.util.*;

public class test
{
	public static void main(String[] args)
	{
		accountDTO DTO		= new accountDTO();
		accountVO vo		= new accountVO();
		accountVO loginVO	= null;
/*
// 이름으로 아이디 찾기
		vo = DTO.Searchid("홍길동", "name");
		vo.info("test");
// 전화번호로 아이디 찾기
		vo = DTO.Searchid("010-0000-1111", "hp");
		vo.info("test");
// 이메일로 아이디 찾기
		vo = DTO.Searchid("silverwoods@live.co.kr", "em");
		vo.info("test");
// 아이디와 전화번호로 비번 찾기
		vo = DTO.Searchpw("testadmin", "010-3333-5555", "hp");
		vo.info("test");
// 아이디와 이메일로 비번 찾기
		vo = DTO.Searchpw("test","silverwoods@live.co.kr", "em");
		vo.info("test");
*/

/*		vo.fno("1111101200110");
		vo.id("test1");
		vo.pw("1231");
		vo.level("0");
		vo.name("홍길동");
		vo.gen("1");
		vo.age("1980-03-01");
		vo.hp("010-5353-8787");
		vo.em("silverwoods@live.co.kr");
		vo.act("1");
		vo.pay_method("0");

		DTO.Create(vo);
		vo.pw("1231");
		vo.info("set pw");
		loginVO = DTO.Login(vo);
		loginVO.info("test.java"); */

// 아이디 비번으로 로그인
//		vo = new accountVO("test","1231","0");
//		loginVO = DTO.Login(vo);

/*
// 아이디 비번으로 로그인
		vo = new accountVO("ezen","1231","0");
		loginVO = DTO.Login(vo);

// 고유 번호로 로그인
		vo = new accountVO("1111100000110");
		loginVO = DTO.Login(vo);
*/
// 선불 카드 생성
		TempKey	temp	= new TempKey();
		String	u_fno	= temp.memberKey();
		vo = new accountVO(u_fno, 50000);
		DTO.Create(vo);
/*
// 카드 번호로 로그인
		vo = new accountVO("1212121212123");
		loginVO = DTO.Login(vo);
*/
/*
//  아이디 비번으로 로그인
		vo = new accountVO("test","1231");
		loginVO = DTO.Login(vo);

// 계정 업데이트
		loginVO.nickname("동에번쩍 modify");
//		loginVO.level("1");
		loginVO.age("1990-08-05");
		loginVO.pay_method("2");
//		loginVO.pw("1231");
		DTO.Update(loginVO); */
	}
}