package com.study.start;

import java.util.Scanner;

public class To_mybros {
	public static void main(String[] args) {
		System.out.println("y/n");
		System.out.println("식사를 하셨으면 y , 안 하셨으면 N 을 입력하세요");
		Scanner sc = new Scanner(System.in);
	
	
	while (true) {
		String yesno_cheek = sc.next();
		if(yesno_cheek.equals("y") ||  yesno_cheek.equals("Y")){
			System.out.println("그래도 식사 하러 갑시다!");		
		 }else if
		  (yesno_cheek.equals("n") || yesno_cheek.equals("N")){
				System.out.println("식사 하러 갑시다!");
		 }else{
			 System.out.println("안됩니다 어서 골라요");
		 } 
		}
	}
}