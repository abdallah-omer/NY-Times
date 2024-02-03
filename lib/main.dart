import 'package:flutter/material.dart';
import 'package:ny_times/features/ny_times/presentation/pages/ny_times_screen.dart';
import 'package:ny_times/utilities/di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DI.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NYTimeScreen(),
    );
  }
}
