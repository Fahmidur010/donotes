

import 'package:flutter/material.dart';
import 'package:donotes/Screens/NotesScreen.dart';

import 'NotesScreen.dart';

AddNoteToList(NoteValue){

  Notes.add(NoteValue);
  return true;
}

UpdateNote(NoteValue){
  Notes[currentId]=NoteValue;
  return true;

}


SetCurrentId(id){
  currentId = id;
  return true;

}

DeleteNote2(id){
  Notes.removeAt(id);
  return true;
}