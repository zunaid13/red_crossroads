import 'package:flutter/material.dart';
import 'package:my_project/map.dart';

class introPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Intro'),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome',
              style: TextStyle(
                fontSize: 34,
              ),
            ),
            SizedBox(
              height: 11,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => mapPage(),
                    ));
              },
              child: Text('Next'),
            )
          ],
        )));
  }
}
