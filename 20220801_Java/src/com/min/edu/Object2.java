package com.min.edu;

public class Object2 {

	public static void main(String[] args) {
		int num = 1;
		int num2 = 6;
		
		for (int i = 0; i < 5; i++) {
			for (int j = 2; j<= 9; j++) {				
				if(j%2 == 0) {
						System.out.printf("%dX%d=%d\t", j, num, j*num);
				}else if(num2 == 10) {
					System.out.printf("\t");
				}else if(j%2 != 0) {
					System.out.printf("%dX%d=%d\t", j, num2, j*num2);
				}
			}
			num++;
			num2++;
			System.out.println("");
		}
		
	}
}