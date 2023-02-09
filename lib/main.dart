import 'package:donotes/Screens/CreateNewNoteScreen.dart';
import 'package:donotes/Screens/NotesScreen.dart';
import 'package:donotes/Screens/StartingScreen.dart';
import 'package:donotes/Screens/UpdateNoteScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "DoNotes",
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      getPages: [
        GetPage(name: "/", page: ()=>StartingScreen(),transition: Transition.fade),
        GetPage(name: "/notesscreen", page: ()=>NotesScreen(),transition: Transition.circularReveal),
        GetPage(name: "/updatenote", page: ()=>UpdateNoteScreen(1),transition: Transition.leftToRight),
        GetPage(name: "/createnote", page: ()=>CreateNewNoteScreen(),transition: Transition.zoom),
      ],
    );
  }
}
