import 'package:go_router/go_router.dart';
import 'package:nexai/app/app_shell.dart';
import 'package:nexai/app/bootstrap_home.dart';

abstract final class AppRoutes {
  static const String home = '/';
}

final GoRouter appRouter = GoRouter(
  initialLocation: AppRoutes.home,
  routes: [
    ShellRoute(
      builder: (context, state, child) => AppShell(child: child),
      routes: [
        GoRoute(
          path: AppRoutes.home,
          builder: (context, state) => const BootstrapHome(),
        ),
      ],
    ),
  ],
);
