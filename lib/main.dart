// import 'package:final_project_sanbercode/config/app/app_color.dart';
// import 'package:final_project_sanbercode/config/app/app_font.dart';
// import 'package:final_project_sanbercode/pages/auth/login_page.dart';
import 'package:final_project_sanbercode/pages/get_started/get_started_page.dart';
// import 'package:final_project_sanbercode/pages/get_started/get_started_page.dart';
// import 'package:final_project_sanbercode/config/app/app_font.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_form_builder/flutter_form_builder.dart';
// import 'package:getwidget/getwidget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cake Shop',
      theme: ThemeData(
          // primarySwatch: Colors.blue,
          useMaterial3: true),
      home: GetStartedPage(),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key});

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }
