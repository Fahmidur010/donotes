import 'dart:html';

import 'package:donotes/REST%20API/ApiClient.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:donotes/Screens/NoteDetailsScreen.dart';
import 'package:donotes/Screens/NotesScreen.dart';
import 'package:donotes/Style/Style.dart';

import 'AddNoteToList.dart';

class UpdateNoteScreen extends StatefulWidget {

  final int id;
  const UpdateNoteScreen(this.id);


  @override
  State<UpdateNoteScreen> createState() => _UpdateNoteScreenState();
}

class _UpdateNoteScreenState extends State<UpdateNoteScreen> {
  Map<String,String> NoteValue = {
    "title": "",
    "description": ""
  };

 TextEditingController _TitleController = TextEditingController(text: "");
 TextEditingController _DescriptionController = TextEditingController(text: "");


  @override
  void initState(){
    var id = widget.id.toString();
    CallData(id);
  }

   CallData(id) async{
    var data = await SingleNoteRequest(id);

    setState(() {
      NoteValue.update("title", (value) => data['title'].toString());
      NoteValue.update("description", (value) => data['description'].toString());
    });
    _TitleController = TextEditingController(text: data["title"].toString());
    _DescriptionController = TextEditingController(text: data["description"].toString());

   }



  // Addnote(){
  //   //AddNoteToList(NoteValue);
  //   Navigator.push(context,MaterialPageRoute(builder: (context)=>NotesScreen()));
  // }


  InputOnChanged(key,textvalue){
    setState(() {
      NoteValue.update(key,(value) => textvalue);
    });
  }

  PostUpdateAction(NoteValue, id){
    NoteUpdateRequest(NoteValue, id);
    Get.offAllNamed("/notesscreen");
  }

  SubmitAlartDialog(id){
    return showDialog(context: context, builder: (BuildContext context){
      return Expanded(child: AlertDialog(
        title: Text("Alert"),
        content: Text("Do you want to delete?"),
        actions: [
          TextButton(onPressed: (){
            Get.back();
            DeleteNote(id);
            MySnackBar("Note Deleted", context);

          }, child: Text("Yes")),




          TextButton(onPressed: (){Get.back();}, child: Text("No"))
        ],
      ));
    });
  }

  DeleteNote(id){
    NoteDeleteRequest(id);
    Get.offAllNamed("/notesscreen");
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Update Note"),),
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
                      Text("Update Your Note", style: H1Text(colorDarkBlue)),
                      SizedBox(height: 1),
                      TextFormField(
                        controller: _TitleController,
                        onChanged: (textvalue){InputOnChanged("title", textvalue);},
                        decoration: AppInputDecoration("Title"),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: _DescriptionController,

                        onChanged: (textvalue){InputOnChanged("description", textvalue);},
                        maxLines: 10,
                        decoration: AppInputDecoration("Description"),
                      ),
                      SizedBox(height: 20),
                      Container(

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              style: AppButtonStyle(),
                              child: SuccessButtonChild('Update'),
                              onPressed: (){
                                PostUpdateAction(NoteValue,widget.id.toString());
                              },
                            ),
                            SizedBox(height: 2),
                            ElevatedButton(
                              style: AppButtonStyle(),
                              child: SuccessButtonChild('Delete'),
                              onPressed: (){
                                SubmitAlartDialog(widget.id.toString());
                              },
                            ),
                          ],
                        ),
                      ),
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
            Get.off(NotesScreen());
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
