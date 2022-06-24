import 'package:flutter/material.dart';
import 'package:river/screens/add_task_screen.dart';
import 'package:river/components/task_list.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river/state_providers/providers.dart';
import 'package:river/models/task_model.dart';


class TasksScreen extends ConsumerWidget{

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    List<TaskModel> tasks = ref.watch(tasksStateProvider);

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      backgroundColor: Colors.deepOrange,
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showModalBottomSheet(
              context:context,
              isScrollControlled: true,
              builder: (BuildContext context)=> SingleChildScrollView(
                child: Container(
                    padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: AddTaskScreen()
                )
            )
          );
        },
        backgroundColor: Colors.deepOrange,
        child: const Icon(Icons.add)
      ),
      body:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(top:60.0,left:30.0,right:30.0,bottom:30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 const CircleAvatar(
                    backgroundColor: Colors.white,
                    radius:30.0,
                    child: Icon(Icons.list,size:35.0,color:Colors.deepOrange)
                ),
                const SizedBox(height:10.0),
                const Text('Todoey',
                    style:TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 50.0,

                    )
                ),
                Text('${tasks.length} tasks',
                    style:const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 18.0,

                    )
                ),
              ],
            ),
          ),
          TaskList()
        ]
      ),
    );
  }
}
