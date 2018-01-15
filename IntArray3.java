
// File InitArray3.java with more comments, as a guide....

import javax.swing.*;
import java.lang.*;

public class InitArray3 {
    public static void main(String args[]) {
        String str = "";
        int selection;
        int count = 0;
        double measurement;
        double measurements[] = new double[5];
        double sum;
        double product;
        double average;
        double min = 0;
        double max = 1000;

        for (i = 0; i < 5; i++) {

            str = JOptionPane.showInputDialog("Enter argument" + count + ": ");
            measurement = Double.parseDouble(str);
            measurements[i] = measurment;

            if (measurements[i] < min) {
                min = measurements[i];
            }

            if (measurements[i] > max) {
                max = measurements[i];
            }

            sum = sum + measurements[i];
            product = product + measurements[i];
            average = sum + measurements.length[i];
            System.out.println("Sum = " + sum);
        }
        // JOptionPane.showMessageDialog (null, "Left is: "    +    left    + 
        //     " str is: "     +   str +     " Right is: "   +    right);

        System.exit(0);
    }
}
