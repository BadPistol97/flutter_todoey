import 'package:flutter/material.dart';
import 'package:river/screens/add_task_screen.dart';
import 'package:river/components/task_list.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:river/state_providers/providers.dart';
// import 'package:river/models/task_model.dart';
import 'package:river/components/drawer.dart';

class TasksScreen extends ConsumerWidget{

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    // List<TaskModel> tasks = ref.watch(tasksStateProvider);

    // int doneTasks = ref.read(tasksStateProvider.notifier).getDoneTaskCount();

    TabBar tabBar = const TabBar(
        tabs: [
          Tab(icon: Icon(Icons.directions_car)),
          Tab(icon: Icon(Icons.directions_transit)),
          Tab(icon: Icon(Icons.directions_bike)),
        ]);


    const List<String> _kOptions = <String>[
      'aardvark',
      'bobcat',
      'chameleon',
    ];

    return DefaultTabController(
          length: 3,
          child: Scaffold(
            floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
            backgroundColor: Colors.white,
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
                child: const Icon(Icons.add),
                backgroundColor: Colors.deepOrange,
            ),
            appBar: AppBar(
              title: const Text(
                'Home',
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor:Colors.deepOrange,
                flexibleSpace: Container(
                    color: Colors.deepOrange
                ),
                actions: [IconButton(icon:Icon(Icons.heart_broken,),onPressed: (){})],
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(100),
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      width:300.0,
                      child: InputDecorator(
                        decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.search, size: 25.0,),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50.0),
                            borderSide: const BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            ),
                          ),
                          filled: true,
                          hintStyle: TextStyle(color: Colors.grey[800]),
                          hintText: "Type in your text",
                          fillColor: Colors.white,
                          isDense: true,
                          contentPadding: EdgeInsets.all(0.0),
                      ),
                        child: Autocomplete(
                          optionsBuilder:
                              (TextEditingValue textEditingValue) {
                            if (textEditingValue.text == '') {
                              return const Iterable<String>.empty();
                            }
                            return _kOptions.where((String option) {
                              return option.contains(
                                  textEditingValue.text.toLowerCase());
                            });
                          },
                          //   onSelected: (User selection) {
                          //   //   print(
                          //   //       'You just selected ${_displayStringForOption(selection)}');
                          //   // },
                          // ),
                        ),
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.only(left:10.0,right:10.0),
                    //   child: TextField(
                    //     autofocus:false,
                    //     decoration: InputDecoration(
                    //       prefixIcon: const Icon(Icons.search, size: 25.0,),
                    //         border: OutlineInputBorder(
                    //           borderRadius: BorderRadius.circular(50.0),
                    //           borderSide: const BorderSide(
                    //             width: 0,
                    //             style: BorderStyle.none,
                    //           ),
                    //         ),
                    //         filled: true,
                    //         hintStyle: TextStyle(color: Colors.grey[800]),
                    //         hintText: "Type in your text",
                    //         fillColor: Colors.white,
                    //         isDense: true,
                    //         contentPadding: EdgeInsets.all(15.0),
                    //     ),
                    //   ),
                    // ),
                    const SizedBox(height:10.0),
                    Container(
                      color: Theme.of(context).primaryColor,
                      child: tabBar,
                    ),
                  ],
                ),
              )
            ),
            drawer: const SideBar(),
            body: Column(
              children: [
                // Text('heeelo'),
                Expanded(
                  child: TabBarView(
                    children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            // Container(
                            //   child: Column(
                            //     crossAxisAlignment: CrossAxisAlignment.start,
                            //     children: [
                            //       Text('${tasks.length} ${tasks.length > 1 ? 'tasks' : 'task'} ($doneTasks done)',
                            //           style:const TextStyle(
                            //             color: Colors.black,
                            //             fontWeight: FontWeight.w700,
                            //             fontSize: 18.0,
                            //
                            //           )
                            //       ),
                            //       const Divider(
                            //         height: 1,
                            //         color: Colors.black,
                            //       ),
                            //     ],
                            //   ),
                            // ),
                            TaskList()
                          ]
                      ),
                      const Icon(Icons.directions_transit),
                      const Icon(Icons.directions_bike)],
                  ),
                )
              ],
            ),
          )

      );
  }
}
