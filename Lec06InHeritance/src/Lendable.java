
public interface Lendable {
	
	

	public static final int STATE_NORMAL = 0;
	int STATE_BORROWED = 1;		//public static final 자동으로 등록
	
	//대출하다
	//public abstract(자동으로 들어감) 
	void checkOut(String borrower, String date);
	
	
	//반납하다
	public abstract void checkIn();
}
