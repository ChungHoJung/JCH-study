
public class CheckingAccount extends Account{
	
	//필드
	String carNo;	//카드번호
	

	CheckingAccount(String accountNo, String ownerName, int balance,String carNo){
		
		
		super(accountNo,ownerName,balance);	//상위 클래스의 생성자
			
		
		/*
		super.accountNo = accountNo;
		super.ownerName = ownerName;
		this.balance = balance;
		*/this.carNo = carNo;
	}
	
	//메서드
	//직불카드 사용액 지불
	//레퍼런스형 타입 비교x (데이터 타입 위치를 비교해서 다를 수 있음)-> equal 사용
	//@@@@@@
	int pay(String carNo, int amount) {
		if(!this.carNo.equals(carNo)|| balance < amount) {
			System.out.println("실행불가");
			return 0;
		}
		
		balance -= amount;
		return amount;
	}
}
