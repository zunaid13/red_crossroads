import 'package:flutter/material.dart';
import 'package:my_project/model/user_model.dart';
import 'package:my_project/services/api.dart';

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
  TextEditingController divisionController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

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
    divisionController.text = currentUser.division;
    passwordController.text = currentUser.password;
    confirmPasswordController.text = currentUser.password;
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
                _buildTextField('Full Name', fullNameController, false),
                // _buildTextField('Email', emailController),
                // _buildTextField('Gender', genderController),
                _buildTextField('Weight (KGs)', weightController, false),
                _buildTextField('Contact No', contactNoController, false),
                _buildTextField('Division', divisionController, false),
                _buildTextField('Password', divisionController, true),
                _buildTextField('Confirm password', divisionController, true),
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
                    currentUser.fullname = fullNameController.text;
                    currentUser.weight = double.parse(weightController.text);
                    currentUser.contact_no = contactNoController.text;
                    currentUser.donor = isDonor;
                    currentUser.visible = isVisible;
                    currentUser.division = divisionController.text;
                    currentUser.password = passwordController.text;
                    Api.updateUserInfo();
                    Navigator.pop(context);
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

  Widget _buildTextField(
      String label, TextEditingController controller, bool obscure) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
        ),
        obscureText: obscure,
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
