package meta.util;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Random;
import meta.vo.accountVO;

public class TempKey
{

		private boolean lowerCheck;
		private int size;
		String mRandom = "";
		String memberKey ="";
		String pRandom = "";
		public static String  gettoday()
		{
			SimpleDateFormat dtf = new SimpleDateFormat("yyMMdd");
			Calendar calendar = Calendar.getInstance();
			Date dateObj = calendar.getTime();
			String formattedDate = dtf.format(dateObj);
			return formattedDate;


		}
		public static String getRandom()
		{
			String pRandom = "";
			for(int i=1; i <= 6; i++)
			{

				int mTemp = (int)((Math.random() * 10) % 10);
				System.out.print(mTemp);
				pRandom += Integer.toString(mTemp);
			}
			return pRandom;
		}

		public String memberKey()
		{
//			accountVO user = new accountVO();
			String mDate   = gettoday();
			String mUserNo = getRandom();
			mRandom = String.format("%013d", Long.parseLong(mDate + mUserNo));
			System.out.println(mRandom);
			return mRandom;
		}

		/*
		public String memberKey()
		{

			accountVO user = new accountVO();
			String mDate   = user.getU_joindate();
			String mUserNo = String.valueOf(user.getU_no());
			mRandom = String.format("%012d", Long.parseLong(mDate + mUserNo));
			System.out.println(mRandom);
			return mRandom;
		}
		*/
		/*
		public String memberKey()
		{
			String mDate   = "0510";
			String mUserNo = "7544";
			mRandom = String.format("%013d", Long.parseLong(mDate + mUserNo));

			return mRandom;
		}
		*/
		public String getKey(int size, boolean lowerCheck)
		{
			this.size = size;
			this.lowerCheck = lowerCheck;
			return init();
		}

		private String init()
		{
			Random ran = new Random();
			StringBuffer sb = new StringBuffer();
			int num  = 0;
			do {
				num = ran.nextInt(75) + 48;
				if ((num >= 48 && num <= 57) || (num >= 65 && num <= 90) || (num >= 97 && num <= 122)) {
					sb.append((char) num);
				} else {
					continue;
				}
			} while (sb.length() < size);
			if (lowerCheck) {
				return sb.toString().toLowerCase();
			}
			return sb.toString();
		}
		public static void main(String[] args)
	{
			String Userfno ="";
			String mRandom = "";
			TempKey temp = new TempKey();
			Userfno = temp.memberKey;

			System.out.println(Userfno);

			accountVO user = new accountVO();
			String mDate   = gettoday();
			String mUserNo = String.valueOf(user.no());
			mRandom = String.format("%012d", Long.parseLong(mDate + mUserNo));
			System.out.println(mRandom);
	}
}

