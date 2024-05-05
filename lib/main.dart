import 'package:flutter/material.dart';
import 'package:social/core/logger/logger.dart';
import 'package:social/core/theme/app_theme.dart';
import 'package:social/features/auth/presentation/pages/index.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final log = logger(MyApp);
  @override
  Widget build(BuildContext context) {
    log.i('Info');
    log.e('Error');
    log.w('Warning');
    log.t('Trace');
    log.d('Debug');
    log.f('Fatal');
    return MaterialApp(
      title: 'Social App Demo',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkThemeMode,
      home: const AuthIndexPage(),
    );
  }
}
