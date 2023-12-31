import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_project/model/messages_model.dart';
import 'package:my_project/model/user_model.dart';

class Api {
  static bool isLogged = false;
  static const baseUrl = "http://192.168.0.110:2000/api/";

  static getAllUsers() async {
    var url = Uri.parse("${baseUrl}get_user");
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        List<dynamic> jsonList = jsonDecode(response.body);
        allUsers = jsonList.map((json) => User.fromJson(json)).toList();
        print("AllUsers: ");
        for (int i = 0; i < allUsers.length; i++)
          print(allUsers[i].username + ' ' + allUsers[i].password);
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  static getAllMessages() async {
    var url = Uri.parse("${baseUrl}messages");
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        List<dynamic> jsonList = jsonDecode(response.body);
        allMessages = jsonList.map((json) => Messages.fromJson(json)).toList();
        print("AllMessages: ");
        for (int i = 0; i < allMessages.length; i++)
          print(allMessages[i].sender);
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  static addMessage(Messages newMessage) async {
    var url = Uri.parse("${baseUrl}messages");
    print('Adding new message to database');
    final body = json.encode(newMessage.toJson());
    print(body);

    try {
      final response = await http.post(url,
          headers: <String, String>{'Content-Type': 'application/json'},
          body: body);
      if (response.statusCode == 200) {
        print('Message added successfully');
      } else {
        print('Failed to add message');
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  static addUserToDatabase() async {
    var url = Uri.parse("${baseUrl}add_user");
    print('Adding user to database');
    final body = json.encode(currentUser.toJson());
    print(body);

    try {
      final response = await http.post(url,
          headers: <String, String>{'Content-Type': 'application/json'},
          body: body);
      if (response.statusCode == 200) {
        print('User added successfully');
      } else {
        print('Failed to add user');
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  static updateUserInfo() async {
    var url = Uri.parse("${baseUrl}update/" + currentUser.username);
    final body = json.encode(currentUser.toJson());
    print(body);
    try {
      final response = await http.post(url,
          headers: {
            'Content-Type': 'application/json',
          },
          body: json.encode(currentUser.toJson()));
      if (response.statusCode == 200) {
        print('User info updated successfully');
      } else {
        print('Failed to update user info');
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  static sendOTP() async {
    var url = Uri.parse("${baseUrl}send_otp/" + currentUser.username);
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        currentUser.emergencyPassword = response.body;
        print(response.body);
      }
    } catch (e) {
      print("Error: $e");
    }
  }
}
