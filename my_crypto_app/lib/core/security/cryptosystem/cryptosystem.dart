import 'icryptosystem.dart';

class CryptoSystemImpl{

  ICryptoSystem? cryptoSystem;

  CryptoSystemImpl({this.cryptoSystem});

  String decrypt(String cipherText) {
    return cryptoSystem!.decrypt(cipherText);
  }

  String encrypt(String plainText) {
    return cryptoSystem!.encrypt(plainText);
  }

}