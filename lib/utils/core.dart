String getNameFromEmail(String email) {
  return email.split('@')[0];
}

bool isValidEmail(String email) {
  final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  return emailRegExp.hasMatch(email);
}

bool isValidPassword(String password) {
  return password.length >= 8;
}
