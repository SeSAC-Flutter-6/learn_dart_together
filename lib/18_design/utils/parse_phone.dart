bool isValidatePhoneNumber(String phoneNumber) {
  RegExp regExp = RegExp(r'^010\d{8}$');

  if (!regExp.hasMatch(phoneNumber) || phoneNumber.length != 11) {
    return false;
  }

  return true;
}