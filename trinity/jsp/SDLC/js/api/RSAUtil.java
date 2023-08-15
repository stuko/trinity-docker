package kcb.open.api;

import java.security.KeyFactory;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.spec.RSAPublicKeySpec;

import javax.crypto.Cipher;

public class RSAUtil 
{
	 public static String ALGORITHM = "RSA";
	 public static String CHAR_SET = "utf-8";
	 public static String KEY_ALGORITHM = "RSA";
	
	 public static String string2HexString(String data)
	 {
		 //return bytes2HexString(data.getBytes());
		 return toHex(data);
	 }
	 
	 public static  String bytes2HexString(byte[] bytes) 
	 {
		    StringBuilder string = new StringBuilder();
		    for (byte b : bytes) 
		    {
		        String hexString = Integer.toHexString(0x00FF & b);
		        string.append(hexString.length() == 1 ? "0" + hexString : hexString);
		    }
		    return string.toString();
	 }
	
	 public static String toHex(String data)
	 {
		 	StringBuilder rep = new StringBuilder();
	        for (byte b : data.getBytes()) {
	            rep.append(Integer.toString((b & 0xff) + 0x100, 16).substring(1));
	        }
	        return rep.toString();
	 }
	 
	 public static String hex2String(String data)
	 {
		 return new String(hex2ByteArray(data)); 
	 }
	 
	 public static byte[] hex2ByteArray(String hex) 
	 {
	        if (hex == null || hex.length() % 2 != 0) 
	        {
	        	System.out.println("hex data is error");
	            return new byte[]{};
	        }
	
	        byte[] bytes = new byte[hex.length() / 2];
	        for (int i = 0; i < hex.length(); i += 2) 
	        {
	            byte value = (byte)Integer.parseInt(hex.substring(i, i + 2), 16);
	            bytes[(int) Math.floor(i / 2)] = value;
	        }
	        return bytes;
	    } 

	 public Object[] getKey()
	 {
		 	Object[] keys = new Object[2];
		 	KeyPairGenerator generator;
			try 
			{
				generator = KeyPairGenerator.getInstance(KEY_ALGORITHM);
				generator.initialize(1024);
		
				KeyPair keyPair = generator.genKeyPair();
		
				PublicKey publicKey = keyPair.getPublic();
				PrivateKey privateKey = keyPair.getPrivate();
				
	
				keys[0] = publicKey;
				keys[1] = privateKey;
				// keys[0] = publicSpec.getModulus().toString(16);
				// keys[1] = publicSpec.getPublicExponent().toString(16);
				// keys[2] = privateKey;
			}
			catch (Exception e) 
			{
				// TODO 자동 생성된 catch 블록
				e.printStackTrace();
			}		 
			return keys;
	 }
	 
	 public String getPublicKeyModule (PublicKey publicKey) throws Exception
	 {
		 	KeyFactory keyFactory = KeyFactory.getInstance(KEY_ALGORITHM);
			RSAPublicKeySpec publicSpec = (RSAPublicKeySpec) keyFactory.getKeySpec(publicKey, RSAPublicKeySpec.class);
			return publicSpec.getModulus().toString(16);
			// keys[1] = publicSpec.getPublicExponent().toString(16);
	 }
	 
	 public String getPublicKeyExponent(PublicKey publicKey)throws Exception
	 {
		 	KeyFactory keyFactory = KeyFactory.getInstance(KEY_ALGORITHM);
			RSAPublicKeySpec publicSpec = (RSAPublicKeySpec) keyFactory.getKeySpec(publicKey, RSAPublicKeySpec.class);
			// return publicSpec.getModulus().toString(16);
			return  publicSpec.getPublicExponent().toString(16);
	 }
	 
	 public String encrypt(String data,PublicKey publicKey) throws Exception
	 {
		 return encrypt( data.getBytes() , publicKey);
	 }
	 
	 public String encrypt(byte[]  data, PublicKey publicKey) throws Exception
	 {
			Cipher cipher = Cipher.getInstance(ALGORITHM);
	       cipher.init(Cipher.ENCRYPT_MODE, publicKey);  
	       byte[] encryptedBytes = cipher.doFinal(data);
	       String encryptedValue = Base64.encodeBytes(encryptedBytes);
	       // String encryptedValue = new String(encryptedBytes, CHAR_SET); // 문자 인코딩 주의
	       // String encryptedValue = bytes2HexString(encryptedBytes);
	       return string2HexString(encryptedValue);
	 }
	 
	 public String decrypt(String data, PrivateKey privateKey) throws Exception
	 {
		 return decrypt(hex2String(data).getBytes(),privateKey);
	 }
	 
	 public String decrypt(byte[] data, PrivateKey privateKey) throws Exception
	 {
			
			Cipher cipher = Cipher.getInstance(ALGORITHM);
	        // byte[] encryptedBytes = hex2ByteArray(data);
			// byte[] encryptedBytes = data.getBytes();
	        cipher.init(Cipher.DECRYPT_MODE, privateKey);
	        byte[] decryptedBytes = cipher.doFinal(Base64.decode(data));
	        String decryptedValue = new String(decryptedBytes); // 문자 인코딩 주의.
	        //String decryptedValue = new String(hex2ByteArray(new String(decryptedBytes, CHAR_SET)),CHAR_SET);
	        return decryptedValue;
	 }
	 
	public static void main(String[] args)
	{
			try 
			{
				// System.out.println(string2HexString("테스트 데이터"));
				// System.out.println(hex2String(string2HexString("테스트 데이터")));
				
				RSAUtil rsa = new RSAUtil();
				Object[] keys = rsa.getKey();
				String enc_data = rsa.encrypt("나는 누구인가?",(PublicKey)keys[0]);
				System.out.println(enc_data);
				// System.out.println(hex2ByteArray(bytes2HexString(enc_data.getBytes())));
				
				String dec_data = rsa.decrypt(enc_data, (PrivateKey)keys[1]);
				System.out.println(dec_data);
			}
			catch (Exception e) 
			{
				// TODO 자동 생성된 catch 블록
				e.printStackTrace();
			}
	}
}
