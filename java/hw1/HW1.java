import java.nio.file.Files; 
import java.nio.file.Paths; 
import java.io.IOException;
// BEGIN SOLUTION
import java.util.Map.Entry;
import java.util.*;
import java.util.HashMap;
import java.math.*;
// END SOLUTION
public class HW1 {
  @SuppressWarnings("serial")
  
  /* Problem 1 */
  
  static final int alphaIndex = (int) 'A';
  
  static void Problem1() { // AFFINE CIPHER
    String cipherText = "Z ENIZNMN GWBG KA. RO ZD B LNLENA RQ B DNHANG RATBOZYBGZRO HBIINK U.W.B.O.G.R.L., PWRDN TRBI ZD GRGBI PRAIK KRLZOBGZRO. GWNZA UIBO ZD GR BHXJZAN B DJUNAPNBURO BOK GR WRIK GWN PRAIK ABODRL. Z QNBA GWBG PN KR ORG WBMN LJHW GZLN JOGZI GWNV DJHHNNK. Z WBMN ZOGNAHNUGNK GPR NOHAVUGNK LNDDBTND (HZUWNA_B.GSG BOK HZUWNA_E.GSG) GWBG PNAN DNOG EV KA. RO GR WZD HRODUZABGRA, LA. EIRPQZNIK. Z LBOBTNK GR KZDHRMNA GWN UIBZOGNSG RQ GWN QZADG LNDDBTN:\n\"LA. EIRPQZNIK, LV BDDRHZBGN PZII KNIZMNA GWN UBVLNOG ONSG QAZKBV BG ORRO. Z NSUNHG VRJ GR KNIZMNA GWN UIBOD QRA GWN DJUNAPNBURO ZO NSHWBOTN. VRJ DWRJIK NOHAVUG GWNL PZGW ENOKNAHZUWNA GR UANMNOG BOVRON QARL DGNBIZOT GWNL. Z PZII DUNHZQV GWN IRHBGZRO QRA GWN NSHWBOTN ZO LV ONSG LNDDBTN. KR ORG KBAN GR QBZI LN.\"\nZ ENIZNMN GWBG GWN DNHROK LNDDBTN PBD NOHAVUGNK JDZOT GWN DBLN FNV, EJG GWN NOHAVUGZRO IRRFD UNAQNHG, BOK Z PBD ORG BEIN GR EANBF ZG.\nUINBDN DNOK ANZOQRAHNLNOGD ZLLNKZBGNIV! Z GAZNK GR BHG HBJGZRJDIV, EJG Z WBMN B QNNIZOT GWBG KA. RO'D WNOHWLNO BAN ROGR LN. Z KRO'G FORP WRP IROT Z WBMN ENQRAN GWNV KZDHRMNA LV ZKNOGZGV BOK LV DNHANG WZKZOT";
    // BEGIN SOLUTION

    System.out.println("---Problem 1---");
    HashMap<Character,Integer> freq=new HashMap<Character,Integer>();
    
   for (int i = 0; i < cipherText.length(); i++) { //get frequencies
     char c = cipherText.charAt(i);
      if (Character.isLetter(c)) {
        Integer val = freq.get(c);
        if (val != null) {
              freq.put(c, new Integer(val + 1));
        }
        else {
              freq.put(c, 1);
          }
     }
   }
   System.out.println("Frequencies:");
   System.out.println(freq);

   Entry<Character, Integer> max = null;
   Entry<Character, Integer> secondMax = null;
  for(Entry<Character,Integer> entry : freq.entrySet()) //get highest & second highest char
  {
    if(max == null)
     {
         max = entry;
     }

     else if(max.getValue() < entry.getValue())
     {
    secondMax = max;
         max = entry;
     }
  }
   char highest = max.getKey();
   char second = secondMax.getKey();
   
   // get keys
   int cN = (int) highest - alphaIndex;
   int cG = (int) second - alphaIndex;
   int pE = (int)'E' - alphaIndex;
   int pT = (int)'T' - alphaIndex;
  
   //int p = Math.floorMod((pE-pT), 26);
   //p = 11
   int inv = 19;
   int k1 = Math.floorMod((cN - cG) * inv, 26);
   //k1 = 3
   int k2 = Math.floorMod(cN - pE * k1, 26);
   //k2 = 1
   int k1_inv = 9;
   
   System.out.println("Decryption:");
   for (char cipherChar : cipherText.toCharArray()) {
     if (Character.isLetter(cipherChar)) { // only letters are encrypted, punctuation marks and whitespace are not
       // following line converts letters to numbers between 0 and 25
       int cipher = (int) cipherChar - alphaIndex;
       int plain = Math.floorMod(k1_inv * (cipher - k2), 26); // decrypt
       // following line coverts numbers between 0 and 25 to letters
       char plainChar = (char) (plain + alphaIndex);
       System.out.print(plainChar);
     }
     else
       System.out.print(cipherChar);  
    }

   // END SOLUTION
   System.out.println();
 }
  /* Problem 2 */
  
  static void Problem2() throws IOException { // ONE TIME PAD
    byte[] cipherTextA = Files.readAllBytes(Paths.get("cipher_a.txt"));
    byte[] cipherTextB = Files.readAllBytes(Paths.get("cipher_b.txt"));
    // BEGIN SOLUTION

    System.out.println("---Problem 2---");
    // complete using Problem 1
    String plainTextAstring = "MR. BLOWFIELD, MY ASSOCIATE WILL DELIVER THE PAYMENT NEXT FRIDAY AT NOON. I EXPECT YOU TO DELIVER THE PLANS FOR THE SUPERWEAPON IN EXCHANGE. YOU SHOULD ENCRYPT THEM WITH BENDERCIPHER TO PREVENT ANYONE FROM STEALING THEM. I WILL SPECIFY THE LOCATION FOR THE EXCHANGE IN MY NEXT MESSAGE. DO NOT DARE TO FAIL ME.";
    byte[] plainTextA = plainTextAstring.getBytes();
    byte[] key = new byte[plainTextA.length];
    for (int i = 0; i < cipherTextA.length; i++) //xor plainTextA with cipherTextA to get key
    {
      key[i] = (byte) (plainTextA[i] ^ cipherTextA[i]);
    }
    byte[] plainTextB = new byte[cipherTextB.length];
    for (int i = 0; i < cipherTextB.length; i++) //xor key with cipherTextB to get plainTextB
    {
      plainTextB[i] = (byte) (key[i] ^ cipherTextB[i]);
    }    
    
    // END SOLUTION
    System.out.println(new String(plainTextB));
  }
  
  /* Problem 3 */
  
  public static byte[] benderDecrypt(int key, byte[] cipherText) { 
    byte[] p = new byte[cipherText.length]; 
    byte r = (byte)key; 
    for (int i = 0; i < p.length; i++) { 
        r = (byte)(r * key); p[i] = (byte)(cipherText[i] ^ r);
    } 
    return p;
  }
  
  public static boolean isEnglishText(byte[] bytes) {
    String punctuations = ".,'-\"";
    for (char chr : new String(bytes).toCharArray())
      if (!(Character.isLetterOrDigit(chr) || Character.isWhitespace(chr) || punctuations.contains(String.valueOf(chr))))
        return false;
      return true;
  } 

  static void Problem3() throws IOException { // BENDER CIPHER
    byte[] cipherText3 = Files.readAllBytes(Paths.get("cipher3.txt"));
    // BEGIN SOLUTION

    System.out.println("---Problem 3---");
    int key;
    byte[] plainText3 = new byte[cipherText3.length];
    
    for (int i = 1; i <= 254; i++) // test keys from range for english text message
    {
        if (!isEnglishText(plainText3)) {
          plainText3 = benderDecrypt(i, cipherText3);
          key = i;
        }
        else
          break;

    }

    // END SOLUTION
    String plainText3String = new String(plainText3);
    System.out.println(plainText3String);
  }
  
  public static void main(String [] args) throws IOException {
    Problem1();
    Problem2();
    Problem3();
  }  
}