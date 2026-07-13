import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nexai/app/router.dart';
import 'package:nexai/core/constants/durations.dart';
import 'package:nexai/core/theme/app_theme.dart';
import 'package:nexai/core/theme/theme_controller.dart';
import 'package:nexai/features/chat/chat_controller.dart';
import 'package:nexai/features/settings/settings_controller.dart';
import 'package:provider/provider.dart';

class NexaiApp extends StatelessWidget {
  const NexaiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeController()),
        ChangeNotifierProvider(create: (_) => ChatController()),
        ChangeNotifierProvider(create: (_) => SettingsController()),
      ],
      child: Consumer<ThemeController>(
        builder: (context, themeController, child) {
          final currentTheme = themeController.themeMode == ThemeMode.dark
              ? AppTheme.dark
              : AppTheme.light;

          return MaterialApp.router(
            title: 'NEXAI',
            debugShowCheckedModeBanner: false,
            theme: currentTheme,
            routerConfig: appRouter,
            builder: (context, child) {
              return CallbackShortcuts(
                bindings: {
                  const SingleActivator(LogicalKeyboardKey.comma, control: true):
                      () => appRouter.go(AppRoutes.settings),
                  const SingleActivator(
                    LogicalKeyboardKey.keyT,
                    control: true,
                    shift: true,
                  ): themeController.toggleTheme,
                  const SingleActivator(LogicalKeyboardKey.keyN, control: true):
                      () => context.read<ChatController>().startNewConversation(),
                },
                child: Focus(
                  autofocus: true,
                  child: AnimatedTheme(
                    data: currentTheme,
                    duration: AppDurations.normal,
                    child: child!,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
