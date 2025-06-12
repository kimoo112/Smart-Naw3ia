import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/cache/cache_helper.dart';
import 'core/localization/app_localizations.dart';
import 'core/localization/cubit/locale_cubit.dart';
import 'core/routes/router.dart';
import 'core/theme/app_theme.dart';
import 'core/theme/cubit/theme_cubit.dart';
import 'features/chat/presentation/cubit/chat_cubit.dart';
import 'features/home/presentation/cubit/navigation_cubit.dart';
import 'features/login/presentation/cubit/login_cubit.dart';
import 'features/notifications/data/services/notification_service.dart';

// Top-level notification callbacks for Awesome Notifications
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  await NotificationService().init();
  AwesomeNotifications().setListeners(
    onActionReceivedMethod: onActionReceivedMethod,
    onNotificationDisplayedMethod: onNotificationDisplayedMethod,
    onDismissActionReceivedMethod: onDismissActionReceivedMethod,
  );

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));

  runApp(const SmartNaw3ia());
}

class SmartNaw3ia extends StatelessWidget {
  const SmartNaw3ia({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => ThemeCubit()),
            BlocProvider(create: (context) => LocaleCubit()),
            BlocProvider(create: (context) => LoginCubit()),
            BlocProvider(create: (context) => NavigationCubit()),
            BlocProvider(create: (context) => ChatCubit()),
          ],
          child: BlocBuilder<LocaleCubit, LocaleState>(
            builder: (context, localeState) {
              return BlocBuilder<ThemeCubit, ThemeState>(
                builder: (context, themeState) {
                  return MaterialApp.router(
                    debugShowCheckedModeBanner: false,
                    theme: AppTheme.getTheme(
                      localeState.locale,
                      brightness: Brightness.light,
                    ),
                    darkTheme: AppTheme.getTheme(
                      localeState.locale,
                      brightness: Brightness.dark,
                    ),
                    themeMode: themeState.themeMode,
                    locale: localeState.locale,
                    supportedLocales: const [
                      Locale('en'),
                      Locale('ar'),
                    ],
                    localizationsDelegates: const [
                      AppLocalizations.delegate,
                      GlobalMaterialLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                      GlobalCupertinoLocalizations.delegate,
                    ],
                    routerConfig: router,
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}

Future<void> onActionReceivedMethod(ReceivedAction receivedAction) async {
  final actionKey = receivedAction.payload?['action_key'];
  if (actionKey != null && actionKey.startsWith('REPLY_TO_')) {}
}

Future<void> onNotificationDisplayedMethod(
    ReceivedNotification receivedNotification) async {}

Future<void> onDismissActionReceivedMethod(
    ReceivedAction receivedAction) async {}
