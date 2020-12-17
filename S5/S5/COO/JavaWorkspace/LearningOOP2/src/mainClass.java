
public class mainClass {

	public static void main(String[] args) {
		learnOOP myObj = new learnOOP(5);
		
		myObj.display();
		
		System.out.println(myObj.getX());

		myObj.setX(20);
		
		System.out.println(myObj.getX());

	}

}
