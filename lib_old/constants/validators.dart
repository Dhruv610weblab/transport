class Validators {
  static final RegExp _emailRegExp = RegExp(
    r'\S+@\S+\.\S+',
  );

  static String? emailValidator(String? email) {
    if (email!.isEmpty) {
      return 'Enter email';
    } else if (!_emailRegExp.hasMatch(email)) {
      return 'Invalid email. Please try again';
    }
    return null;
  }

  static String? passwordValidator(String? password) {
    if (password!.isEmpty) {
      return 'Enter password';
    }
    return null;
  }

  static String? phoneValidator(String? phone) {
    // Indian Mobile number are of 10 digit only
    if (phone!.isEmpty) {
      return 'Enter mobile number';
    } else if (phone.length <= 10 && phone.length >= 12) {
      return 'Number is not valid';
    }
    return null;
  }

  static String? nameValidator(String? name) {
    if (name!.isEmpty) {
      return '''Enter your name''';
    }
    return null;
  }

  static String? detailValidator(String? name) {
    // if (name!.length < 5) {
    //   return '''Reason is too short''';
    // }
    if (name!.isEmpty) {
      return '''Field can't be empty''';
    }
    return null;
  }

  static String? notEmpty(String? name) {
    if (name!.isEmpty) {
      return '''Field can't be empty''';
    }
    return null;
  }
}
