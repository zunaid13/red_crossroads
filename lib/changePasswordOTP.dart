import 'package:flutter/material.dart';
import 'package:my_project/loginPage.dart';
import 'package:my_project/model/user_model.dart';
import 'package:my_project/services/api.dart';
import 'package:my_project/services/validate.dart';

class changePasswordOTP extends StatefulWidget {
  @override
  _changePasswordOTPState createState() => _changePasswordOTPState();
}

class _changePasswordOTPState extends State<changePasswordOTP> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage('assets/loginBGW2.png')),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text('Forgot Password'),
        ),
        body: SingleChildScrollView(
          // Wrap your Column with SingleChildScrollView
          child: Container(
            alignment: Alignment.center,
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/sendEmail.png',
                      height: 200,
                      width: 200,
                    ),
                    Text(
                      'Please Enter the Email associated with your account',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    // TextField(
                    //   decoration: InputDecoration(labelText: 'Email'),
                    // ),
                    //START
                    Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          TextFormField(
                            controller: passwordController,
                            decoration: InputDecoration(labelText: 'Password'),
                            obscureText: true,
                            style: TextStyle(fontWeight: FontWeight.bold),
                            validator: (value) {
                              if (value == null)
                                return "Please enter the password";
                              String ret =
                                  Validator.registrationPageVerifyPassword(
                                      value);
                              if (ret == "") return null;
                              return ret;
                            },
                            onSaved: (value) {
                              // Store the value
                            },
                          ),
                          TextFormField(
                            controller: confirmPasswordController,
                            obscureText: true,
                            decoration:
                                InputDecoration(labelText: 'Confirm Password'),
                            style: TextStyle(fontWeight: FontWeight.bold),
                            validator: (value) {
                              if (value == null)
                                return "This field cannot be empty";
                              String ret = Validator
                                  .registrationPageVerifyConfirmPassword(value);
                              if (ret == "") return null;
                              return ret;
                            },
                            onSaved: (value) {
                              // Store the value
                            },
                          ),
                        ],
                      ),
                    ),
                    //END
                    SizedBox(height: 25),
                    SizedBox(
                      height: 45,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            currentUser.password = passwordController.text;
                            Api.updateUserInfo();
                            _formKey.currentState!.save();
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => loginPage()));
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text('Set Password'),
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
}
