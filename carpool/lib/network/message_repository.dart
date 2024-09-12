
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import '../datamodel/message.dart';

class MessageRepository {
  final FirebaseDatabase _database = FirebaseDatabase.instance;
  //final UserRepository _userRepository = UserRepository();

  String getChatRoomId(String userId1, String userId2) {
    List<String> ids = [userId1, userId2];
    ids.sort();
    return ids.join('_');
  }

  Future<bool> addChatToUser({
    required String chatId,
    required String userId,
    required String otherId,
    required String otherName,
    required String message,
    required int timestamp,
  }) async {
    try {
      DatabaseReference userRef = _database.ref().child(userId);

      await userRef.child('Chat').child(chatId).set({
        'otherId': otherId,
        'otherName': otherName,
        'message': message,
        'timestamp': timestamp,
      });

      return true;
    } catch (e) {
      print('Error adding chat to user: $e');
      return false;
    }
  }

  Future<void> sendMessage({required String senderId, required String senderName,
      required String receiverId, required String receiverName, required String message}) async {

    String chatRoomId = getChatRoomId(senderId, receiverId);
    DatabaseReference msgRef = _database.ref().child('chat_rooms').child(chatRoomId).child('messages').push();
    int time = Timestamp.now().millisecondsSinceEpoch;
    Message msg = Message(
      senderId: senderId,
      senderName: senderName,
      receiverName: receiverName,
      receiverId: receiverId,
      message: message,
      timestamp: time,
      read: false,
    );

    await msgRef.set(msg.toMap());

    await addChatToUser(chatId: chatRoomId, userId: senderId, otherId: receiverId, otherName: receiverName, message: message, timestamp: time);
    await addChatToUser(chatId: chatRoomId, userId: receiverId, otherId: senderId, otherName: senderName, message: message, timestamp: time);
  }

  Future<void> markAsRead(String senderId, String receiverId, String messageId) async {
    try {
      String chatRoomId = getChatRoomId(senderId, receiverId);
      DatabaseReference messagesRef = _database.ref().child('chat_rooms').child(chatRoomId).child('messages').child(messageId);

      // Check if the message exists
      DatabaseEvent event = await messagesRef.once();
      DataSnapshot snapshot = event.snapshot;
      if (snapshot.value != null) {
        Map<dynamic, dynamic> messageData = snapshot.value as Map<dynamic, dynamic>;
        // Check if the message is unread and the sender is not the receiver
        if (messageData['read'] == false && senderId != receiverId) {
          await messagesRef.update({
            'read': true,
          });
          print('Message marked as read');
        }
      } else {
        print('Message does not exist');
      }
    } catch (e) {
      print('Error marking message as read: $e');
    }
  }



  Future<int> getUnreadMessageFromChat(String userId, String senderId) async {
    try {
      String chatRoomId = getChatRoomId(userId, senderId);
      DatabaseReference messageRef = _database.ref().child('chat_rooms').child(chatRoomId).child('messages');

      DatabaseEvent snapshot = await messageRef.orderByChild('read').equalTo(false).once();

      int unreadMessageCount = 0;
      if (snapshot.snapshot.value != null) {
        Map<dynamic, dynamic> messages = snapshot.snapshot.value as Map<dynamic, dynamic>;
        messages.forEach((key, value) {
          if (value['receiverId'] == userId) {
            unreadMessageCount++;
          }
        });
      }

      return unreadMessageCount;
    } catch (e) {
      print('Error fetching unread messages: $e');
      return 0;
    }
  }


  Stream<DatabaseEvent> getMessages(String senderId, String receiverId) {
    String chatRoomId = getChatRoomId(senderId, receiverId);
    DatabaseReference messagesRef = _database.ref().child('chat_rooms').child(chatRoomId).child('messages');

    return messagesRef.orderByChild('timestamp').onValue;
  }

  Stream<DatabaseEvent> getChats(String id) {
    return _database.ref()
        .child(id)
        .child("Chat")
        .orderByChild("timestamp")
        .onValue;
  }
}
