import 'package:movies/features/sign_in/validator.dart';

class EmailEditingRegexValidator extends RegexValidator {
  EmailEditingRegexValidator()
      : super(
            regexSource:
                "^[a-zA-Z0-9_.+-]*(@([a-zA-Z0-9-]*(\\.[a-zA-Z0-9-]{0,4})?)?)?\$");
}

class EmailSubmitRegexValidator extends RegexValidator {
  EmailSubmitRegexValidator()
      : super(
            regexSource:
                "(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\\.[a-zA-Z0-9-]{2,4}\$)");
}

class PasswordEditingRegexValidator extends RegexValidator {
  PasswordEditingRegexValidator() : super(regexSource: "^[a-zA-Z0-9]{0,10}\$");
}

class PasswordSubmitRegexValidator extends RegexValidator {
  PasswordSubmitRegexValidator()
      : super(regexSource: "^[a-zA-Z0-9_.+-]{6,10}\$");
}

class EmailAndPasswordValidators {
  final emailSubmitRegexValidator = EmailSubmitRegexValidator();

  final emailEditingRegexValidator = EmailEditingRegexValidator();

  final passwordSubmitRegexValidator = PasswordSubmitRegexValidator();

  final passwordEditingRegexValidator = PasswordEditingRegexValidator();
}
