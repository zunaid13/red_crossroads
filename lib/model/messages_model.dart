class Messages {
  int id = 0;
  String sender = "";
  String message = "";
  String receiver = "";

  Messages();

  factory Messages.fromJson(Map<String, dynamic> json) {
    return Messages()
      ..id = json['id'] ?? 0
      ..sender = json['sender'] ?? ""
      ..message = json['message'] ?? ""
      ..receiver = json['receiver'] ?? "";
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'sender': sender,
      'message': message,
      'receiver': receiver
    };
  }
}

List<Messages> allMessages = [];
