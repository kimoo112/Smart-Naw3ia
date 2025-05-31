import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naw3ia/core/localization/translation_extension.dart';
import 'package:naw3ia/features/chat/presentation/cubit/chat_cubit.dart';
import 'package:naw3ia/features/chat/presentation/widgets/chat_input.dart';
import 'package:naw3ia/features/chat/presentation/widgets/chat_messages.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox(width: 0.0, height: 0.0),
        title: Text('chat.title'.tr(context)),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_outline),
            onPressed: () => context.read<ChatCubit>().clearChat(),
          ),
        ],
      ),
      body: const Column(
        children: [
          Expanded(child: ChatMessages()),
          ChatInput(),
        ],
      ),
    );
  }
}
