// ignore_for_file: no_leading_underscores_for_local_identifiers, prefer_if_null_operators

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_manager_bloc/core/constrants.dart';
import 'package:student_manager_bloc/database/db_model.dart';
import 'package:student_manager_bloc/logic/cubit/studentlist_cubit.dart';
import 'package:student_manager_bloc/presentation/Edit/widgets/image_selection.dart';
import 'package:student_manager_bloc/presentation/widgets/form_field.dart';

// ignore: must_be_immutable
class EditScreen extends StatelessWidget {
  final int index;
  const EditScreen({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentlistCubit, StudentlistState>(
      builder: (context, state) {
        state as InitialState;
        final _nameController =
            TextEditingController(text: state.studentList[index].name);

        final _ageController =
            TextEditingController(text: state.studentList[index].age);

        final _phoneController =
            TextEditingController(text: state.studentList[index].phone);

        final _domainController =
            TextEditingController(text: state.studentList[index].domain);
        return Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(),
            body: SafeArea(
                child: Column(children: [
              kHeight20,
              // ignore: prefer_const_constructors
              ImageSelectionforEdit(index: index),
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

              ElevatedButton.icon(
                onPressed: () async {
                  final _name = _nameController.text.trim();
                  final _age = _ageController.text.trim();
                  final _phone = _phoneController.text.trim();
                  final _domain = _domainController.text.trim();

                  if (_name.isEmpty ||
                      _age.isEmpty ||
                      _phone.isEmpty ||
                      _domain.isEmpty) {
                    return;
                  } else {
                    final _student = StudentModel(
                        name: _name,
                        age: _age,
                        phone: _phone,
                        domain: _domain,
                        image: state.selectedImage == null
                            ? state.studentList[index].image
                            : state.selectedImage);

                    context
                        .read<StudentlistCubit>()
                        .editStudent(_student, index);
                    Navigator.pop(context);
                    // Navigator.pop(context);
                  }
                },
                icon: const Icon(Icons.save),
                label: const Text('Edit Data'),
              ),
            ])));
      },
    );
  }
}
