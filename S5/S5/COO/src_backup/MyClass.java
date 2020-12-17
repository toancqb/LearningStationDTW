
/*
 * String: stores text. String values are surrounded by double quotes
 * int: stores integers without decimals 123, -123
 * float: stores floating point numbers, with decimals 19.99f, 3.1415f
 * char: stores single characters, 'a', 'B' surrounded by single quotes
 * boolean: stores values: true or false
 * 
 *  Primitive data types: byte, short, int, long L, float f, double d, boolean, char
 *                         1      2     4     8        4        8         1      2    bytes
 *  Non-primitive data types: String, Arrays, Classes, Interface
 *  
 * Keywords:
 * - final: if you don't want to overwrite existing values (~constant): unchangeable and read-only
 * - static: means that the method belongs to the MyClass class and not an object of the MyClass
 * - void: the method does not have a return value
 * 
<<<<<<< HEAD
 * Method:
 * - Method overloeading: multiple methods can have the same name with different parameters
 *   Note: Multiple methods can have the same name as long as the number and/or type of parameters are different.
 * - 
=======
 * Widening Casting (automatically) - converting a smaller type to a larger type size
 * byte -> short -> char -> int -> long -> float -> double
 *
 * Narrowing Casting (manually) - converting a larger type to a smaller size type
 * double -> float -> long -> int -> char -> short -> byte

 * a class is a template for objects, and an object is an instance of a class.

 * When the individual objects are created, they inherit all the variables and methods from the class.
 * 
 * In the example above, we created a static method, 
 * which means that it can be accessed without creating an object of the class,
 *  unlike public, which can only be accessed by objects
 * 
 * Note that the constructor name must match the class name, 
 * and it cannot have a return type (like void).Also note that the constructor is called when the object is created.
 * 
 * https://www.w3schools.com/java/java_modifiers.asp

>>>>>>> 674bcf62339d1fade8561e9ed07655e37de07a59
 */

//import java.lang.Math;

public class MyClass {
<<<<<<< HEAD
	
	public static void learnSyntax() {
=======

	public void public_method() {
		System.out.println("public method");
	}

	static void static_method() {
		System.out.println("static method");
	}

	public static void main(String[] args) {
>>>>>>> 674bcf62339d1fade8561e9ed07655e37de07a59
		final int myNum = 150000; // Integer
		byte numByte = 100;
		short numShort = 1000;
		long numLong = 10000000000000000L;
		String myText = "Toan"; 
		float pi = 3.14f;
		double numDouble = 3.141593432432d; // it's safer using double than float in calculating
		char c = 'a';
		boolean bool = true;
		
		//String methods
		String txt = "ABCDEF";
		System.out.println(txt);
		System.out.println(txt.length());
		System.out.println(txt.indexOf("C"));
		System.out.println(txt.concat("GHIJK"));
		System.out.println((int)(Math.random()*101));
		
		int i = 0;
		while (i < 5) {
			System.out.print(i);
			i++;
		}
		for (i = 0; i < 5; i++) {
			System.out.print(i);
		}
		// For Each loop
		String[] cars = {"Volvo", "BMW", "Ford", "Mazda"};
		for (String str: cars) {
			System.out.println(str);
		}
		for (i = 0; i < cars.length; i++) {
			System.out.print(cars[i]);
		}
		int[] n = {5, 12, 546, 1, 456};
		for (int j: n) {
			System.out.print(j);
		}
		System.out.println("\n"+n.length);
		
		int[][] n_2d = {{0, 1, 2, 3, 4}, {5, 6, 7, 8, 9, 10}};
		for (i = 0; i < n_2d.length; i++) {
			for (int j = 0; j < n_2d[i].length; j++) {
				System.out.print(n_2d[i][j]+" ");
			}
			System.out.println("");
		}
<<<<<<< HEAD
		
		
=======

		Test test_obj = new Test();
		int att = test_obj.n;
		System.out.println(att);
		test_obj.setN(10);
		System.out.println(test_obj.n);
		MyClass tt = new MyClass();
		tt.public_method();
		static_method();
>>>>>>> 674bcf62339d1fade8561e9ed07655e37de07a59
 	}
}
