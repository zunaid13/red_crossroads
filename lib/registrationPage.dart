import 'package:flutter/material.dart';
import 'package:my_project/model/user_model.dart';
import 'package:my_project/services/api.dart';
import 'package:my_project/services/validate.dart';

class registrationPage extends StatefulWidget {
  @override
  registrationPageState createState() => registrationPageState();
}

class registrationPageState extends State<registrationPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  DateTime? _selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

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
          title: Text('Registration Page'),
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
                    TextFormField(
                      controller: fullNameController,
                      decoration: InputDecoration(labelText: 'Full Name'),
                      style: TextStyle(fontWeight: FontWeight.bold),
                      validator: (value) {
                        if (value == null) return "Please enter a full name";
                        String ret =
                            Validator.registrationPageVerifyFullName(value);
                        if (ret == "") return null;
                        return ret;
                      },
                      onSaved: (value) {
                        // Store the value
                      },
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(labelText: 'Email'),
                      style: TextStyle(fontWeight: FontWeight.bold),
                      validator: (value) {
                        if (value == null) return "Please enter a valid email";
                        String ret =
                            Validator.registrationPageVerifyEmail(value);
                        if (ret == "") return null;
                        return ret;
                      },
                      onSaved: (value) {
                        // Store the value
                      },
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      controller: passwordController,
                      decoration: InputDecoration(labelText: 'Password'),
                      style: TextStyle(fontWeight: FontWeight.bold),
                      obscureText: true,
                      validator: (value) {
                        if (value == null) return "Please enter the password";
                        String ret =
                            Validator.registrationPageVerifyPassword(value);
                        if (ret == "") return null;
                        return ret;
                      },
                      onSaved: (value) {
                        // Store the value
                      },
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      controller: confirmPasswordController,
                      decoration:
                          InputDecoration(labelText: 'Confirm Password'),
                      style: TextStyle(fontWeight: FontWeight.bold),
                      obscureText: true,
                      validator: (value) {
                        if (value == null) return "This field cannot be empty";
                        String ret =
                            Validator.registrationPageVerifyConfirmPassword(
                                value);
                        if (ret == "") return null;
                        return ret;
                      },
                      onSaved: (value) {
                        // Store the value
                      },
                    ),
                    SizedBox(height: 16),
                    ListTile(
                      title: Text("Date of Birth"),
                      subtitle: Text(
                        _selectedDate != null
                            ? "${_selectedDate!.toLocal()}".split(' ')[0]
                            : 'Select a Date',
                        style: TextStyle(fontSize: 18),
                      ),
                      trailing: Icon(Icons.calendar_today),
                      onTap: () => _selectDate(context),
                    ),
                    SizedBox(height: 32),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          _register();
                        }
                      },
                      child: Text('Register'),
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

  void _register() {
    String fullName = fullNameController.text;
    String email = emailController.text;
    String password = passwordController.text;
    String dob = _selectedDate?.toLocal().toString().split(' ')[0] ?? '';

    print('$fullName');
    print('$email');
    print('$password');
    print('$dob');

    currentUser.fullname = fullName;
    currentUser.username = email;
    currentUser.password = password;
    currentUser.dob = dob;
    Api.addUserToDatabase();
    allUsers.add(currentUser);
    // Implement your registration logic here using the collected data.
  }
}
