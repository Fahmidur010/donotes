import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:donotes/Screens/AddNoteToList.dart';
import 'package:donotes/Screens/UpdateNoteScreen.dart';
import 'package:donotes/Style/Style.dart';
import '../REST API/ApiClient.dart';
import 'CreateNewNoteScreen.dart';
import 'NoteDetailsScreen.dart';

List Notes = [
  {
    "title":"",
    "description":""
  }
];
int currentId = 0 ;

class NotesScreen extends StatefulWidget {
  const NotesScreen({Key? key}) : super(key: key);

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {

  List noteList = [];

  @override
  void initState(){
    super.initState();
    CallData();

  }




  CallData() async{
    var data = await NoteListRequest();

    setState(() {
      noteList = data;
    });
  }


  goToUpdatePage(id){
    Navigator.push(context, MaterialPageRoute(builder: (builder)=>UpdateNoteScreen(id)));
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Notes List")),
      body: Stack(
        children: [
          ScreenBackground(context),
          Container(
            padding: EdgeInsets.all(10),
            child: ListView.builder(
              itemCount: noteList.length,
              itemBuilder: (context, index){
                return Card(
                  child: SizeBox50(
                      Row(
                        children: [
                          Expanded(flex: 80,child: Text(noteList[index]["title"])),
                          SizedBox(width: 2,),
                          Expanded(flex: 20,child: ElevatedButton(onPressed: (){goToUpdatePage(noteList[index]["id"]);}, child: Text("Edit")),)
                        ],
                      )
                  ),
                );
              },

            ),
          ),
        ],
      ),
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
      floatingActionButton: FloatingActionButton(
        elevation: 10,
        backgroundColor: colorBlue,

        onPressed: (){
          Get.offNamed("/createnote");
        },
        child: Icon(Icons.add_chart_outlined),
      ),



    );
  }
}


