import 'package:flutter/material.dart';
import 'package:movies/features/sign_in/presentation/pages/sign_page.dart';
import 'injection_container.dart' as di;
Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
      home: SignInPage()
    );
  }
}
