// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_naw3ia/features/chat/presentation/cubit/chat_cubit.dart';
import 'package:smart_naw3ia/features/chat/presentation/widgets/chat_app_bar.dart';
import 'package:smart_naw3ia/features/chat/presentation/widgets/chat_input_field.dart';
import 'package:smart_naw3ia/features/chat/presentation/widgets/chat_message.dart';
import 'package:smart_naw3ia/features/chat/presentation/widgets/chat_suggestions.dart';
import 'package:smart_naw3ia/features/chat/presentation/widgets/clear_chat_dialog.dart';
import 'package:smart_naw3ia/features/chat/presentation/widgets/typing_indicator.dart';

class ChatView extends StatefulWidget {
  const ChatView({super.key});

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  final ScrollController _scrollController = ScrollController();
  bool _isTyping = false;
  bool _mounted = true;
  late final ChatCubit _chatCubit;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _chatCubit = context.read<ChatCubit>();
    _chatCubit.setInChatScreen(true);
    final locale = Localizations.localeOf(context).languageCode;
    _chatCubit.updateLocale(locale);
  }

  @override
  void dispose() {
    _mounted = false;
    _chatCubit.setInChatScreen(false);
    _scrollController.dispose();
    super.dispose();
  }

  void _handleMessageSubmit(String text) {
    if (text.trim().isEmpty || !_mounted) return;

    setState(() {
      _isTyping = true;
    });

    final locale = Localizations.localeOf(context).languageCode;
    _chatCubit.sendMessage(text, locale);
    _scrollToBottom();

    // Cancel typing indicator after delay
    Future.delayed(const Duration(seconds: 2), () {
      if (_mounted) {
        setState(() {
          _isTyping = false;
        });
      }
    });
  }

  void _scrollToBottom() {
    if (!_mounted) return;
    Future.delayed(const Duration(milliseconds: 100), () {
      if (_mounted && _scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ChatAppBar(
        onClearChat: () => showClearChatConfirmationDialog(context, _chatCubit),
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<ChatCubit, ChatState>(
              builder: (context, state) {
                final messages = (state as ChatInitial).messages;
                return Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: ListView.builder(
                    controller: _scrollController,
                    padding: EdgeInsets.symmetric(vertical: 8.h),
                    itemCount: messages.length + (_isTyping ? 1 : 0),
                    itemBuilder: (context, index) {
                      if (index == messages.length && _isTyping) {
                        return const TypingIndicator();
                      }
                      final message = messages[index];
                      return ChatMessage(
                        message: message.message,
                        type: message.type,
                      );
                    },
                  ),
                );
              },
            ),
          ),
          ChatSuggestions(
            onSuggestionSelected: _handleMessageSubmit,
          ),
          ChatInputField(
            onSubmitted: _handleMessageSubmit,
          ),
        ],
      ),
    );
  }
}
