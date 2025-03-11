class ValidationService {
  String? validateEmail(String? value, context) {
    String pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex = RegExp(pattern);
    if (value == null || value.isEmpty || !regex.hasMatch(value)) {
      return ''; //S.of(context).emailVal;
    }
    return null;
  }

  String? validateText(String? value, context) {
    String pattern = r'^[a-zA-Z\s]+$';
    RegExp regExp = RegExp(pattern);
    if (value == null || value.isEmpty) {
      return 'Required';
    } else if (!regExp.hasMatch(value)) {
      return 'Accept letters only';
    }

    return null;
  }

  String? validateMobile(String? value, context) {
    String pattern = r'(^5[0-9]{8}$)';
    RegExp regExp = RegExp(pattern);
    if (value!.isEmpty) {
      return ''; //S.of(context).enterPhone;
    } else if (!regExp.hasMatch(value)) {
      return ''; //S.of(context).wrongPhone;
    } else if (value.length < 9) {
      return ''; //S.of(context).wrongPhone;
    }
    return null;
  }

  String? validateEmailAndPhone(String? value, context) {
    RegExp phone = RegExp(r'(^05[0-9]{8}$)');
    RegExp email = RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])+)$");
    if (value == null || value.isEmpty) {
      return 'Required';
    } else if (!phone.hasMatch(value) && !email.hasMatch(value)) {
      return 'Enter a valid email address or a valid phone number';
      // print('$value is a valid phone number');
    } else {
      // ignore: avoid_print
      print('done');
      return null;
    }
  }

  String? validatePassword(String? value, context) {
    RegExp upperCase = RegExp('(?=.*?[A-Z])');
    RegExp lowerCase = RegExp('(?=.*[a-z])');
    RegExp numric = RegExp(
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[+_%!@#\$&*~]).{8,}$');
    if (value == null || value.isEmpty) {
      return 'Required';
    } else if (value.trim().length < 8) {
      return 'Must be at least 8 characters long';
    } else if (!upperCase.hasMatch(value)) {
      return 'please enter uppercase letter or lowercase letter or special letter';
    } else if (!lowerCase.hasMatch(value)) {
      return 'please enter uppercase letter or lowercase letter or special letter';
    } else if (!numric.hasMatch(value)) {
      return 'please enter uppercase letter or lowercase letter or special letter';
    } else {
      return null;
    }
  }

  String? validateRePassword(String? value, context, String value2) {
    RegExp upperCase = RegExp('(?=.*?[A-Z])');
    RegExp lowerCase = RegExp('(?=.*[a-z])');
    RegExp numric = RegExp(
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[+_%!@#\$&*~]).{8,}$');
    if (value == null || value.isEmpty) {
      return 'Required';
    } else if (!upperCase.hasMatch(value)) {
      return 'please enter uppercase letter or lowercase letter or special letter';
    } else if (!lowerCase.hasMatch(value)) {
      return 'please enter uppercase letter or lowercase letter or special letter';
    } else if (!numric.hasMatch(value)) {
      return 'please enter uppercase letter or lowercase letter or special letter';
    } else {
      return null;
    }
  }
}
