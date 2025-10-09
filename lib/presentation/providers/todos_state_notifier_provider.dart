import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:riverpod_app/config/helpers/random_generator.dart';
import 'package:riverpod_app/domain/domain.dart';
import 'package:riverpod_app/presentation/providers/todos_providers.dart';
import 'package:uuid/uuid.dart';

const _uuid = Uuid();


final filteredGuestProvider = Provider<List<Todo>>((ref) {
  final selectedFilter  = ref.watch(todoCurrentFilterProvider);
  final todos = ref.watch(todosStateNotifierProvider);


  switch(selectedFilter){
    case FilterType.all:
      return todos;
    case FilterType.completed:
      return todos.where((todo)=> todo.done).toList();
    case FilterType.pending:
      return todos.where((todo)=> !todo.done).toList();
  }
});


final todosStateNotifierProvider = StateNotifierProvider<TodosNotifier, List<Todo>>((ref) {
  return TodosNotifier();
});


class TodosNotifier extends StateNotifier<List<Todo>>{
  
  TodosNotifier(): super([
    Todo(id: _uuid.v4(), description: RandomGenerator.getRandomName(), completedAt: null),
    Todo(id: _uuid.v4(), description: RandomGenerator.getRandomName(), completedAt: DateTime.now()),
    Todo(id: _uuid.v4(), description: RandomGenerator.getRandomName(), completedAt: null),
  ]);

  void createTodo(){
    state = [
      ...state,
        Todo(id: _uuid.v4(), description: RandomGenerator.getRandomName(), completedAt: null)
     ];

  }


  void toggleTodo(String id){
    state = state.map((todo) {

      if(todo.id == id){
        todo = todo.copyWith(
          completedAt: todo.done ? null : DateTime.now()
        );
      }

      return todo;
    }).toList();
  }

}