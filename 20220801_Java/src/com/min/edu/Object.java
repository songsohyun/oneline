package com.min.edu;

public class Object {
	public static void main(String[] args) {
		
		for (int i = 2; i < 10; i++) {
			if (i%2 == 0) {
				for (int j = 1; j <= 5; j++) {
					System.out.println(i + "X" + j + "=" + i*j );
				}
			}
			if(i%2 != 0) {
				for (int j = 6; j <= 9; j++) {
					System.out.println(i + "X" + j + "=" + i*j );
				}
			}	
		}	
	}
}
