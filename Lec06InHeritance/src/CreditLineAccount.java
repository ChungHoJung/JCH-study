
public class CreditLineAccount extends Account {
	
	int creditLine;		//마이너스 한도
	
	public CreditLineAccount(String accountNo,String ownerName,int balance,int creditLine) {
		super(accountNo,ownerName,balance);
		this.creditLine = creditLine;
	}
	
	
	//출금 , 오버라이딩, overoide Annotation
	@Override		//override Annotation
	int withdraw(int amount){
		
		if((creditLine + balance) < amount) {
			System.out.println("잔액부족");
			return 0;
		}
		
		balance -= amount;
		return amount;
	}
}
