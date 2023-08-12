import 'dart:math';

class VigenereCipher {
  String generateRandomKey(int length) {
    final random = Random();
    final List<int> key = List.generate(length, (_) => random.nextInt(26) + 65);
    return String.fromCharCodes(key);
  }

  String encode(String text, String key) {
    text = text.toUpperCase();
    key = key.toUpperCase();
    String encryptedText = '';

    for (int i = 0; i < text.length; i++) {
      if (text[i].codeUnitAt(0) >= 65 && text[i].codeUnitAt(0) <= 90) {
        int encryptedCharCode =
            (text[i].codeUnitAt(0) + key[i % key.length].codeUnitAt(0)) % 26 + 65;
        encryptedText += String.fromCharCode(encryptedCharCode);
      } else {
        encryptedText += text[i];
      }
    }

    return encryptedText;
  }

  String decode(String encryptedText, String key) {
    encryptedText = encryptedText.toUpperCase();
    key = key.toUpperCase();
    String decryptedText = '';

    for (int i = 0; i < encryptedText.length; i++) {
      if (encryptedText[i].codeUnitAt(0) >= 65 &&
          encryptedText[i].codeUnitAt(0) <= 90) {
        int decryptedCharCode = (encryptedText[i].codeUnitAt(0) -
                key[i % key.length].codeUnitAt(0) +
                26) %
            26 +
            65;
        decryptedText += String.fromCharCode(decryptedCharCode);
      } else {
        decryptedText += encryptedText[i];
      }
    }

    return decryptedText;
  }
}

void main() {
  VigenereCipher vigenereCipher = VigenereCipher();

  String key = vigenereCipher.generateRandomKey(10);
  String originalText = "O";

  String encryptedText = vigenereCipher.encode(originalText, key);
  String decryptedText = vigenereCipher.decode(encryptedText, key);

  print("Original Text: $originalText");
  print("Key: $key");
  print("Encrypted Text: $encryptedText");
  print("Decrypted Text: $decryptedText");
}