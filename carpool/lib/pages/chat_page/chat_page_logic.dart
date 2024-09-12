import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../network/message_repository.dart';

part 'chat_page_state.dart';
part 'chat_page_logic.freezed.dart';

class ChatPageLogic extends Cubit<ChatPageState> {
  final bool isDarkMode;
  final MessageRepository _messageRepository = MessageRepository();
  StreamSubscription? _messageSubscription;

  ChatPageLogic({required this.isDarkMode})
      : super(ChatPageState.loaded(isDarkMode: isDarkMode, messages: []));

  void loadMessages({required String senderId, required String receiverId}) {
    try {
      emit(ChatPageState.loading(isDarkMode: isDarkMode));

      _messageSubscription?.cancel();

      _messageSubscription = _messageRepository.getMessages(senderId, receiverId).listen((event) {
        if (event.snapshot.value != null) {
          Map<dynamic, dynamic>? messagesMap = event.snapshot.value as Map<dynamic, dynamic>?;
          if (messagesMap != null) {
            messagesMap.forEach((messageId, messageData) {
              if (messageData['senderId'] == receiverId) {
                _messageRepository.markAsRead(senderId, receiverId, messageId);
              }
            });
            List<dynamic> messages = messagesMap.values.toList();
            messages.sort((a, b) => a["timestamp"].compareTo(b["timestamp"]));
            if (!isClosed) {
              emit(ChatPageState.loaded(isDarkMode: isDarkMode, messages: messages));
            }
          }
        }
      }, onError: (error) {
        if (!isClosed) {
          emit(ChatPageState.error(isDarkMode: isDarkMode));
        }
      });
    } catch (e) {
      if (!isClosed) {
        emit(ChatPageState.error(isDarkMode: isDarkMode));
      }
    }
  }

  Future<void> sendMessage({
    required String senderId,
    required String senderName,
    required String receiverName,
    required String receiverId,
    required String message,
  }) async {
    await _messageRepository.sendMessage(
      senderId: senderId,
      senderName: senderName,
      receiverId: receiverId,
      receiverName: receiverName,
      message: message,
    );
    loadMessages(senderId: senderId, receiverId: receiverId);
  }

  @override
  Future<void> close() {
    // Cancel the stream subscription when the Cubit is closed
    _messageSubscription?.cancel();
    return super.close();
  }
}
