import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/config/config.dart';
import 'package:riverpod_app/presentation/providers/providers.dart';


class TodoScreen extends ConsumerWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('State Provider + Providers'),
      ),
      body: const _TodoView(),
      floatingActionButton: FloatingActionButton(
        child: const Icon( Icons.add ),
        onPressed: () {
          ref.read(todoInvitadosProvider.notifier).createInvitado(RandomGenerator.getRandomName());
        },
      ),
    );
  }
}


class _TodoView extends ConsumerWidget {
  const _TodoView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final currentFilter = ref.watch(todoCurrentFilterProvider);
    final invitados = ref.watch(todoInvitadosProvider);

    return Column(
      children: [
        const ListTile(
          title: Text('Listado de invitados'),
          subtitle: Text('Estas son las personas a invitar a la fiesta'),
        ),

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
            itemCount: invitados.length,
            itemBuilder: (context, index) {
              final invitado = invitados[index];

              return SwitchListTile(
                title: Text(invitado.description),
                value: invitado.done, 
                onChanged: ( value ) {

                  ref.read(todoInvitadosProvider.notifier).toggleTodo(invitado.id);
                }
              );
            },
          ),
        )
      ],
    );
  }
}