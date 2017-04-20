package utils;

public class BodyMassIndex {

	public static double getBMI(double height, double weight) {
		if (height > 0 && weight > 0) {// convert height in meter
			double meterHeight = height / 100;
			// square height
			double squareHeight = meterHeight * meterHeight;
			return (int)(weight / squareHeight);
		} else {
			return 0;
		}
	}
}
