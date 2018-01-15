//Create and initialize an arrary

public class IntArray2
{
	public static void main(String[] args)
	{
		int sum; //declare sum variable
		int list[]; //declare an int array
		int counter; //declare and index for the array
		long prod; //declare product variable
		double mean; //declare mean variable
		
		sum = 0;
		prod = 1;
		mean = 0;
		
		list = new int [10]; //create room for 10 int elements
		
		for (counter = 0; counter < list.length; counter++)
		{

			list [counter] = counter * 2 + 1;
			System.out.println("["+counter+"] "+list[counter]);
		
			sum = sum + list[counter];
			prod = prod * list[counter];
		}
		
		mean = sum / list.length;
		
		System.out.println("Sum = " + sum);
		System.out.println("Product = " + prod);
		System.out.println("Mean = " + mean);
			
	}
}