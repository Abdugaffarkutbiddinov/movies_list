import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/features/movies/presentation/bloc/movie_bloc.dart';
import 'package:movies/features/movies/presentation/pages/movie_list_page.dart';
import 'package:movies/features/sign_in/presentation/pages/sign_in_form.dart';
import 'package:movies/features/sign_in/presentation/pages/sign_page.dart';
import 'injection_container.dart' as di;
import 'injection_container.dart';
// Future<void> main() async{
//   WidgetsFlutterBinding.ensureInitialized();
//   await di.init();
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//
//       home: BlocProvider(
//         create: (_) => sl<MovieBloc>()
//         ,
//         child: MovieListPage(),
//       ),
//     );
//   }
// }

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SignInPage(),
      );
  }
}