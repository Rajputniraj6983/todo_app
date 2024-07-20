import 'package:get/get.dart';

class TodoController extends GetxController{
  RxList ToDoList=[].obs;
  RxString task=''.obs;
  void addtask(Map m1)
  {
    ToDoList.add(m1);
    print(ToDoList);
  }

  RxInt index=0.obs;
  void changindex(){
    index++;
  }

  void delete_task(int index){
    ToDoList.removeAt(index);
  }
}
