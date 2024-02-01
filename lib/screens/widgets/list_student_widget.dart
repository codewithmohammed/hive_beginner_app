import 'package:database_one/db/functions/db_functions.dart';
import 'package:database_one/db/model/data_model.dart';
import 'package:flutter/material.dart';

class ListStudentWidget extends StatelessWidget {
  const ListStudentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: studentListNotifier,
      builder:
          (BuildContext ctx, List<StudentModel> studentList, Widget? child) {
        return ListView.separated(
            itemBuilder: (ctx, index) {
              final data = studentList[index];
              return ListTile(
                title: Text(data.name),
                subtitle: Text(data.age),
                trailing: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        if (data.id != null) {
                          deleteStudent(data.id!);
                        } else {
                          // print('shjgfhsdfkds');
                        }
                      },
                      icon: Icon(Icons.delete),
                    ),
                    IconButton(
                  onPressed: () {
                    if (data.id != null) {
                      // updateStudent(data.id!,StudentModel(name: name, age: age));
                    } else {
                      // print('shjgfhsdfkds');
                    }
                  },
                  icon: Icon(Icons.edit),
                ),
                  ],
                ),
              );
            },
            separatorBuilder: (ctx, index) {
              return const Divider();
            },
            itemCount: studentList.length);
      },
    );
  }
}
