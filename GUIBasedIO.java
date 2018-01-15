import javax.swing.*;
import java.lang.*;

public class GUIBasedIO {
	
		public static void main (String args[])
		{
			
			String str = "";
			int selection;
			double area;
			double radius;
			double diameter;
	//Output a program run title to the console.
			
			JOptionPane.showMessageDialog(null, "Calculate area of a circle given radius or diameter");
	//Output a prompt that requests whether the input will be a adius or diameter
			
			JOptionPane.showMessageDialog(null, "Enter a 1 to calculate using the radius, or 2 to calculate using the diameter");
	//Get the input type selection
	
			str = JOptionPane.showInputDialog("Enter input type: ");
			//Convert the input selection to an interger and make sure it is correct
			
				selection = Integer.parseInt(str);
				
				while (true)
				{
					if (selection !=1 && selection !=2)
					{
						str =  JOptionPane.showInputDialog("Enter input type: ");
						
						selection = Integer.parseInt (str);
					}
					else break;
				}
				
	//Compute the area according to the input specification
				if (selection ==1) //Radius
				{
					
					 str = JOptionPane.showInputDialog("Please enter a radius - ");
					 
					 radius = Double.parseDouble(str);
					 diameter = radius * 2;
					 area = Math.PI * (radius * radius);
					 
					  JOptionPane.showMessageDialog(null, "Radius =" + radius + "Diameter = " + diameter + "Area = " + area);
					 }
					 
					 if (selection == 2) //Diameter
					 {
					 	
					 	 str = JOptionPane.showInputDialog("Please enter a diameter - ");
					 	 
					 	 diameter = Double.parseDouble(str);
					 	 radius = diameter /2;
					 	 area = Math.PI * (radius * radius);
					 	 
					 	  JOptionPane.showMessageDialog(null, "Radius = " + radius + "Diameter = " + diameter + "Area = " + area);
					 }
					 
					 System.exit(0);
				}
			}
