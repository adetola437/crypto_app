import 'package:password_strength/password_strength.dart';

import '../core.dart';

String? validateDot(String? value) {
  if (!value!.trim().contains('.')) {
    return 'The field is not a valid email address';
  }
  return null;
}

String? validatePasswordStrength(String? value) {
  final passwordStrength = estimatePasswordStrength(value!);
  if (passwordStrength < 0.5) {
    return 'Password is too weak';
  }
  return null;
}

String? validateExpiryDate(String? value) {
  // print(int.parse(value?.substring(0, 2) ??l '));

  if (value != null &&
      value.isNotEmpty &&
      value.length >= 2 &&
      int.parse(value.substring(0, 2)) > 12) {
    return 'Invalid date';
  }
  return null;
}

enum CardType { mastercard, visa, verve, none }

String detectCardType(String cardNumber) {
  // Remove spaces and non-digit characters
  final digitsOnly = cardNumber.replaceAll(RegExp(r'\D'), '');

  // Define BIN ranges
  final mastercardRanges = ['51', '52', '53', '54', '55'];
  final visaRanges = ['4'];
  final verveRanges = [
    '5061',
    '5062',
    '5063',
    '5064',
    '5065',
    '5066',
    '5067',
    '5068',
    '5069',
    '650'
  ];

  // Determine card type
  if (mastercardRanges.any((range) => digitsOnly.startsWith(range))) {
    return CardType.mastercard.name;
  } else if (visaRanges.any((range) => digitsOnly.startsWith(range))) {
    return CardType.visa.name;
  } else if (verveRanges.any((range) => digitsOnly.startsWith(range))) {
    return CardType.verve.name;
  } else {
    return CardType.none.name;
  }
}



PageRoute buildPageRoute(Widget child) {
  return Platform.isIOS
      ? CupertinoPageRoute(builder: (context) => child)
      : MaterialPageRoute(builder: (context) => child);
}