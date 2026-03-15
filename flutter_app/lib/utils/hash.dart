import 'dart:convert'; 
import 'package:crypto/crypto.dart';

String generateHash(String input){ 
  //convert string to bytes 
  final bytes = utf8.encode(input); 
  //hash string
  final digest = sha256.convert(bytes); 
  //return hashed string
  return digest.toString();
}