import 'package:flutter/material.dart';
import 'screens/welcome_screen.dart';
import 'screens/dashboard_screen.dart';
import 'theme/app_theme.dart';

enum PreviewScreen { welcome, dashboard }

// Change this value to preview either required static screen:
// WelcomeScreen or DashboardScreen.
const PreviewScreen previewScreen = PreviewScreen.welcome;

void main() {
  runApp(const EbookConnectApp());
}

class EbookConnectApp extends StatelessWidget {
  const EbookConnectApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EbookConnect',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: switch (previewScreen) {
        PreviewScreen.welcome => const WelcomeScreen(),
        PreviewScreen.dashboard => const DashboardScreen(),
      },
    );
  }
}
