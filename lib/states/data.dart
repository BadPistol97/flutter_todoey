import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DataStateNotifier extends StateNotifier<List<String>>{

  DataStateNotifier() : super([]);

  void setData(String newData) => state = [...state,newData];

}