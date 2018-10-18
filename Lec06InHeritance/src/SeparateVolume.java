
public class SeparateVolume implements Lendable {

	String requestNo;		//청구 번호
	String bookTitle;		//책 제목
	String writer;			// 저자
	String borrower; 		//대출일
	String date;			//대출인
	int state;			//대출상태
	
	
	
	
	public SeparateVolume(String requestNo, String bookTitle, String writer){
		// TODO Auto-generated constructor stub
		this.requestNo = requestNo;
		this.bookTitle = bookTitle;
		this.writer = writer;
	}
	
	@Override
	public void checkOut(String borrower, String date) {
		// TODO Auto-generated method stub
		if(this.state ==STATE_NORMAL) {
			this.borrower = borrower;
			this.date = date;
			this.state = STATE_BORROWED;
			System.out.println("===========책 대출===========");
			System.out.println("단행본: " + bookTitle + "이 대출되었습니다");
		}else {
			System.out.println("단행본: " + bookTitle + "이 대출 불가능 합니다");
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
