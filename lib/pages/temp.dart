import 'dart:core';
import 'package:email_validator/email_validator.dart';

void main() {
  const String email = 'fredrik.eilertsen.com';
  final bool isValid = EmailValidator.validate(email);
  var x = isValid;
  if (x == false) {
    print("It works as expected");
  }
  print('Email is valid? ' + (isValid ? 'yes' : 'no'));
}
