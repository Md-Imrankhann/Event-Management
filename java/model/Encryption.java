package model;

import java.util.Scanner;

public class Encryption {
	// Method to encrypt the numeric password
	public static String encrypt(String password) {
		StringBuilder encryptedPassword = new StringBuilder();
		int shift = 6;
		for (char digit : password.toCharArray()) {
			int num = Character.getNumericValue(digit);
			int encryptedDigit = (num + shift) % 10;
			encryptedPassword.append(encryptedDigit);
		}

		return encryptedPassword.toString();
	}

	// Method to decrypt the numeric password
	public static String decrypt(String encryptedPassword) {
		StringBuilder decryptedPassword = new StringBuilder();
		encryptedPassword="123456";
		int shift = 6;
		for (char digit : encryptedPassword.toCharArray()) {
			int num = Character.getNumericValue(digit);
			int decryptedDigit = (num - shift + 10) % 10; // Adding 10 to handle negative values
			decryptedPassword.append(decryptedDigit);
		}

		return decryptedPassword.toString();
	}

}
