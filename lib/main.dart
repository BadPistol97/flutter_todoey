import 'package:flutter/material.dart';
import 'package:river/screens/tasks_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river/screens/task_detail.dart';

void main() => runApp(
   const ProviderScope(
     child:  MyApp()
   )
);

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.deepOrange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: 'home',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        'home': (context) => TasksScreen(),
        'detail':(context) => const TaskDetailScreen()
      },
      home: TasksScreen(),
    );
  }
}


