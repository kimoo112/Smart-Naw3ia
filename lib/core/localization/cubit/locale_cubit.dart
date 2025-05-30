import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naw3ia/core/cache/cache_helper.dart';

part 'locale_state.dart';

class LocaleCubit extends Cubit<LocaleState> {
  static const String _localeKey = 'locale';

  LocaleCubit() : super(LocaleState(const Locale('ar'))) {
    _loadLocale();
  }

  void _loadLocale() {
    final String? languageCode = CacheHelper.getData(key: _localeKey);
    if (languageCode != null) {
      emit(LocaleState(Locale(languageCode)));
    }
  }

  Future<void> setLocale(Locale locale) async {
    await CacheHelper.saveData(key: _localeKey, value: locale.languageCode);
    emit(LocaleState(locale));
  }

  void toggleLocale() {
    final newLocale = state.locale.languageCode == 'ar'
        ? const Locale('en')
        : const Locale('ar');
    setLocale(newLocale);
  }
}
