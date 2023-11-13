import 'package:flutter/material.dart';
import 'package:my_project/model/user_model.dart';

class UpdateProfilePage extends StatefulWidget {
  @override
  _UpdateProfilePageState createState() => _UpdateProfilePageState();
}

class _UpdateProfilePageState extends State<UpdateProfilePage> {
  TextEditingController fullNameController = TextEditingController();
  // TextEditingController emailController = TextEditingController();
  // TextEditingController genderController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController bloodGroupController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController contactNoController = TextEditingController();

  bool isDonor = false;
  bool isVisible = false;

  @override
  void initState() {
    super.initState();
    // Initialize controllers with current user information
    fullNameController.text = currentUser.fullname;
    // emailController.text = currentUser.username;
    // genderController.text = currentUser.gender;
    weightController.text = currentUser.weight.toString();
    bloodGroupController.text =
        currentUser.bloodGroup + " " + currentUser.rh_factor;
    dobController.text = currentUser.dob;
    contactNoController.text = currentUser.contact_no;
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
          title: Text('Update Profile'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _buildTextField('Full Name', fullNameController),
                // _buildTextField('Email', emailController),
                // _buildTextField('Gender', genderController),
                _buildTextField('Weight (KGs)', weightController),
                _buildTextField('Blood Group', bloodGroupController),
                _buildTextField('Date of Birth', dobController),
                _buildTextField('Contact No', contactNoController),
                _buildCheckbox('Opt In as Donor', isDonor, (value) {
                  setState(() {
                    isDonor = value!;
                  });
                }),
                _buildCheckbox('Visible', isVisible, (value) {
                  setState(() {
                    isVisible = value!;
                  });
                }),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Update user information here
                    // You can access the edited values using the controllers
                    // For example: fullNameController.text, emailController.text, etc.
                    // Update the currentUser object or call an update function.
                    // After updating, you may want to navigate back to the profile page.
                  },
                  child: Text('Update Profile'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
        ),
      ),
    );
  }

  Widget _buildCheckbox(
      String label, bool value, void Function(bool?) onChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Checkbox(
            value: value,
            onChanged: onChanged,
          ),
          Text(label),
        ],
      ),
    );
  }
}
