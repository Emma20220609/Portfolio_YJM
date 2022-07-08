/******************************************************************************
* 수정자 : 함경환
* 수정일 : 2022-05-25 오후 03:56
******************************************************************************/
package meta.test;

import java.util.ArrayList;

public class testList
{
	public static void main(String[] args)
	{
		testVO vo = new testVO();
		
		ArrayList<testVO> list = vo.getList();
		
		for(testVO item : list )
		{
			System.out.println(item.i);
		}
	}
}
