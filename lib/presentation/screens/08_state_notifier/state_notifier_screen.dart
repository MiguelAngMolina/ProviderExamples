import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/presentation/providers/providers.dart';


class StateNotifierScreen extends ConsumerWidget {
  const StateNotifierScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('State Notifier Provider'),
      ),
      body: const _TodosView(),
      floatingActionButton: FloatingActionButton(
        onPressed:(){
          ref.read(todosStateNotifierProvider.notifier).createTodo();
        },
        child: const Icon(Icons.add)),
    );
  }
}

class _TodosView extends ConsumerWidget {
  const _TodosView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final currentFilter = ref.watch(todoCurrentFilterProvider);
    // final todos = ref.watch(todosStateNotifierProvider);
    final todos = ref.watch(filteredGuestProvider);
    return Column(
      children: [
        

        SegmentedButton(
          segments: const[
            ButtonSegment(value: FilterType.all, icon: Text('Todos')),
            ButtonSegment(value: FilterType.completed, icon: Text('Invitados')),
            ButtonSegment(value: FilterType.pending, icon: Text('No invitados')),
          ], 
          selected: <FilterType>{ currentFilter },
          onSelectionChanged: (value) {

            ref.read(todoCurrentFilterProvider.notifier).changeCurrentFilter(value.first);
            
          },
        ),
        const SizedBox( height: 5 ),

        /// Listado de personas a invitar
        Expanded(
          child: ListView.builder(
            itemCount: todos.length,
            itemBuilder: (context, index) {
              final invitado = todos[index];

              return SwitchListTile(
                title: Text(invitado.description),
                value: invitado.done, 
                onChanged: ( value ) {

                  ref.read(todosStateNotifierProvider.notifier).toggleTodo(invitado.id);
                }
              );
            },
          ),
        )
      ],
    );
  }
}