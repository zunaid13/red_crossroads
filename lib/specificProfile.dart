import 'package:flutter/material.dart';
import 'package:my_project/chat.dart';
import 'package:my_project/model/user_model.dart';
import 'package:my_project/updateProfilePage.dart';

class specificProfilePage extends StatefulWidget {
  final User user;
  specificProfilePage({required this.user});
  @override
  _specificProfilePageState createState() => _specificProfilePageState();
}

class DetailArguments {
  final String title;

  DetailArguments(this.title);
}

class _specificProfilePageState extends State<specificProfilePage> {
  late String fullName;
  late String email;
  late String gender;
  late double weight;
  late String bloodGroup;
  late String dob;
  late String contactNo;

  @override
  void initState() {
    super.initState();
    // Access widget.user in the initState method
    fullName = widget.user.fullname;
    email = widget.user.username;
    gender = widget.user.gender;
    weight = widget.user.weight;
    bloodGroup = widget.user.bloodGroup + " " + widget.user.rh_factor;
    dob = widget.user.dob;
    contactNo = widget.user.contact_no;
  }

  String calculateAge(String dateString) {
    DateTime currentDate = DateTime.now();
    DateTime birthDate = DateTime.parse(dateString);

    int age = currentDate.year - birthDate.year;

    // Check if the birthday hasn't occurred yet this year
    if (currentDate.month < birthDate.month ||
        (currentDate.month == birthDate.month &&
            currentDate.day < birthDate.day)) {
      age--;
    }

    return age.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Profile'),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/loginBGW2.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/profile.png',
                  height: 200,
                  width: 400,
                ),
                _buildProfileInfo('Name', fullName),
                _buildProfileInfo('Email', email),
                _buildProfileInfo('Gender', gender),
                _buildProfileInfo('Weight', '$weight KGs'),
                _buildProfileInfo('Blood Group', bloodGroup),
                _buildProfileInfo('Age', calculateAge(dob)),
                _buildProfileInfo('Contact No', '017********'),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ChatScreen(arguments: DetailArguments(email)),
                        ));
                  },
                  child: Text('Contact'),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileInfo(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: RichText(
        text: TextSpan(
          style: TextStyle(fontSize: 18, color: Colors.black),
          children: [
            TextSpan(
              text: '$title: ',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextSpan(text: value),
          ],
        ),
      ),
    );
  }
}
