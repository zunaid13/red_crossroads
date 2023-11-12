import 'package:flutter/material.dart';
import 'package:my_project/model/user_model.dart';
import 'package:my_project/otp.dart';
import 'package:my_project/services/api.dart';
import 'package:my_project/services/validate.dart';

class forgotPassword extends StatefulWidget {
  @override
  _forgotPasswordState createState() => _forgotPasswordState();
}

class _forgotPasswordState extends State<forgotPassword> {
  final TextEditingController emailController = TextEditingController();
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
                      child: TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(labelText: 'Email'),
                        style: TextStyle(fontWeight: FontWeight.bold),
                        validator: (value) {
                          if (value == null)
                            return "This field cannot be empty";
                          currentUser = new User();
                          currentUser.username = value;
                          if (Validator.userExists() != -1) {
                            currentUser = allUsers[Validator.userExists()];
                            return null;
                          }
                          return "User does not exist.";
                        },
                        onSaved: (value) {
                          // Store the value
                        },
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
                            _formKey.currentState!.save();
                            print('Now going to API');
                            Api.sendOTP();
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => otpPage(),
                              ),
                            );
                          }
                        },
                        child: Text('Send Code'),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
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
}
