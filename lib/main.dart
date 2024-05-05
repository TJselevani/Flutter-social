import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social/core/logger/logger.dart';
import 'package:social/core/theme/app_theme.dart';
import 'package:social/features/auth/data/dataSources/auth_remote_data_source.dart';
import 'package:social/features/auth/data/repository/auth_repository_implementation.dart';
import 'package:social/features/auth/domain/useCase/user_sign_up.dart';
import 'package:social/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:social/features/auth/presentation/pages/index.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => AuthBloc(
            userSignUp: UserSignUp(
              authRepository: AuthRepositoryImpl(
                authRemoteDataSource:
                    AuthRemoteDataSourceImpl(firebaseAuth: firebaseAuth),
              ),
            ),
          ),
        ),
      ],
      child: const MyApp(),
    ),
  );
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
