import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:riverpod_app/config/helpers/random_generator.dart';
import 'package:riverpod_app/domain/entities/todo.dart';
import 'package:uuid/uuid.dart';


const _uuid = Uuid();

final todosChangeNotifierProvider = ChangeNotifierProvider<TodosChangeNotifier>((ref) {
  return TodosChangeNotifier();
});


class TodosChangeNotifier extends ChangeNotifier{
  List<Todo> todos  = <Todo>[
    Todo(id: _uuid.v4(), description: RandomGenerator.getRandomName(), completedAt: null),
    Todo(id: _uuid.v4(), description: RandomGenerator.getRandomName(), completedAt: DateTime.now()),
    Todo(id: _uuid.v4(), description: RandomGenerator.getRandomName(), completedAt: null),
  ];

  void createTodo(){
    todos = [
      ...todos,
        Todo(id: _uuid.v4(), description: RandomGenerator.getRandomName(), completedAt: null)
     ];
    notifyListeners();
  }


  void toggleTodo(String id){
    todos = todos.map((todo) {

      if(todo.id == id){
        todo = todo.copyWith(
          completedAt: todo.done ? null : DateTime.now()
        );
      }

      return todo;
    }).toList();
    notifyListeners();
  }
}