
public class InterfaceMain {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		/*
		SeparateVolume book1 = new SeparateVolume("거-4567", "이것이 자바다", "신용권");
		AppCDinfo cd1 = new AppCDinfo("789-56-513", "리눅스 설치부록cd");
		SeparateVolume book2 = new SeparateVolume("나-1234", "오라클 sql활용 ", "홍길동");
		AppCDinfo cd2 = new AppCDinfo("123-45-678", "MicroSof Office2010 cd");
		
		book1.checkOut("이산", "20181212");
		cd1.checkOut("이산", "20181212");		
		book2.checkOut("이산", "20181212");
		cd2.checkOut("이산", "20181212");
		*/
		
		Lendable[] lendlist = {
				new SeparateVolume("거-4567", "이것이 자바다", "신용권"),
				new AppCDinfo("789-56-513", "리눅스 설치부록cd"),
				new SeparateVolume("나-1234", "오라클 sql활용 ", "홍길동"),
				new AppCDinfo("123-45-678", "MicroSof Office2010 cd")
		};
		
		checkOutAll(lendlist,"설현", "2018-07-17");
		
	}
	public static void checkOutAll(Lendable[] lendlist, String borrower, String date) {
		for(int i=0; i<lendlist.length;i++) {
			lendlist[i].checkOut(borrower,date);
		}
	}
}
