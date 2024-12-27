import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:internify/homepage.dart';
import 'package:internify/pages/logout.dart';
import 'package:internify/theme/theme_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    ChangeNotifierProvider(
      create: (context) =>ThemeProvider(),
      child: const MainApp(),
    )
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        debugShowCheckedModeBanner: false, 
        home: const LogOut(),
       theme: Provider.of<ThemeProvider>(context).themeData,
        );
  }
}
