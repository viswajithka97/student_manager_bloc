// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_manager_bloc/core/constrants.dart';
import 'package:student_manager_bloc/data/db_model.dart';
import 'package:student_manager_bloc/logic/cubit/studentlist_cubit.dart';
import 'package:student_manager_bloc/presentation/widgets/form_field.dart';
import 'package:student_manager_bloc/presentation/widgets/image_selection.dart';

class AddStudent extends StatelessWidget {
  AddStudent({Key? key}) : super(key: key);

  final _nameController = TextEditingController();

  final _ageController = TextEditingController();

  final _phoneController = TextEditingController();
  final _domainController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Add Student"),
        centerTitle: true,
        // actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.save))],
      ),
      body: SafeArea(
          child: Column(
        children: [
          kHeight20,
          // ignore: prefer_const_constructors
          ImageSelection(),
          kHeight20,
          formfield(
              control: _nameController,
              hinttext: 'Name',
              keyboard: TextInputType.name),
          kHeight20,
          formfield(
              control: _ageController,
              hinttext: 'Age',
              keyboard: TextInputType.number),
          kHeight20,
          formfield(
              control: _phoneController,
              hinttext: 'Phone Number',
              keyboard: TextInputType.number),
          kHeight20,
          formfield(
              control: _domainController,
              hinttext: 'Domain',
              keyboard: TextInputType.name),
          kHeight20,

          BlocBuilder<StudentlistCubit, StudentlistState>(
            builder: (context, state) {
              state as InitialState;
              return ElevatedButton.icon(
                  onPressed: () async {
                    addStudentButton(context, state.selectedImage ?? "");
                  },
                  icon: const Icon(Icons.save),
                  label: const Text('Add Student'));
            },
          )
        ],
      )),
    );
  }

  addStudentButton(BuildContext context, String image) {
    final _name = _nameController.text.trim();
    final _age = _ageController.text.trim();
    final _phone = _phoneController.text.trim();
    final _domain = _domainController.text.trim();

    if (_name.isEmpty || _age.isEmpty || _phone.isEmpty || _domain.isEmpty) {
      return null;
    } else {
      final _student = StudentModel(
          name: _name, age: _age, phone: _phone, domain: _domain, image: image);
      context.read<StudentlistCubit>().addList(_student);
      Navigator.pop(context);
    }
  }
}
