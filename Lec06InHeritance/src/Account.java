
public class Account {
	
	// 멤버 필드
	String accountNo; //계좌번호
	String ownerName; //예금주
	int balance;      //잔액
	
	Account(){
		
	}
	//생성자
	Account(String accountNo,String ownerName,int balance ) {
		this.accountNo = accountNo;
		this.ownerName = ownerName;
		this.balance = balance;
	}
	
	//멤버 메서드
	
	
	//입금
	void deposit(int amount) {
		balance += amount;
	}
	
	//출금
	int withdraw(int amount){
		if(balance < amount) {
			System.out.println("잔액 부족");
			return 0;
		}
		balance-=amount;
		return amount;
	}
	
	
}
