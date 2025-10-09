import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/presentation/providers/providers.dart';


class ChangeNotifierScreen extends ConsumerWidget {
  const ChangeNotifierScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('State Notifier Provider'),
      ),
      body: const _TodosView(),
      floatingActionButton: FloatingActionButton(
        onPressed:(){
          ref.read(todosChangeNotifierProvider.notifier).createTodo();
        },
        child: const Icon(Icons.add)),
    );
  }
}

class _TodosView extends ConsumerWidget {
  const _TodosView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    // final currentFilter = ref.watch(todoCurrentFilterProvider);
    // final todos = ref.watch(todosStateNotifierProvider);
    final todosChangeNotifier = ref.watch(todosChangeNotifierProvider);
    return Column(
      children: [
               /// Listado de personas a invitar
        Expanded(
          child: ListView.builder(
            itemCount: todosChangeNotifier.todos.length,
            itemBuilder: (context, index) {
              final invitado = todosChangeNotifier.todos[index];

              return SwitchListTile(
                title: Text(invitado.description),
                value: invitado.done, 
                onChanged: ( value ) {

                  ref.read(todosChangeNotifierProvider.notifier).toggleTodo(invitado.id);
                }
              );
            },
          ),
        )
      ],
    );
  }
}