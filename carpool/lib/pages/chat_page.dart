import 'package:carpool/datamodel/search_input.dart';
import 'package:carpool/log_in/auth_middleware.dart';
import 'package:carpool/pages/home_page_navigation.dart';
import 'package:carpool/utils/strings/managers/strings_managers.dart';
import 'package:carpool/utils/strings/strings_constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../theme/app_colors.dart';
import '../theme/app_style.dart';
import '../ui/chat_box.dart';
import '../ui/input_text.dart';
import 'chat_page/chat_page_logic.dart';
import 'package:intl/intl.dart';

class ChatPage extends StatefulWidget {
  static const routeName = '/messagePage';
  final String receiverName;
  final String receiverId;
  final String senderId;
  final String senderName;
  final bool isDarkMode;

  const ChatPage({
    super.key,
    required this.senderId,
    required this.senderName,
    required this.receiverName,
    required this.receiverId,
    required this.isDarkMode,
  });

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatPageLogic(isDarkMode: widget.isDarkMode),
      child: _BuildChatPage(
        senderId: widget.senderId,
        senderName: widget.senderName,
        receiverId: widget.receiverId,
        receiverName: widget.receiverName,
        isDarkMode: widget.isDarkMode,
      ),
    );
  }
}

class _BuildChatPage extends StatefulWidget {
  final String receiverName;
  final String receiverId;
  final String senderId;
  final String senderName;
  final bool isDarkMode;

  const _BuildChatPage({
    required this.senderId,
    required this.senderName,
    required this.receiverName,
    required this.receiverId,
    required this.isDarkMode,
  });

  @override
  _BuildChatPageState createState() => _BuildChatPageState();
}

class _BuildChatPageState extends State<_BuildChatPage> {
  final TextEditingController _messageController = TextEditingController();
  late ChatPageLogic logic;
  FocusNode focusNode = FocusNode();

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    logic = context.read<ChatPageLogic>();
    logic.loadMessages(
        senderId: widget.senderId, receiverId: widget.receiverId);
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        Future.delayed(
          const Duration(milliseconds: 500),
              () => scrollDown(),
        );
      }
    });

    Future.delayed(const Duration(milliseconds: 500), () => scrollDown());
  }

  @override
  void dispose() {
    focusNode.dispose();
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void scrollDown() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 500),
      curve: Curves.fastOutSlowIn,
    );
  }

  void sendMessage() async {
    if (_messageController.text.isNotEmpty) {
      logic.sendMessage(
          senderId: widget.senderId,
          senderName: widget.senderName,
          receiverName: widget.receiverName,
          receiverId: widget.receiverId,
          message: _messageController.text);

      _messageController.clear();

      scrollDown();
    }
  }

  Widget _buildMessageItem(dynamic data, DateTime? previousDateTime) {
    bool isCurrentUser = data["senderId"] == widget.senderId;

    int timestamp = data["timestamp"];
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp);
    String formattedTime = DateFormat.Hm().format(dateTime);
    String formattedDate = DateFormat('dd/MM/yyyy').format(dateTime);

    bool isDayChanged =
        previousDateTime != null && previousDateTime.day != dateTime.day;

    var align = isCurrentUser ? Alignment.centerRight : Alignment.centerLeft;


    return Column(
      crossAxisAlignment:
      isCurrentUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        if (isDayChanged)
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                height: 1,
                color: Colors.grey.withOpacity(0.5),
                margin: const EdgeInsets.symmetric(vertical: 5),
              ),
              Text(formattedDate,
                  style: const TextStyle(color: Colors.black, fontSize: 14)),
            ],
          ),
        Container(
          alignment: align,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ChatBox(
                message: data["message"],
                isCurrentUser: isCurrentUser,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  formattedTime,
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildUserInput() {
    return Container(
      color: widget.isDarkMode ? AppColors.seventhColor : AppColors.secondColor,
      child: Padding(
        padding: const EdgeInsets.only(top: 16, bottom: 12),
        child: Row(
          children: [
            Expanded(
              child: CarpoolInputText(
                controller: _messageController,
                hintText: StringsManager.instance
                    .getString(context, chat_page_type_a_message),
                isDarkMode: widget.isDarkMode,
                focusNode: focusNode,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: widget.isDarkMode
                    ? AppColors.tenthColor
                    : AppColors.ninthColor,
                shape: BoxShape.circle,
              ),
              margin: const EdgeInsets.only(right: 10),
              child: IconButton(
                onPressed: sendMessage,
                icon: const Icon(Icons.arrow_upward, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMessageList(List<dynamic> messages) {
    DateTime? previousDateTime;

    return ListView.builder(
      controller: _scrollController,
      itemCount: messages.length,
      itemBuilder: (context, index) {
        final message = messages[index];
        final messageItem = _buildMessageItem(message, previousDateTime);
        previousDateTime =
            DateTime.fromMillisecondsSinceEpoch(message["timestamp"]);
        return messageItem;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
        widget.isDarkMode ? AppColors.tenthColor : AppColors.fifthColor,
        centerTitle: true,
        title: Text(widget.receiverName,
            style: widget.isDarkMode ? AppStyle.h1Dark : AppStyle.h1Light),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: widget.isDarkMode ? Colors.white : AppColors.tenthColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<ChatPageLogic, ChatPageState>(
              builder: (context, state) {
                if (state is ChatPageLoadedState) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    if (_scrollController.hasClients) {
                      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
                    }
                  });
                  if (state.messages.isEmpty) {
                    return Center(
                      child: Text(StringsManager.instance
                          .getString(context, chat_page_start_conversation)),
                    );
                  }

                  return _buildMessageList(state.messages);
                } else if (state is ChatPageLoadingState) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return Text(StringsManager.instance
                      .getString(context, chat_page_error_fetching_messages));
                }
              },
            ),
          ),
          _buildUserInput(),
        ],
      ),
    );
  }
}