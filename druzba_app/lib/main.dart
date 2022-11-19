import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'api/user.dart';
import 'views/login_view.dart';
import 'views/register_view.dart';
import 'views/home_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

  //DEV
  sharedPreferences.setString('pass', '123');
  sharedPreferences.setString('username', '123');

  String? pass = sharedPreferences.getString('pass'); //TODO napravi token
  String? username = sharedPreferences.getString('username');

  bool isLoggedIn = false;

  if (pass != null && username != null) {
    isLoggedIn = await UserAPI.checkLogin(username, pass);
  }

  runApp(MyApp(
      startWidget:
          (isLoggedIn ? const HomeView() : LoginView(title: 'Login'))));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.startWidget});

  final Widget startWidget;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Druzba',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.red,
      ),
      home: startWidget,
    );
  }
}
