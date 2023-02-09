import 'package:flutter/material.dart';
import 'package:donotes/Screens/UpdateNoteScreen.dart';

import 'AddNoteToList.dart';
import 'NotesScreen.dart';

class NoteDetailsScreen extends StatefulWidget {
  const NoteDetailsScreen({Key? key}) : super(key: key);

  @override
  State<NoteDetailsScreen> createState() => _NoteDetailsScreenState();
}

class _NoteDetailsScreenState extends State<NoteDetailsScreen> {

  DeleteNote(){
    DeleteNote2(currentId);
    Navigator.pop(context);
    Navigator.push(context, MaterialPageRoute(builder: (context)=>NotesScreen()));

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Note Details"),),
      body: Stack(
        children: [
          Container(
            child: Column(
              children: [
                Text(Notes[currentId]["title"]),
                Text(Notes[currentId]["description"]),
                ElevatedButton(onPressed: (){DeleteNote();}, child: Text("Delete Note")),
                //ElevatedButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>UpdateNoteScreen()));}, child: Text("Edit Note")),

              ],
            ),
          )
        ],
      )

    );
  }
}
