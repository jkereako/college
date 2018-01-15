//Create and initialize an arrary

public class IntArray1 {
	public static void main(String[] args) {
		int list[] = { 87, 68, 94, 100, 83, 78, 85, 91, 76, 87 }; //declare an int array
		int counter; //declare and index for the array

		//list = new int [10]; //create room for 10 int elements

		for (counter = 0; counter < list.length; counter++) {
			System.out.println("[" + counter + "] " + list[counter]);
		}
	}
}