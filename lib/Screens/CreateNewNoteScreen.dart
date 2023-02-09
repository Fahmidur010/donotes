import 'package:donotes/REST%20API/ApiClient.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:donotes/Screens/AddNoteToList.dart';
import 'package:donotes/Screens/NotesScreen.dart';
import 'package:donotes/Style/Style.dart';

import 'NoteDetailsScreen.dart';
import 'NotesScreen.dart';

class CreateNewNoteScreen extends StatefulWidget {
  const CreateNewNoteScreen({Key? key}) : super(key: key);

  @override
  State<CreateNewNoteScreen> createState() => _CreateNewNoteScreenState();
}

class _CreateNewNoteScreenState extends State<CreateNewNoteScreen> {


  Map<String,String> NoteValue = {
    "title": "",
    "description": ""
  };

  Addnote(){
    NoteCreateRequest(NoteValue);
    Get.offNamed("/notesscreen");
  }


  InputOnChanged(key,textvalue){
    NoteValue.update(key,(value) => textvalue);
    setState(() {

    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Create New Note"),),
      body: Stack(
        children: [
          ScreenBackground(context),
          Container(
            alignment: Alignment.center,
            child:SingleChildScrollView(
              padding: EdgeInsets.all(30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Create New Note", style: H1Text(colorDarkBlue)),
                  SizedBox(height: 1),
                  TextFormField(
                    onChanged: (textvalue){InputOnChanged("title", textvalue);},
                    decoration: AppInputDecoration("Title"),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    onChanged: (textvalue){InputOnChanged("description", textvalue);},
                    maxLines: 10,
                    decoration: AppInputDecoration("Description"),
                  ),
                  SizedBox(height: 20),
                  Container(child: ElevatedButton(
                    style: AppButtonStyle(),
                    child: SuccessButtonChild('Create'),
                    onPressed: (){
                      Addnote();
                    },
                  ),),
                ],
              ),
            )),
          ]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
        ],
        onTap: (int index){
          if(index==0){
            Get.offNamed("/notesscreen");
          }
          else if(index==1){

          }
          else if(index==2){
            Text("No support Available");
          }
        },
      ),
      );

  }
}
