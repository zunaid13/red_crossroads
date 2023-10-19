import 'package:flutter/material.dart';

class firstLoginPage extends StatefulWidget {
  @override
  firstLoginPageState createState() => firstLoginPageState();
}

class firstLoginPageState extends State<firstLoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _gender;
  double? _weight;
  String? _bloodGroup;
  String? _rhFactor;
  String? _contactNo;
  String? _division;
  bool _wantToBeDonor = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/loginBGW2.png'))),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text('First Time Log In Form'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            // Wrap the Form with a SingleChildScrollView
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  DropdownButtonFormField<String>(
                    value: _gender,
                    hint: Text('Gender'),
                    items:
                        <String>['Male', 'Female', 'Other'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        _gender = value;
                      });
                    },
                    validator: (value) {
                      if (value == null) {
                        return 'Please select your gender';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText: 'Weight (In KGs)'),
                    onSaved: (value) {
                      _weight = double.parse(value!);
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your weight';
                      }
                      return null;
                    },
                  ),
                  DropdownButtonFormField<String>(
                    value: _bloodGroup,
                    hint: Text('Blood Group'),
                    items: <String?>['A', 'B', 'AB', 'O'].map((String? value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value ?? ""),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        _bloodGroup = value;
                      });
                    },
                    validator: (value) {
                      if (value == null) {
                        return 'Please select your blood group';
                      }
                      return null;
                    },
                  ),
                  DropdownButtonFormField<String>(
                    value: _rhFactor,
                    hint: Text('Rh Factor'),
                    items: <String?>['Positive (+ve)', 'Negative (-ve)']
                        .map((String? value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value ?? ""),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        _rhFactor = value;
                      });
                    },
                    validator: (value) {
                      if (value == null) {
                        return 'Please select your Rh Factor';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(labelText: 'Contact No.'),
                    onSaved: (value) {
                      _contactNo = value!;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your contact number';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Division'),
                    onSaved: (value) {
                      _division = value!;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your division';
                      }
                      return null;
                    },
                  ),
                  CheckboxListTile(
                    title: Text('Do you want to be opted as a donor?'),
                    value: _wantToBeDonor,
                    onChanged: (value) {
                      setState(() {
                        _wantToBeDonor = value!;
                      });
                    },
                  ),
                  SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: _submitForm,
                    child: Text('Submit'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Form is valid, you can perform actions here
      // For example, you can send data to a server or navigate to another page.
      print("Gender: $_gender");
      print("Weight: $_weight");
      print("Blood Group: $_bloodGroup");
      print("Rh Factor: $_rhFactor");
      print("Contact No: $_contactNo");
      print("Division: $_division");
      print("Want to be Opted as a Donor: $_wantToBeDonor");
    }
  }
}
