import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:todo_app/modal/Todo_list.dart';

class TodoController extends GetxController
{
  void AddTask(Map m1)
  {
    Todo.add(m1);
    print(Todo);
  }

  void Delete(int index)
  {
    Todo.removeAt(index);
  }

}