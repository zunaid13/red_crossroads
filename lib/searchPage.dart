// searchPage.dart

import 'package:flutter/material.dart';
import 'package:my_project/model/user_model.dart'; // Make sure to import your user model
import 'package:my_project/services/validate.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String selectedGender = 'All';
  String selectedBloodGroup = 'All';

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
          title: Text('Search Profiles'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              _buildFilterDropdown('Gender', ['All', 'Male', 'Female']),
              SizedBox(height: 16),
              _buildFilterDropdown('Blood Group',
                  ['All', 'A+', 'B+', 'O+', 'AB+', 'A-', 'B-', 'O-', 'AB-']),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  _searchProfiles(selectedGender, selectedBloodGroup);
                },
                child: Text('Search'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFilterDropdown(String title, List<String> options) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        DropdownButton<String>(
          value: title == 'Gender' ? selectedGender : selectedBloodGroup,
          onChanged: (String? value) {
            setState(() {
              if (title == 'Gender') {
                selectedGender = value!;
              } else {
                selectedBloodGroup = value!;
              }
            });
          },
          items: options.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ],
    );
  }

  void _searchProfiles(String gender, String bloodGroup) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            SearchResultPage(gender: gender, bloodGroup: bloodGroup),
      ),
    );
  }
}

// searchPage.dart

class SearchResultPage extends StatelessWidget {
  final String gender;
  final String bloodGroup;
  // Dummy data for demonstration purposes (replace it with actual data from your database)
  List<User> searchResults = [
    // Add more user profiles as needed
  ];
  // List<User> searchResults = allUsers;

  SearchResultPage({required this.gender, required this.bloodGroup})
      : searchResults = Validator.filterUsers(gender, bloodGroup);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Results'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: searchResults.length,
          itemBuilder: (context, index) {
            return _buildSearchResultTile(searchResults[index]);
          },
        ),
      ),
    );
  }

  Widget _buildSearchResultTile(User user) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage('assets/profile'),
          radius: 30,
        ),
        title: Text(
          user.fullname,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Gender: ${user.gender}'),
            Text('Blood Group: ${user.bloodGroup}'),
          ],
        ),
        onTap: () {
          // Implement navigation to the detailed user profile page
          // You can use the user information to display detailed information.
        },
      ),
    );
  }
}
