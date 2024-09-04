import 'package:chat/utils/classes/validator_output.dart';

ValidatorOutput emailValidator(String input) {
  final RegExp emailRegex =
      RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');

  if (input.isEmpty) {
    return ValidatorOutput(isValid: false, error: 'Please enter your email');
  } else if (emailRegex.hasMatch(input)) {
    return ValidatorOutput(isValid: true);
  } else {
    return ValidatorOutput(isValid: false, error: 'Unvalid email format');
  }
}

ValidatorOutput passwordValidator(String input) {
  if (input.isEmpty) {
    return ValidatorOutput(isValid: false, error: 'Please enter your password');
  } else if (input.length < 6) {
    return ValidatorOutput(
        isValid: false, error: 'Your password must be stronger');
  } else {
    return ValidatorOutput(isValid: true);
  }
}

ValidatorOutput usernameValidator(String input) {
  if (input.isEmpty) {
    return ValidatorOutput(isValid: false, error: 'Please enter your name');
  } else if (input.length < 5) {
    return ValidatorOutput(isValid: false, error: 'Your name is soo short');
  } else {
    return ValidatorOutput(isValid: true);
  }
}

