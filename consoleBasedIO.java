import java.io.*;
import java.lang.*;

public class consoleBasedIO {
	public static void main(String args[]) {
		String str = "";
		int selection;
		double area;
		double radius;
		double diameter;
		BufferedReader in = new BufferedReader(new InputStreamReader(System.in));
		//Out a program run title to the console
		System.out.println("Compute Area of a Circle");
		//Output prompt that requests whether the input will be a radius or diameter
		System.out.println("Enter 1 for radius, or 2 for diameter");
		//Receive input type selection
		try {
			str = in.readLine();
		} catch (IOException e) {
		}
		//Convert the input selection to an interger and make sure it is correct
		selection = (int) Integer.parseInt(str);
		while (true) {
			if (selection != 1 && selection != 2) {
				System.out.println("Incorrect input specification. Please re-enter");
				try {
					str = in.readLine();
				} catch (IOException e) {
				}
				selection = Integer.parseInt(str);
			} else
				break;
		}
		//Compute the area according to the input specification
		if (selection == 1) //Radius
		{
			System.out.println("Please enter a radius:");
			try {
				str = in.readLine();
			} catch (IOException e) {
			}

			radius = Double.parseDouble(str);
			diameter = radius * 2;
			area = Math.PI * (radius * radius);

			System.out.println("Radius = " + radius + "Diameter = " + diameter + "Area = " + area);
		}

		if (selection == 2) //Diameter
		{
			System.out.println("Please enter a diameter:");
			try {
				str = in.readLine();
			} catch (IOException e) {
			}

			diameter = Double.parseDouble(str);
			radius = diameter / 2;
			area = Math.PI * (radius * radius);

			System.out.println("Radius = " + radius + "Diameter = " + diameter + "Area = " + area);
		}
	}
}
