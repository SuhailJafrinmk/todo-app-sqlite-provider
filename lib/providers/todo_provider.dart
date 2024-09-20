import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_app_provider/models/todo_model.dart';
import 'package:todo_app_provider/utils/db_helper.dart';

class TodoProvider with ChangeNotifier{
  Future<bool>addTodo(TodoModel todoModel)async{
   try {
     Database database=await DbHelper.instance.database;
     await DbHelper.addTodo(database, todoModel);
     return true;
   } catch (e) {
     return false;
   }
  }
}