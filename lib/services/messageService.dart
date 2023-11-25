import 'package:my_project/model/messages_model.dart';
import 'api.dart';

class MessageService {
  static List<Messages> obtainMessages(List<Messages> param) {
    param.sort((a, b) => a.id.compareTo(b.id));
    return param;
  }

  static List<Messages> filterMessagesBetweenPersons(
      String person1, String person2) {
    return allMessages
        .where((message) =>
            (message.sender == person1 && message.receiver == person2) ||
            (message.sender == person2 && message.receiver == person1))
        .toList();
  }
}
