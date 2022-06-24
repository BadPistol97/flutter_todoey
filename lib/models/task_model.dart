class TaskModel {

  TaskModel(String taskName, int id){
    setTaskName(taskName);
    setID(id);
  }

  String? _taskName;

  bool _isChecked = false;

  int _id = 0;

  String? get name => _taskName;

  bool get isChecked => _isChecked;

  int get id => _id;

  void toggleCheckBox() => _isChecked = !_isChecked;

  void setTaskName(String name) => _taskName = name;

  void setIsChecked(bool isChecked) => _isChecked = isChecked;

  void setID(int id) => _id = id;

}