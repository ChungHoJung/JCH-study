
public class OverrideMain {
	public static void main(String[] args) {
		
		CreditLineAccount minus = new CreditLineAccount("123-456-7890", "설현", 200000, 5000000);
	
		// 자식 클래스에서 재정의한 메서드가 호출
		int money = minus.withdraw(500000);
		System.out.println("인출금액 :" + money);
		System.out.println("잔   액 :" + minus.balance);
		
		BonusPointAccount bonus = new BonusPointAccount("123-456-7891", "이이", 200000, 1000);
	
		bonus.deposit(2000000);
		System.out.println("인출금액 :" + bonus.balance);
		System.out.println("포 인 트 :" + bonus.bonusPoint);
	}
}
