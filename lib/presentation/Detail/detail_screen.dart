// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_manager_bloc/core/constrants.dart';
import 'package:student_manager_bloc/database/db_model.dart';
import 'package:student_manager_bloc/logic/cubit/studentlist_cubit.dart';
import 'package:student_manager_bloc/presentation/Detail/widgets/details_content.dart';
import 'package:student_manager_bloc/presentation/Edit/edit_screen.dart';

class ScreenDetails extends StatelessWidget {
  final int index;
  List<StudentModel> list;
  ScreenDetails({Key? key, required this.index, required this.list})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentlistCubit, StudentlistState>(
      builder: (context, state) {
        state as InitialState;
        return Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (ctx1) => EditScreen(
                              index: index,
                            )));
                  },
                  icon: const Icon(Icons.edit))
            ],
          ),
          body: SafeArea(
              child: Column(
            children: [
              Container(
                height: 400,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: FileImage(
                        File(state.studentList[index].image.toString())),
                  ),
                ),
              ),
              kHeight20,
              DetailScreenContent(
                  category: 'Name :',
                  result: state.studentList[index].name.toString()),
              DetailScreenContent(
                  category: 'Age :',
                  result: state.studentList[index].age.toString()),
              DetailScreenContent(
                  category: 'Contact :',
                  result: state.studentList[index].phone.toString()),
              DetailScreenContent(
                  category: 'Domain :',
                  result: state.studentList[index].domain.toString()),
            ],
          )),
        );
      },
    );
  }
}
