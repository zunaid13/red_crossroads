import 'package:flutter/material.dart';
import 'package:my_project/model/user_model.dart';

class profilePage extends StatefulWidget {
  @override
  _profilePageState createState() => _profilePageState();
}

class _profilePageState extends State<profilePage> {
  String fullName = currentUser.fullname;
  String email = currentUser.username;
  String gender = currentUser.gender;
  double weight = currentUser.weight;
  String bloodGroup = currentUser.bloodGroup + " " + currentUser.rh_factor;
  String dob = currentUser.dob;
  String contactNo = currentUser.contact_no;

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
                _buildProfileInfo('Date of Birth', dob),
                _buildProfileInfo('Contact No', contactNo),
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
