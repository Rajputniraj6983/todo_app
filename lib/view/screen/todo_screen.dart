import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/Todo_controller.dart';

TextEditingController txtTask=TextEditingController();
class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TodoController todocontarolar = Get.put(TodoController());
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Color(0xff0AB6AB),
        actions: [
          Icon(Icons.arrow_back,color: Colors.white,),Spacer(),
          Text('Todo App',style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),),Spacer(),
          Icon(Icons.more_vert,color: Colors.white,)
        ],
      ),
      body:
      Obx(()=> ListView.builder(
            itemCount: todocontarolar.ToDoList.length,
            itemBuilder: (context, index) {
              return Container(
                height: 60,width: 380,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),color: Color(0xff201F1F)
                ),
                margin: EdgeInsets.all(10),
                child: Row(
                  children: [
                    SizedBox(width: 20,),
                    Icon(Icons.arrow_circle_left,color: Colors.white),
                    SizedBox(width: 20,),
                    Text(todocontarolar.ToDoList[index]['title'],style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 19
                    ),
                    ),Spacer(),
                    Icon(Icons.edit,color: Colors.white,),SizedBox(width: 15),
                    InkWell(onTap: () {
                      todocontarolar.delete_task(index);
                      Get.back();
                    },child: Icon(Icons.delete,color: Colors.white,size: 35,)),
                  ],
                ),
              );
            },
          ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add,size: 30,color: Colors.black,),
        onPressed: () {
          showDialog(context: context, builder: (context) => AlertDialog(
            title: Text("Add to Task"),
            content: TextField(
              controller: txtTask,
            ),
            actions: [
              TextButton(onPressed: () {
                task=txtTask.text;
                txtTask.clear();
                Get.back();
                todocontarolar.addtask(
                    {
                      'title':task,
                    }
                );
              }, child: Text("Save")),
              TextButton(onPressed: () {
                Get.back();
              }, child: Text("back")),
            ],
          ),
          );
        },
      ),
    );
  }
}
String task='';