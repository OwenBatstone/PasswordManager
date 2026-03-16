import 'package:crypto/crypto.dart';
import 'package:encrypt/encrypt.dart'; //https://pub.dev/documentation/encrypt/latest/
import 'dart:convert';
import 'package:convert/convert.dart';
import 'dart:typed_data';


//Encrypts any string using the key
String aesEncrypt(String plaintext, Uint8List key) {

  final k = Key(key);
  final iv = IV.fromLength(16);

  final encrypter = Encrypter(AES(k)); //https://pub.dev/documentation/encrypt/latest/encrypt/Encrypter-class.html

  final encrypted = encrypter.encrypt(plaintext, iv : iv);

  return "${iv.base64}:${encrypted.base64}";
}

//Decrypts ciphertext using the key
String aesDecrypt(String encryptedText, Uint8List key) {
  final k = Key(key);
  final iv = IV.fromLength(16);

  final encrypter = Encrypter(AES(k));

  return encrypter.decrypt(Encrypted.fromBase64(encryptedText), iv : iv);
}

//Creates a secure AES key using the hash of 3 strings
Uint8List createAesKey(String password, String username, String dateCreated) {
  var c1 = utf8.encode(password);
  var c2 = utf8.encode(username);
  var c3 = utf8.encode(dateCreated);

  var output = AccumulatorSink<Digest>();
  var input = sha256.startChunkedConversion(output);

  input.add(c1);
  input.add(c2);
  input.add(c3);
  input.close();

  var digest = output.events.single;

  return Uint8List.fromList(digest.bytes);
}
