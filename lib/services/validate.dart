import 'package:my_project/model/user_model.dart';

class Validator {
  static String loginPageVerifyEmail(String email) {
    currentUser = new User();
    for (int i = 0; i < allUsers.length; i++) {
      print(allUsers[i].username);
      if (email == allUsers[i].username) {
        currentUser = allUsers[i];
        return "";
      }
    }
    return "User does not exist";
  }

  static String loginPageVerifyPassword(String password) {
    if (currentUser.password != password) return "Password does not match";
    return "";
  }

  static String registrationPageVerifyFullName(String fullName) {
    if (fullName.length < 3) return "Please enter your full name";
    return "";
  }

  static String registrationPageVerifyEmail(String email) {
    currentUser.username = email;

    for (int i = 0; i < allUsers.length; i++)
      if (allUsers[i].username == email) return "Email already in use";
    for (int i = 0; i < email.length; i++) if (email[i] == '@') return "";
    return "Please enter a valid email address";
  }

  static String registrationPageVerifyPassword(String password) {
    currentUser.password = currentUser.emergencyPassword = password;

    final hasUppercase = RegExp(r'[A-Z]');
    final hasLowercase = RegExp(r'[a-z]');
    final hasNumber = RegExp(r'[0-9]');
    final hasSpecial = RegExp(r'[!@#\$%^&*()_+{}|:"<>,.?~]');
    String ret = "";
    if (!hasUppercase.hasMatch(password)) ret += "(A-Z) ";
    if (!hasLowercase.hasMatch(password)) ret += "(a-z) ";
    if (!hasNumber.hasMatch(password)) ret += "(0-9) ";
    if (!hasSpecial.hasMatch(password)) ret += "Special ";
    if (!ret.isEmpty) ret += "characters missing";
    return ret;
  }

  static String registrationPageVerifyConfirmPassword(String password) {
    if (password == currentUser.password) return "";
    return "Password does not match";
  }

  static String registrationPageVerifyDOB(String dob) {
    if (dob == null || dob.isEmpty) {
      return "Please enter a valid date";
    }
    final selectedDate = DateTime.parse(dob);
    final today = DateTime.now();
    final age = today.year - selectedDate.year;
    if (age < 18) {
      return "You must be 18 years old";
    }
    return "";
  }

  static int userExists() {
    for (int i = 0; i < allUsers.length; i++) {
      if (allUsers[i].username == currentUser.username) return i;
    }
    return -1;
  }
}
