import 'package:flutter/material.dart';
import 'package:my_project/firstLogInPage.dart';
import 'package:my_project/forgotPassword.dart';
import 'package:my_project/mainMenu.dart';
import 'package:my_project/model/user_model.dart';
import 'package:my_project/registrationPage.dart';
import 'package:my_project/services/api.dart';
import 'package:my_project/services/validate.dart';

class loginPage extends StatefulWidget {
  @override
  loginPageState createState() => loginPageState();
}

class loginPageState extends State<loginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/loginBGW2.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text('Login Page'),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 64),
                    Text(
                      "Welcome to Red Crossroads",
                      style:
                          TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 64),
                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        prefixIcon: Icon(Icons.email),
                      ),
                      onSaved: (value) {
                        email = value ?? '';
                      },
                      validator: (value) {
                        if (value == null) return "This field cannot be empty.";
                        String ret = Validator.loginPageVerifyEmail(value);
                        if (ret != "") return ret;
                        currentUser = new User();
                        currentUser.username = value;
                        currentUser = allUsers[Validator.userExists()];
                        return null;
                      },
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      controller: passwordController,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        prefixIcon: Icon(Icons.lock),
                      ),
                      obscureText: true,
                      onSaved: (value) {
                        password = value ?? '';
                      },
                      validator: (value) {
                        if (value == null) return "This field cannot be empty.";
                        String ret = Validator.loginPageVerifyPassword(value);
                        if (ret == "") return null;
                        return ret;
                      },
                    ),
                    SizedBox(height: 24),
                    ElevatedButton.icon(
                      onPressed: () {
                        _formKey.currentState
                            ?.save(); // Trigger onSaved for form fields
                        print('Email: $email');
                        print('Password: $password');
                        _submitForm(context);
                      },
                      icon: Icon(Icons.login),
                      label: Text('Login'),
                    ),
                    SizedBox(height: 16),
                    TextButton.icon(
                      onPressed: () {
                        _forgotPassword(context);
                      },
                      icon: Icon(Icons.help),
                      label: Text(
                        'Forgot Password?',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                    SizedBox(height: 24),
                    Text(
                      "Don't have an Account yet?",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    TextButton.icon(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => registrationPage()));
                      },
                      icon: Icon(Icons.app_registration),
                      label: Text(
                        'Register Now',
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 16,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _submitForm(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      Api.isLogged = true;
      // Form is valid, you can perform actions here
      // For example, you can send data to a server or navigate to another page.
      if (currentUser.gender == "") {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => firstLoginPage()));
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => mainMenu()));
      }
    }
  }

  void _forgotPassword(BuildContext context) {
    // Implement your "Forgot Password" logic here.
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => forgotPassword()));
  }
}
