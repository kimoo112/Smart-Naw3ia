// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naw3ia/core/localization/translation_extension.dart';
import 'package:naw3ia/features/chat/data/chat_data.dart';
import 'package:naw3ia/features/chat/presentation/cubit/chat_cubit.dart';
import 'package:naw3ia/features/chat/presentation/widgets/chat_message.dart';
import 'package:naw3ia/features/chat/presentation/widgets/suggestion_chip.dart';
import 'package:naw3ia/features/chat/presentation/widgets/typing_indicator.dart';

class ChatView extends StatefulWidget {
  const ChatView({super.key});

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  bool _isTyping = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Update locale when it changes
    final locale = Localizations.localeOf(context).languageCode;
    context.read<ChatCubit>().updateLocale(locale);
  }

  void _addUserMessage(String message) {
    context
        .read<ChatCubit>()
        .sendMessage(message, Localizations.localeOf(context).languageCode);
  }

  void _handleSubmitted(String text) {
    if (text.trim().isEmpty) return;

    _controller.clear();
    setState(() {
      _isTyping = true;
    });

    // Add user message first
    _addUserMessage(text);
    _scrollToBottom();

    // Simulate bot typing and then add response
    Future.delayed(const Duration(seconds: 1), () {
      if (!mounted) return;
      setState(() {
        _isTyping = false;
      });
    });
  }

  void _scrollToBottom() {
    Future.delayed(const Duration(milliseconds: 100), () {
      if (_scrollController.hasClients) {
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
    final locale = Localizations.localeOf(context).languageCode;
    final isRTL = locale == 'ar';

    return Scaffold(
      appBar: AppBar(
        title: Text('chat.title'.tr(context)),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(IconlyLight.delete),
            onPressed: () {
              context.read<ChatCubit>().clearChat();
            },
          ),
        ],
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
          _buildSuggestions(),
          Container(
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, -5),
                ),
              ],
            ),
            child: Row(
              textDirection: isRTL ? TextDirection.rtl : TextDirection.ltr,
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    textDirection:
                        isRTL ? TextDirection.rtl : TextDirection.ltr,
                    textAlign: isRTL ? TextAlign.right : TextAlign.left,
                    style: TextStyle(fontSize: 10.sp),
                    decoration: InputDecoration(
                      hintText:
                          isRTL ? 'اكتب رسالتك...' : 'Type your message...',
                      hintStyle: TextStyle(fontSize: 10.sp),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Theme.of(context).scaffoldBackgroundColor,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 8.h,
                      ),
                    ),
                    onSubmitted: _handleSubmitted,
                  ),
                ),
                SizedBox(width: 8.w),
                IconButton(
                  icon: Icon(isRTL ? Icons.send : Icons.send_outlined,
                      textDirection:
                          isRTL ? TextDirection.rtl : TextDirection.ltr),
                  onPressed: () => _handleSubmitted(_controller.text),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSuggestions() {
    final locale = Localizations.localeOf(context).languageCode;
    final isRTL = locale == 'ar';

    return Container(
      height: 40.h,
      margin: EdgeInsets.symmetric(vertical: 8.h),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        reverse: isRTL,
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        itemCount: suggestedQuestions.length,
        itemBuilder: (context, index) {
          final question = suggestedQuestions[index];
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: SuggestionChip(
              label: isRTL ? question.questionAr : question.questionEn,
              onTap: () => _handleSubmitted(
                  isRTL ? question.questionAr : question.questionEn),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }
}
