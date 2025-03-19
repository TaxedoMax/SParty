import 'package:flutter/material.dart';
import 'package:sparty/core/theme/theme.dart';
import 'package:sparty/features/dashboard/presentation/dashboard_screen.dart';

void main() {
  runApp(const SPartyApp());
}

class SPartyApp extends StatelessWidget {
  const SPartyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SParty',
      theme: SPartyTheme.lightTheme,
      home: const DashboardScreen(),
    );
  }
}
