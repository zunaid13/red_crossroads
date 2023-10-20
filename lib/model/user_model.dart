class User {
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
  double longitude = -1;
  double latitude = -1;
  bool visible = false;
  bool donor = false;

  User();

  factory User.fromJson(Map<String, dynamic> json) {
    return User()
      ..username = json['username'] ?? ""
      ..password = json['password'] ?? ""
      ..emergencyPassword = json['emergencyPassword'] ?? ""
      ..fullname = json['fullname'] ?? ""
      ..dob = json['dob'] ?? ""
      ..division = json['division'] ?? ""
      ..district = json['district'] ?? ""
      ..gender = json['gender'] ?? ""
      ..weight = (json['weight'] as num?)?.toDouble() ?? 0
      ..bloodGroup = json['bloodGroup'] ?? ""
      ..rh_factor = json['rh_factor'] ?? ""
      ..contact_no = json['contact_no'] ?? ""
      ..rating = (json['rating'] as num?)?.toDouble() ?? -1
      ..last_donation = json['last_donation'] ?? ""
      ..total_donation = json['total_donation'] ?? 0
      ..longitude = (json['longitude'] as num?)?.toDouble() ?? -1
      ..latitude = (json['latitude'] as num?)?.toDouble() ?? -1
      ..visible = json['visible'] ?? false
      ..donor = json['donor'] ?? false;
  }
  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'password': password,
      'emergencyPassword': emergencyPassword,
      'fullname': fullname,
      'dob': dob,
      'division': division,
      'district': district,
      'gender': gender,
      'weight': weight,
      'bloodGroup': bloodGroup,
      'rh_factor': rh_factor,
      'contact_no': contact_no,
      'rating': rating,
      'last_donation': last_donation,
      'total_donation': total_donation,
      'longitude': longitude,
      'latitude': latitude,
      'visible': visible,
      'donor': donor,
    };
  }
}

List<User> allUsers = [];
User currentUser = new User();
