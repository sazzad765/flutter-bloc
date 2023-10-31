import 'package:bloc_example/common/utils/extension/validator_extension.dart';

enum ValidatorType { email, name, empty, password }

class Validator {
  static String? empty(String? p0) {
    p0 ??= '';
    if (p0 == '') return "Field can't empty";
    return null;
  }

  static String? name(String? p0) {
    p0 ??= '';
    if (p0 == '') return "Name can't empty";
    if (!p0.isValidName) return 'Name is not valid';
    return null;
  }

  static String? email(String? p0) {
    p0 ??= '';
    if (p0 == '') return "Email can't empty";
    if (!p0.isValidEmail) return 'Email is not valid';
    return null;
  }

  static String? password(String? p0) {
    p0 ??= '';
    if (p0 == '') return "Password can't empty";
    if (!p0.isValidPassword) return 'Password is not valid';
    return null;
  }

  static String? phone(String? p0) {
    p0 ??= '';
    if (p0 == '') return "Phone can't empty";
    if (!p0.isValidPhone) return 'Phone is not valid';
    return null;
  }

  static String? custom(String? p0, {List<ValidatorType>? types}) {
    p0 ??= '';
    types ??= [ValidatorType.empty];
    if (p0 == '' && types.isEmpty) return "Field can't empty";
    if (!p0.isValidEmail && types.hasEmail) return 'Email is not valid';
    if (!p0.isValidName && types.hasName) return 'Name is not valid';
    if (!p0.isValidPassword && types.hasPass) return 'Password is not valid';
    return null;
  }
}

extension ValidatorTypeX on List<ValidatorType> {
  bool get hasEmail => contains(ValidatorType.email);

  bool get isEmpty => contains(ValidatorType.empty);

  bool get hasName => contains(ValidatorType.name);

  bool get hasPass => contains(ValidatorType.password);
}
