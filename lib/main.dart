import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/view/screen/todo_screen.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
        home: TodoScreen(),
    );
  }
}
