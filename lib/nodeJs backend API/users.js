const mongoose = require('mongoose');

let userSchema = new mongoose.Schema({
    'username' : {
        requred : true,
        type : String
    },
    'password' : {
        required : true,
        type : String
    },
    'emergencyPassword' : {
        required : true,
        type : String
    },
    'fullname' : {
        type : String
    },
    'dob' : {
        type : String
    },
    'division' : {
        type : String
    },
    'district' : {
        type : String
    },
    'gender' : {
        type : String
    },
    'weight' : {
        type : Number
    },
    'bloodGroup' : {
        type : String
    },
    'rh_factor' : {
        type : String
    },
    'contact_no' : {
        type : String
    },
    'rating' : {
        type : Number
    },
    'last_donation' : {
        type : String
    },
    'total_donation' : {
        type : Number
    },
    'longitude' : {
        type : Number
    },
    'latitude' : {
        type : Number
    },
    'visible' : {
        type : Boolean
    },
    'donor' : {
        type : Boolean
    }
});

module.exports = mongoose.model('user_schema', userSchema);

/*
String username = "";
  String password = "";
  String emergencyPassword = "";
  String fullname = "";
  String dob = "";
  String division = "";
  String district = "";
  String gender = "";
  double weight = 0;
  String bloodGroup = "";
  String rh_factor = "";
  String contact_no = "";
  double rating = -1;
  String last_donation = "";
  int total_donation = 0;
*/