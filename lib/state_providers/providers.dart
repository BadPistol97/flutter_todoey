import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river/states/data.dart';
import 'package:river/states/tasks_state.dart';
import 'package:river/models/task_model.dart';

final dataProvider = StateProvider<List<String>>((ref)=>[]);

final dataStateProvider = StateNotifierProvider<DataStateNotifier,List<String>>((ref) => DataStateNotifier());

final tasksStateProvider = StateNotifierProvider<TasksStateNotifier,List<TaskModel>>((ref) => TasksStateNotifier());