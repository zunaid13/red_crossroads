import 'package:flutter/material.dart';
import 'package:my_project/model/user_model.dart';
import 'package:pinput/pinput.dart';
import 'package:fluttertoast/fluttertoast.dart';

class otpPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => otpPageState();
}

class otpPageState extends State<otpPage> {
  String? otp;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(
        fontSize: 20,
        color: Color.fromRGBO(30, 60, 87, 1),
        fontWeight: FontWeight.w600,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(15),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Colors.pinkAccent),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
        color: Color.fromRGBO(234, 239, 243, 1),
      ),
    );

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
          child: Form(
            key: _formKey,
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
                        'Please Enter the OTP sent to your Email',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Pinput(
                        defaultPinTheme: defaultPinTheme,
                        focusedPinTheme: focusedPinTheme,
                        submittedPinTheme: submittedPinTheme,
                        length: 4,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter the OTP';
                          }
                          otp = value;
                          return null;
                        },
                        pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                        showCursor: true,
                        onCompleted: (value) => print('Pin: $value'),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      SizedBox(
                        height: 45,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              if (otp == currentUser.emergencyPassword) {
                                // OTP is correct
                                // You can navigate to the next screen or show a success message.
                              } else {
                                // OTP is incorrect, show a toast message.
                                Fluttertoast.showToast(
                                    msg: "The OTP is Incorrect",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                    fontSize: 16.0);
                              }
                            }
                          },
                          child: Text('Verify OTP Code'),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              'Edit Email?',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 16),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
