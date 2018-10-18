
public class AppCDinfo extends CDinfo implements Lendable{

	String borrower; 	//대출인
	String date;		//대출일
	int state;			//대출상태(0:대출가능, 1:대출불가(대출중))
	
	public AppCDinfo(String registerNo, String title) {
		// TODO Auto-generated constructor stub
		super(registerNo,title);
	}

	@Override
	public void checkOut(String borrower, String date) {
		// TODO Auto-generated method stub
		if(this.state ==STATE_NORMAL) {
			this.borrower = borrower;
			this.date = date;
			this.state = STATE_BORROWED;
			System.out.println("===========브록cd 대출===========");
			System.out.println("부록cd: " + title + "이 대출되었습니다");
		}else {
			System.out.println("부록cd: " + title + "이 대출 불가능 합니다");
		}
	}

	@Override
	public void checkIn() {
		// TODO Auto-generated method stub
		this.borrower = null;
		this.date = null;
		this.state = STATE_NORMAL;
	}
}
