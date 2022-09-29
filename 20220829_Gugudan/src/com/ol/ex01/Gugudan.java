package com.ol.ex01;

public class Gugudan {
	public static void main(String[] args) {
		 
		int dan1 = 1;
		int dan2 = 6;
		 for(int gugu = 2; gugu < 10; gugu++) { 
			 if(gugu % 2 == 0) {
				 System.out.print(gugu + " x " + dan1 + " = " + (gugu * dan1) + "\t"); 
			 } else if(gugu % 2 != 0 && dan2 <= 9) {
				 System.out.print(gugu + " x " + dan2 + " = " + (gugu * dan2) + "\t"); 
			 } else if(gugu % 2 != 0 && dan2 == 10) {
				 System.out.print("\t\t");
			 }
			 
			 if(gugu == 9) {
				 gugu = 1;
				 System.out.println();
				 dan1 += 1;
				 dan2 += 1;
			 } else if(gugu == 8 && dan1 == 5) {
				 break;
			 }
			 
		 }
		 
		
	}

}
