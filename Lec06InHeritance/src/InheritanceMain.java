
public class InheritanceMain {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		CheckingAccount check = new CheckingAccount("123-456-789", "설현", 200000, "123-456-789-1023");
		
		// 부모 클래스로 부터 상속 받은 메서드 호출,
		int amount = check.withdraw(20000);

		System.out.println("인출 금액:" + amount);
		System.out.println("잔    액:" + check.balance);
		
		amount = check.pay("123-456-789-1023", 150000);
		System.out.println("인출 금액:" + amount);
		System.out.println("잔    액:" + check.balance);
		
	}

}
