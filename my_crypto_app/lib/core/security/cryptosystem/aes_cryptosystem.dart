import 'package:encrypt/encrypt.dart';

import 'icryptosystem.dart';

class AESCryptoSystem implements ICryptoSystem {
  late String? password;
  late String? ivValue;

  Key _getEncryptionKey() => Key.fromUtf8(password!);
  IV _getIv() => IV.fromUtf8(ivValue!);

  AESCryptoSystem({String? newPassword, String? newIvValue}) {
    password = ''; //newPassword ?? dotenv.env['ENC_PASSWORD']??'';
    ivValue = ''; //newIvValue ?? dotenv.env['ENC_IV_VALUE'] ?? '';
  }

  @override
  String decrypt(String cipherText) {
    final cryptoSystem = Encrypter(AES(_getEncryptionKey()));
    return cryptoSystem.encrypt(cipherText, iv: _getIv()).base64;
  }

  @override
  String encrypt(String plainText) {
    final cryptoSystem = Encrypter(AES(_getEncryptionKey()));
    final encrypted = Encrypted.from64(plainText);
    return cryptoSystem.decrypt(encrypted, iv: _getIv());
  }
}
