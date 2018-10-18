
public class BonusPointAccount extends Account {
	
	int bonusPoint;			//보너스 포인트
	
	BonusPointAccount(String accountNo,String ownerName,int balance,int bonusPoint){
		super(accountNo,ownerName,balance);
		this.bonusPoint = bonusPoint;
	}
	
	//입금 오버라이딩
	void deposit(int amount) {
		balance += amount;
		bonusPoint += (amount * 0.001);
	}
}
