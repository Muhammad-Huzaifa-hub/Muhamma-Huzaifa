import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/controllers/todo_controller.dart';
import 'package:todo/view/todo_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => TodoController()),
      
    ],
    child: MaterialApp(
     debugShowCheckedModeBanner: false,
      home: TodoScreen(),
    ),);
     
  }
}
