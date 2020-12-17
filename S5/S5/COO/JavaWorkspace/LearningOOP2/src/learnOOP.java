
/*
 * - Access Modifiers: controls the access level  
 * 
 * FOR CLASS:
 *  public: The class is accessible by any other class
 *  default: The class is only accessible by classed in the same package
 * FOR ATTRIBUTES, METHODS, CONSTRUCTORS:
 *  public: The code is accessible for all classes
 *  private: The code is accessible within the declared class
 *  default: The code is accessible in the same package
 *  protected: The code is accessible in the same package and subclasses
 *  
 * - Non-Access Modifiers: do not control access level, but provides other functionality
 * 
 * FOR CLASS:
 *  final: The class can not be inherited by other classes
 *  abstract: The class can not be used to create objects
 * FOR ATTRIBUTES, METHODS:
 *  final: Att and Method can not be overridden/modified
 *  static: Att and Method belongs to the class, rather than an object
 *  abstract: The method does not have a body. ex: abstract void run();
 *  transient: Att and method are skipped when serializing the object containing them
 *  synchronized: Method can only be accessed by one thread at a time
 *  volatile: The value of an attribute is not cached thread-locally, and is always read from the "main memory"
 *
 */


public class learnOOP {
	
	static int x;
	
	public learnOOP(int y)
	{
		x = y;
	}
	
	public void display() {
		System.out.println("Hello OOP");
	}
	
	public int getX()
	{
		return x;
	}
	
	public void setX(int y)
	{
		x = y;
	}
}