import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/loginBGW2.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('User Profile'),
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Name: $fullName', style: TextStyle(fontSize: 18)),
              Text('Email: $email', style: TextStyle(fontSize: 18)),
              Text('Gender: $gender', style: TextStyle(fontSize: 18)),
              Text('Weight:  $weight KGs', style: TextStyle(fontSize: 18)),
              Text('Blood Group: $bloodGroup', style: TextStyle(fontSize: 18)),
              Text('Date of Birth: $dob', style: TextStyle(fontSize: 18)),
              Text('Contact No: $contactNo', style: TextStyle(fontSize: 18)),
            ],
          ),
        ),
      ),
    );
  }
}
