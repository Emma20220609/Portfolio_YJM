/******************************************************************************
* 수정자 : 함경환
* 수정일 : 2022-05-25 오후 03:56
******************************************************************************/
package meta.test;

import java.util.ArrayList;

public class testVO
{
	public String i = "";
	public String j = "";

	public ArrayList<testVO> getList()
	{
		ArrayList<testVO> list = new ArrayList<testVO>();
		for(int i = 0 ; i < 10 ; i++)
		{
			testVO a = new testVO();
			a.i = "i = " + i;
			list.add(a);
		}
		return list;
	}
}
