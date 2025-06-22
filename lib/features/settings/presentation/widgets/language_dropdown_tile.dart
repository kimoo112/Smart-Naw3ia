import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/localization/cubit/locale_cubit.dart';
import '../../../../core/localization/translation_extension.dart';

class LanguageDropdownTile extends StatelessWidget {
  const LanguageDropdownTile({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocaleCubit, LocaleState>(
      builder: (context, state) {
        String currentLang = state.locale.languageCode;
        return ListTile(
          leading: Icon(Icons.language_outlined,
              color: Theme.of(context).iconTheme.color),
          title: Text('settings.language'.tr(context)),
          trailing: DropdownButton<String>(
            value: currentLang,
            underline: const SizedBox(),
            onChanged: (String? newValue) {
              if (newValue != null) {
                context.read<LocaleCubit>().setLocale(Locale(newValue));
              }
            },
            items: const [
              DropdownMenuItem(
                value: 'en',
                child: Text('English', style: TextStyle(fontFamily: 'Poppins')),
              ),
              DropdownMenuItem(
                value: 'ar',
                child: Text('العربية', style: TextStyle(fontFamily: 'Almarai')),
              ),
            ],
          ),
        );
      },
    );
  }
}
