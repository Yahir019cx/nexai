import 'package:go_router/go_router.dart';
import 'package:nexai/app/app_shell.dart';
import 'package:nexai/app/route_transitions.dart';
import 'package:nexai/features/agents/agents_page.dart';
import 'package:nexai/features/chat/chat_page.dart';
import 'package:nexai/features/settings/settings_page.dart';

abstract final class AppRoutes {
  static const String home = '/';
  static const String settings = '/settings';
  static const String agents = '/agents';
}

final GoRouter appRouter = GoRouter(
  initialLocation: AppRoutes.home,
  routes: [
    ShellRoute(
      builder: (context, state, child) =>
          AppShell(currentLocation: state.uri.toString(), child: child),
      routes: [
        GoRoute(
          path: AppRoutes.home,
          pageBuilder: (context, state) => buildFadeTransitionPage(
            key: state.pageKey,
            child: const ChatPage(),
          ),
        ),
        GoRoute(
          path: AppRoutes.settings,
          pageBuilder: (context, state) => buildFadeTransitionPage(
            key: state.pageKey,
            child: const SettingsPage(),
          ),
        ),
        GoRoute(
          path: AppRoutes.agents,
          pageBuilder: (context, state) => buildFadeTransitionPage(
            key: state.pageKey,
            child: const AgentsPage(),
          ),
        ),
      ],
    ),
  ],
);
