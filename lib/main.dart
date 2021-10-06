import 'package:assignment_app/provider/offload_provider.dart';
import 'package:assignment_app/screens/settings_screen.dart';
import 'package:assignment_app/utils/app_colors.dart';
import 'package:assignment_app/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => OffloadProvider(),
      child: AssignmentApp(),
    ),
  );
}

class AssignmentApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Assignment App',
      theme: ThemeData(
        primaryColor: AppColors.primaryColor,
        fontFamily: AppTextStyles.fontFamily,
        accentColor: AppColors.primaryColor.withOpacity(0.7),
      ),
      home: SettingsScreen(),
    );
  }
}
