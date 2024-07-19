
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/controller/Todo_controller.dart';

class TodoScreen extends StatelessWidget {
   TodoScreen({super.key});

  TextEditingController textTask = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final TodoController todoController = Get.put(TodoController());
    return Scaffold(backgroundColor: Color(0xff151515),
     appBar: AppBar(
       backgroundColor:  Color(0xff0AB6AB),
       actions: [
          Icon(Icons.arrow_back_ios,size: 20,color: Colors.black,),Spacer(),
          Text('ToDo App',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 30),),Spacer(),
         InkWell(onTap: () {
           showDialog(context: context, builder: (context) => AlertDialog(
             title: Text('Add New Task',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),),
             content: TextField(controller: textTask,),
           ));
         },child: Icon(Icons.more_vert,size: 25,color: Colors.black,))
         ],
     ),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 15),
            Text('Today',style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),),
            Text('19-07-2024',style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),),SizedBox(height: 10),
            Center(child: Obx(() => ListView.builder(itemCount: todoController.Todo.length,itemBuilder: (context, index) => Container(
                  height: 60,width: 380,child: Row(children: [
                    Container(height: 40,width: 40,child:
                   Icon(Icons.arrow_back_ios,color: Colors.white,size: 20,),),Spacer(),
                    Text('Book Reading',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 23),),Spacer(),
                    Icon(Icons.add,color: Colors.white,size: 30,),SizedBox(width: 50,),
                    Icon(Icons.delete,color: Colors.white,size: 30),
                    ],
                ),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Color(0xff201F1F)),
                ),
              ),
            )
            ),
            Padding(
              padding: const EdgeInsets.only(top: 540,left: 280),
              child: Center(
                child: FloatingActionButton(onPressed: () {

                },child: Icon(Icons.add,size: 30,color: Colors.black,),),
              ),
            )
          ],
        ),
      ),
    );
  }
}
