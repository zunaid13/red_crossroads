class Messages {
  DateTime id = DateTime.now(); // Change the type to DateTime
  String sender = "";
  String message = "";
  String receiver = "";

  Messages();

  factory Messages.fromJson(Map<String, dynamic> json) {
    return Messages()
      ..id = json['id'] != null ? DateTime.parse(json['id']) : DateTime.now()
      ..sender = json['sender'] ?? ""
      ..message = json['message'] ?? ""
      ..receiver = json['receiver'] ?? "";
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id.toIso8601String(), // Convert DateTime to ISO8601 string
      'sender': sender,
      'message': message,
      'receiver': receiver
    };
  }
}

List<Messages> allMessages = [];
