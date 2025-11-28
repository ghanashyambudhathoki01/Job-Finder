import 'package:flutter/material.dart';
import 'services/app_state.dart';
import 'screens/onboarding.dart';
import 'themes.dart';

void main() {
  final appState = AppState();
  runApp(AppStateProvider(notifier: appState, child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = AppStateProvider.of(context);
    return AnimatedBuilder(
      animation: state,
      builder: (context, _) {
        return MaterialApp(
          title: 'Job Finder',
          theme: AppTheme.lightTheme(),
          darkTheme: AppTheme.darkTheme(),
          themeMode: state.isDark ? ThemeMode.dark : ThemeMode.light,
          home: const OnboardingScreen(),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}

// Onboarding handled by `OnboardingScreen`.
