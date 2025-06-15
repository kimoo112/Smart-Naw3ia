import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../cubit/chat_cubit.dart';
import 'chat_bubble.dart';

class ChatMessages extends StatefulWidget {
  const ChatMessages({super.key});

  @override
  State<ChatMessages> createState() => _ChatMessagesState();
}

class _ChatMessagesState extends State<ChatMessages> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChatCubit, ChatState>(
      listener: (context, state) {
        // Scroll to bottom when new message is added
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _scrollToBottom();
        });
      },
      builder: (context, state) {
        final messages = (state as ChatInitial).messages;
        return ListView.builder(
          controller: _scrollController,
          padding: EdgeInsets.all(16.w),
          itemCount: messages.length,
          itemBuilder: (context, index) {
            final message = messages[index];
            return ChatBubble(message: message);
          },
        );
      },
    );
  }
}
