import 'package:database_one/screens/widgets/add_student_widget.dart';
import 'package:database_one/screens/widgets/list_student_widget.dart';
import 'package:flutter/material.dart';


class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AddStudentWidget(),
            const Expanded(child: ListStudentWidget())
          ],
        )),
    );
  }
}