import 'dart:io';

import 'package:flutter/material.dart';
import 'package:my_project/loginPage.dart';
import 'package:my_project/mapPage.dart';
import 'package:my_project/searchPage.dart';
import 'package:my_project/services/api.dart';
import 'package:my_project/viewProfile.dart';
import 'package:url_launcher/url_launcher.dart';

class mainMenu extends StatelessWidget {
  Future<void> _showExitConfirmationDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Confirm Exit'),
          content: Text('Are you sure you want to exit the app?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                exit(0); // Change to 0 for a normal app exit
              },
              child: Text('Exit'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _showLogoutConfirmationDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Confirm Log Out'),
          content: Text('Are you sure you want to log out?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Api.isLogged = false;
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => loginPage()));
              },
              child: Text('Log Out'),
            ),
          ],
        );
      },
    );
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
          title: Text('Main Menu'),
        ),
        body: Center(
          child: Padding(
            padding: EdgeInsets.only(top: 1, left: 25, right: 25, bottom: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/rc1.png',
                  height: 85,
                  width: 350,
                ),
                SizedBox(
                  height: 50,
                ),
                SizedBox(
                  height: 45,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (Api.isLogged == true) {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => mapPage()));
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.map, size: 40),
                        Text('Search Nearby', style: TextStyle(fontSize: 16)),
                        Icon(Icons.arrow_forward,
                            size: 40), // Add an arrow icon
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                SizedBox(
                  height: 45,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (Api.isLogged == true) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SearchPage()));
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.search, size: 40),
                        Text('Search Filters', style: TextStyle(fontSize: 16)),
                        Icon(Icons.arrow_forward,
                            size: 40), // Add an arrow icon
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                SizedBox(
                  height: 45,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (Api.isLogged == true) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => profilePage()));
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.person, size: 40),
                        Text('View Profile', style: TextStyle(fontSize: 16)),
                        Icon(Icons.arrow_forward,
                            size: 40), // Add an arrow icon
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                SizedBox(
                  height: 45,
                  width: double.infinity,
                  child: ElevatedButton(
                    // onPressed: _launchURL,
                    onPressed: () async {
                      final url = 'https://www.youtube.com/watch?v=6emUjt2-Jok';
                      await launchUrl(Uri.parse(url));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.add_link, size: 40),
                        Text('Learn More', style: TextStyle(fontSize: 16)),
                        Icon(Icons.arrow_forward,
                            size: 40), // Add an arrow icon
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                SizedBox(
                  height: 45,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (Api.isLogged == true) {
                        _showLogoutConfirmationDialog(context);
                      } else {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => loginPage()));
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.logout, size: 40),
                        Text((Api.isLogged) ? 'Log Out' : 'Log In',
                            style: TextStyle(fontSize: 16)),
                        Icon(Icons.arrow_forward,
                            size: 40), // Add an arrow icon
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                SizedBox(
                  height: 45,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      _showExitConfirmationDialog(context);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.exit_to_app, size: 40),
                        Text('Exit', style: TextStyle(fontSize: 16)),
                        Icon(Icons.arrow_forward,
                            size: 40), // Add an arrow icon
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
