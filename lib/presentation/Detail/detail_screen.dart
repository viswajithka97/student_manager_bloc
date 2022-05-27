// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_manager_bloc/data/db_model.dart';
import 'package:student_manager_bloc/logic/cubit/studentlist_cubit.dart';
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
                        builder: (ctx1) =>
                            EditScreen(index: index, list: list)));
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
                  image: list[index].image.toString().isEmpty
                      ? const DecorationImage(
                          image: NetworkImage(
                              'https://cdn.landesa.org/wp-content/uploads/default-user-image.png'))
                      : DecorationImage(
                          image: FileImage(
                            File(list[index].image.toString()),
                          ),
                        ),
                ),
              ),
              DetailScreenContent(
                  category: 'Name :', result: list[index].name.toString()),
              DetailScreenContent(
                  category: 'Age :', result: list[index].age.toString()),
              DetailScreenContent(
                  category: 'Contact :', result: list[index].phone.toString()),
              DetailScreenContent(
                  category: 'Domain :', result: list[index].domain.toString()),
            ],
          )),
        );
      },
    );
  }
}

class DetailScreenContent extends StatelessWidget {
  final category;
  final result;
  const DetailScreenContent(
      {Key? key, required this.category, required this.result})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            category,
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
          Text(
            result,
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
