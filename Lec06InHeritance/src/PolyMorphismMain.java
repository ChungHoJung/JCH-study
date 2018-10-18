
public class PolyMorphismMain {
	public static void main(String[] args) {
		
		Account acc = new Account("123-456-78910","이산",150000);
		
		//상위클래스 변수 = new 하위클래스();-> 업캐스팅(UpCasting)
		Account check = new CheckingAccount("123-456-7891", "설현", 450000, "123-456-789");
		//CheckingAccount check = new CheckingAccount("123-456-7891", "설현", 450000, "123-456-789");
		
		CreditLineAccount minus = new CreditLineAccount("134913-141-14", "홍길동", 30000, 50000);

		BonusPointAccount bonus = new BonusPointAccount("1231-123-123", "현빈", 50000, 1000);
	
		display(acc);
		display(check);	
		display(minus);	
		display(bonus);	
	}
	
	public static void display(Account acc) {
		System.out.println("계좌정보 출력");
		System.out.println("계좌번호 출력:" + acc.accountNo);
		System.out.println("예 금 주 :" + acc.ownerName);
		System.out.println("잔   액 :" + acc.balance);
		
		if(acc instanceof BonusPointAccount) {
		//다운 캐스팅, 원래의 형으로 복귀
		BonusPointAccount bonus = (BonusPointAccount)acc;
		System.out.println("포 인 트 :" + bonus.bonusPoint);
		System.out.println();
		}
	}
	

	/*public static void display(CheckingAccount acc) {
		System.out.println("계좌정보 출력");
		System.out.println("계좌번호 출력:" + acc.accountNo);
		System.out.println("예 금 주 :" + acc.ownerName);
		System.out.println("잔   액 :" + acc.balance);
		System.out.println();
	}
	
	public static void display(CreditLineAccount acc) {
		System.out.println("계좌정보 출력");
		System.out.println("계좌번호 출력:" + acc.accountNo);
		System.out.println("예 금 주 :" + acc.ownerName);
		System.out.println("잔   액 :" + acc.balance);
		System.out.println();
	}
	
	public static void display(BonusPointAccount acc) {
		System.out.println("계좌정보 출력");
		System.out.println("계좌번호 출력:" + acc.accountNo);
		System.out.println("예 금 주 :" + acc.ownerName);
		System.out.println("잔   액 :" + acc.balance);
		System.out.println();
	}*/
}
