import 'package:my_project/chat.dart';
import 'package:my_project/model/messages_model.dart';
import 'package:my_project/model/user_model.dart';
import 'api.dart';

class MessageService {
  static List<Messages> sortMessages(List<Messages> param) {
    param.sort((b, a) => a.id.compareTo(b.id));
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

  static List<ChatMessage> obtainChat(String otherGuy) {
    List<ChatMessage> ret = [];
    List<Messages> temp = [];

    temp = filterMessagesBetweenPersons(currentUser.username, otherGuy);
    temp = sortMessages(temp);
    for (int i = 0; i < temp.length; i++) {
      ret.add(messageToChat(temp[i]));
    }
    print('ret is: ');
    print(ret);
    return ret;
  }

  static Messages chatToMessage(ChatMessage param) {
    Messages ret = new Messages();
    ret.sender = param.sender;
    ret.receiver = param.receiver;
    ret.id = param.time;
    ret.message = param.text;
    return ret;
  }

  static ChatMessage messageToChat(Messages param) {
    return new ChatMessage(
        text: param.message,
        receiver: param.receiver,
        sender: param.sender,
        time: param.id);
  }
}
