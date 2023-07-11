import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/tasks.dart';

class TaskInherited extends InheritedWidget {
   TaskInherited({
    super.key,
    required Widget child,
  }) : super(child: child);

  final List<Tasks> taskList = [ const Tasks('Andar de Bike', 'assets/images/nophoto.png', 2),
   const Tasks('Ler 50 páginas', 'assets/images/nophoto.png', 1),
    const Tasks('Meditar', 'assets/images/nophoto.png', 4),
    const Tasks('Jogar', 'assets/images/nophoto.png', 0,),
  ];

  void newTesk (String name, String photo, int difficulty){
    
    taskList.add(Tasks(name, photo, difficulty));
  }

  static TaskInherited of(BuildContext context) {
    final TaskInherited? result = context.dependOnInheritedWidgetOfExactType<TaskInherited>();
    assert(result != null, 'No TaskInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(TaskInherited old) {
    return old.taskList.length != taskList.length;
  }
}
