import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'ihash.dart';

class Sha256 implements IHash{
  @override
  String? hash(String? plainText) {
    if (plainText != null && plainText.isNotEmpty) {
      var bytes = utf8.encode(plainText); // data being hashed
      var digest = sha256.convert(bytes);
      return digest.toString();
    }
    return plainText;
  }

  @override
  String? hashWithKey({String? plainText, String? shaKey}) {
    if(plainText != null && plainText.isNotEmpty && shaKey != null && shaKey.isNotEmpty){
      var key = utf8.encode(shaKey);
      var bytes = utf8.encode(plainText);

      var hmacSha256 = Hmac(sha256, key); // HMAC-SHA256
      var digest = hmacSha256.convert(bytes);

      return digest.toString();
    }
    return plainText;
  }
  
}