

import 'message.dart';

class Chat {
  final String otherUserId;
  final String otherUserName;
  final List<Message> messages;

  Chat({required this.otherUserId, required this.otherUserName, required this.messages});
}