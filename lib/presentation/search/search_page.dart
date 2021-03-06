import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_manager_bloc/core/constrants.dart';
import 'package:student_manager_bloc/logic/bloc/search_bloc.dart';
import 'package:student_manager_bloc/logic/cubit/studentlist_cubit.dart';
import 'package:student_manager_bloc/presentation/Detail/detail_screen.dart';

class SearchPage extends StatelessWidget {
  SearchPage({Key? key}) : super(key: key);
  final _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    context.read<StudentlistCubit>().searchStudentlist();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            kHeight20,
            BlocBuilder<SearchBloc, SearchState>(
              builder: (context, state) {
                state as SearchInitial;
                context
                    .read<StudentlistCubit>()
                    .searchStudent(state.searchValue);
                return Container(
                  height: 50,
                  width: 400,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: TextField(
                    cursorColor: Colors.black,
                    controller: _searchController,
                    cursorHeight: 20,
                    cursorWidth: 1,
                    onChanged: (text) {
                      context
                          .read<SearchBloc>()
                          .add(SearchingEvent(searchedvalues: text));
                    },
                    decoration: InputDecoration(
                        suffixIcon: const Icon(
                          Icons.search,
                          color: Colors.black,
                        ),
                        iconColor: Colors.black,
                        hintText: 'Search',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                );
              },
            ),
            BlocBuilder<StudentlistCubit, StudentlistState>(
              builder: (context, state) {
                state as InitialState;
                final list = state.studentList;

                return Expanded(
                    child: ListView.builder(
                  itemCount: state.studentList.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Container(
                      height: 70,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromARGB(255, 170, 185, 255)),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage:
                              FileImage(File(list[index].image.toString())),
                        ),
                        title: Text(list[index].name),
                        subtitle: Text(list[index].age),
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (ctx) =>
                                  ScreenDetails(index: index, list: list)));
                        },
                      ),
                    ),
                  ),
                ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
