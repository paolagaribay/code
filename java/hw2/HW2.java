import javax.crypto.Cipher;
import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.BadPaddingException;
import java.security.MessageDigest;
import java.io.File;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.charset.StandardCharsets;
import java.util.Arrays;
import java.util.Scanner;
// BEGIN SOLUTION
// please import only standard libraries and make sure that your code compiles and runs without unhandled exceptions 
// END SOLUTION
 
public class HW2 {    
  static void P1() throws Exception {
    byte[] cipherBMP = Files.readAllBytes(Paths.get("cipher1.bmp"));
    
    // BEGIN SOLUTION
    byte[] key = new byte[] { 7, 7, 7, 7, 
                             7, 7, 7, 7, 
                             7, 7, 7, 7, 
                             7, 7, 7, 7 };
	SecretKeySpec key_spec = new SecretKeySpec(key, "AES");
	byte[] IV = new byte[] { 0, 0, 0, 0, 
                             0, 0, 0, 0, 
                             0, 0, 0, 0, 
                             0, 0, 0, 0 };
	IvParameterSpec iv_spec = new IvParameterSpec(IV);
	Cipher cipher = Cipher.getInstance("AES/CFB/NoPadding");
	cipher.init(Cipher.DECRYPT_MODE, key_spec, iv_spec);
    byte[] plainBMP = cipher.doFinal(cipherBMP);
    // END SOLUTION
    
    Files.write(Paths.get("plain1.bmp"), plainBMP);
  }

  static void P2() throws Exception {
    // BEGIN SOLUTION
    Scanner scanner = new Scanner(new File("messages.txt"));
		while (scanner.hasNextLine()) {
			String message = scanner.nextLine();
			MessageDigest md = MessageDigest.getInstance("MD5");
			md.update(message.getBytes());
			byte[] digest = md.digest();
			if (digest[0] == 70 && digest[1] == 124 && digest[2] == 72)
			{
				System.out.println(message);
			}
		}
		scanner.close();
    // END SOLUTION
  }

  static void P3() throws Exception {
    byte[] cipherBMP = Files.readAllBytes(Paths.get("cipher3.bmp"));
    
    // BEGIN SOLUTION
	byte[] key = Files.readAllBytes(Paths.get("plain1.bmp"));
	System.arraycopy(key, 0, cipherBMP, 0, 999);
    byte[] modifiedBMP = cipherBMP;    
    // END SOLUTION
    
    Files.write(Paths.get("cipher3_modified.bmp"), modifiedBMP);
  }

  static void P4() throws Exception {
    byte[] cipherPNG = Files.readAllBytes(Paths.get("cipher4.png"));
    
    // BEGIN SOLUTION
	Cipher cipher = Cipher.getInstance("AES/CBC/NoPadding");
	byte[] key = new byte[]{ 0, 0, 0, 0, 
							 0, 0, 0, 0, 
                             0, 0, 0, 0, 
                             0, 0, 0, 0 };
	byte[] IV = new byte[] { 0, 0, 0, 0, 
                             0, 0, 0, 0, 
                             0, 0, 0, 0, 
                             0, 0, 0, 0 };
	IvParameterSpec iv_spec = new IvParameterSpec(IV);
    byte[] plainPNG = new byte[cipherPNG.length];
	
	loop:
	for (int i = 0; i < 100; i++)
	{
		for (int j = 1; j < 13; j++)
		{
			for (int k = 1; k < 32; k++)
			{
				if (!(plainPNG[1] == 80 && plainPNG[2] == 78 && plainPNG[3] == 71))
				{
					 key[0] = (byte) i;
					 key[1] = (byte) j;
					 key[2] = (byte) k;
					SecretKeySpec key_spec = new SecretKeySpec(key, "AES");
					cipher.init(Cipher.DECRYPT_MODE, key_spec, iv_spec);
					plainPNG = cipher.doFinal(cipherPNG);
				}
				else
				{
					break loop;
				}
				
			}
		}
	}
    // END SOLUTION
    Files.write(Paths.get("plain4.png"), plainPNG);
  }

  public static void main(String [] args) {
    try {  
      P1();
      P2();
      P3();
      P4();
    } catch (Exception e) {
      e.printStackTrace();
    } 
  }
}
