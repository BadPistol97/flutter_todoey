import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river/models/task_model.dart';

class TasksStateNotifier extends StateNotifier<List<TaskModel>>{

  TasksStateNotifier() : super([]);

  void addTask(TaskModel newData) => state = [...state,newData];

  void toggleTask(int id) {
    state = state.map((task){

        if(task.id == id) {
          TaskModel newTask = TaskModel(task.name!,task.id);
          newTask.setIsChecked(!task.isChecked);
          return newTask;
        }

        else {return task;}

    }).toList();
  }

  void removeTask(int id){
    List<TaskModel> newState = state;

     newState.removeWhere((task) => task.id == id);

     state = newState.toList();
  }

  int getUndoneTaskCount(){

    int count = 0;

    for(TaskModel task in state){
      if(!task.isChecked) count += 1;
    }

    return count;
  }

  int getDoneTaskCount(){

    int count = 0;

    for(TaskModel task in state){
      if(task.isChecked) count += 1;
    }

    return count;
  }

}