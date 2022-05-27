// ignore_for_file: must_be_immutable

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_manager_bloc/core/constrants.dart';
import 'package:student_manager_bloc/data/db_model.dart';
import 'package:student_manager_bloc/logic/cubit/studentlist_cubit.dart';
import 'package:student_manager_bloc/presentation/Add/add_student.dart';
import 'package:student_manager_bloc/presentation/Detail/detail_screen.dart';
import 'package:student_manager_bloc/presentation/search/search_page.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  List<StudentModel> studentList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student List',style: TextStyle(color: Colors.black)),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => SearchPage()));
              },
              icon: const Icon(Icons.search))
        ],
      ),
      body: SafeArea(
        child: BlocBuilder<StudentlistCubit, StudentlistState>(
          builder: (context, state) {
            state as InitialState;
            final list = state.studentList;
            return ListView.builder(
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                        const EdgeInsets.only(top: 8, left: 5,right: 5),
                    child: Container(
                      height: 70,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromARGB(255, 170, 185, 255)),
                      child: ListTile(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (ctx) =>
                                  ScreenDetails(index: index, list: list)));
                        },
                        leading: CircleAvatar(
                          backgroundImage:
                              FileImage(File(list[index].image.toString())),
                        ),
                        title: Text(list[index].name),
                        subtitle: Text(list[index].age),
                        trailing: IconButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (ctx) => AlertDialog(
                                        title: Text(
                                            'Do you want to Delete ${list[index].name}',style: TextStyle(color: Colors.black),),
                                        actions: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              TextButton.icon(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  icon:
                                                      const Icon(Icons.cancel,color: Colors.black,),
                                                  label: const Text('Cancel',style: TextStyle(color: Colors.black))),
                                              kHeight10,
                                              TextButton.icon(
                                                  onPressed: () {
                                                    context
                                                        .read<
                                                            StudentlistCubit>()
                                                        .deleteStudent(index);
                                                    Navigator.pop(context);
                                                  },
                                                  icon: const Icon(Icons.done,color: Colors.black,),
                                                  label: const Text('Delete',style: TextStyle(color: Colors.black)))
                                            ],
                                          )
                                        ],
                                      ));
                            },
                            icon: const Icon(
                              Icons.delete,
                              color: Color.fromARGB(180, 244, 67, 54),
                            )),
                      ),
                    ),
                  );
                },
                // separatorBuilder: (context, index) {
                //   return const SizedBox(
                //     height: 5,
                //   );
                // },
                itemCount: list.length);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (ctx) => AddStudent()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
