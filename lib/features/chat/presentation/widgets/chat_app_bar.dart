import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../../../../core/localization/translation_extension.dart';

class ChatAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ChatAppBar({
    super.key,
    required this.onClearChat,
  });

  final VoidCallback onClearChat;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('chat.title'.tr(context)),
      centerTitle: true,
      actions: [
        IconButton(
          icon: const Icon(IconlyLight.delete),
          onPressed: onClearChat,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
