import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hungry/core/constants/app_colors.dart';
import 'package:hungry/features/auth/views/login_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hungry App',
      theme: ThemeData.dark().copyWith(
        splashColor: Colors.transparent,
        scaffoldBackgroundColor: AppColors.bg,
      ),
      home: const LoginView(),
    );
  }
}
