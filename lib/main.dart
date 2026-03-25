import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gym_app/gui/user_widgets/sign_in_seite.dart';
import 'package:gym_app/storage/hive_main.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveService.init(); // تهيئة Hive قبل تشغيل التطبيق
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignInWidget(),
    );
  }
}