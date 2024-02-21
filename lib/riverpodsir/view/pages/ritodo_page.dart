import 'package:flutter/material.dart';
import 'package:flutter_application_4/riverpodsir/model/ritodo_model.dart';
import 'package:flutter_application_4/riverpodsir/provider/ritodo_notifier.dart';
import 'package:flutter_application_4/riverpodsir/view/pages/savepage.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class TodoListview extends ConsumerWidget {
  const TodoListview({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isEdit = false;
    List<RitodoModel> models = ref.watch(todoProvider);
    final TextEditingController controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo app'),
        centerTitle: false,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Save()));
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: models.isEmpty
          ? Center(
              child: Text('Empty todo'),
            )
          : ListView.builder(
              itemCount: models.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(models[index].task.toString()),
                    leading: Checkbox(
                        value: models[index].complete,
                        onChanged: (value) {
                          ref
                              .read(todoProvider.notifier)
                              .checkTodo(value!, index);
                        }),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                            onPressed: () {
                              controller.text = models[index].task!;
                              ref.read(todoProvider.notifier).deleteTodo(index);
                            },
                            icon: Icon(Icons.delete)),
                        IconButton(
                            onPressed: () {
                              isEdit = true;
                              ref
                                  .read(todoProvider.notifier)
                                  .editTask(controller.text, index);
                              Navigator.pop(context);
                            },
                            icon: Icon(Icons.edit))
                      ],
                    ),
                  ),
                );
              }),
    );
  }
}
