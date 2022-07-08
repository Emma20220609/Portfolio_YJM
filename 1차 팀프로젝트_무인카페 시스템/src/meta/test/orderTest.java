/******************************************************************************
* 수정자 : 함경환
* 수정일 : 2022-05-25 오후 03:56
******************************************************************************/
package meta.test;

import java.util.ArrayList;

import meta.dto.orderDTO;
import meta.dto.productsDTO;
import meta.vo.myfavinfoVO;
import meta.vo.orderVO;
import meta.vo.orderinfoVO;
import meta.vo.productsVO;

public class orderTest
{
	public static void main(String[] args)
	{
		//상품 DTO VO 생성
		productsDTO	pDTO	= new productsDTO();
		productsVO	pVO		= null;

		//주문 DTO VO 생성
		orderDTO	oDTO	= new orderDTO();
		orderVO		oVO		= new orderVO();

		//주문상세 객체
		orderinfoVO	oinfoVO	= new orderinfoVO();
		//주문상세 리스트
		ArrayList<orderinfoVO>	oinfoListVO	= new ArrayList<orderinfoVO>();
		//옵션선택 객체
		myfavinfoVO mfavVO	= new myfavinfoVO();
		//옵션선택 리스트
		ArrayList<myfavinfoVO>	myfavListVO	= new ArrayList<myfavinfoVO>();

		String		sel		= null;

		//메뉴 리스트 생성
		pDTO.GetMenuList();
		//0번 메뉴 선택 (리스트의 index가 0인 상품) / 기본상품번호 1 = 아메리카노
		pVO		= pDTO.GetMenuItem(0);

		//상품 리스트 생성
		sel		= pVO.hname();
		pDTO.GetProList(sel);
		//0번 상품 선택 (리스트의 index가 0인 상품) / 매장상품번호 2 = 아이스:톨
		pVO		= pDTO.GetProItem(0);

		//샷 1 추가
		mfavVO = new myfavinfoVO(3,1);			// 3:원두
		//옵션 리스트 생성
		myfavListVO.add(mfavVO);
		//시럽 1 추가
		mfavVO = new myfavinfoVO(4,1);			// 4:시럽
		//옵션 리스트에 추가
		myfavListVO.add(mfavVO);

		//0번상품을 주문 상세에 넣는다 // 아메리카노, 아이스:톨, 수량1 , 옵션선택 "1", 옵션리스트, 단품가격, 적립률
		oinfoVO = new orderinfoVO(pVO.pro_no(),1,"1",myfavListVO, pVO.price(), pVO.acc());
		//주문 상세 리스트 생성
		oinfoListVO.add(oinfoVO);

		// 0 비회원주문, 키오스크 번호, 수령시간, 주문상세 리스트
		oVO = new orderVO("0", 1, "05/23/2020 17:35:00", oinfoListVO);
		System.out.println(oVO.getItemlist().get(0).getPro_no());
		oDTO.insertOrder(oVO);
	}

}
