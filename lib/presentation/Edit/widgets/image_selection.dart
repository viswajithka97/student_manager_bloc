// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:student_manager_bloc/core/constrants.dart';
import 'package:student_manager_bloc/logic/cubit/studentlist_cubit.dart';

class ImageSelectionforEdit extends StatelessWidget {
  final int index;
  ImageSelectionforEdit({
   
    Key? key,required this.index,
  }) : super(key: key);
  final _picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentlistCubit, StudentlistState>(
      builder: (context, state) {
        state as InitialState;
        return GestureDetector(
            onTap: () async {
              showModalBottomSheet(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  context: context,
                  builder: (context) => SizedBox(
                        height: 120,
                        width: double.infinity,
                        child: ListView(
                          children: [
                            kHeight20,
                            GestureDetector(
                              onTap: () async {
                                final XFile? photo = await _picker.pickImage(
                                    source: ImageSource.camera);
                                context
                                    .read<StudentlistCubit>()
                                    .saveImage(photo);
                                // print(cameraImage());
                                Navigator.pop(context);
                              },
                              child: Row(
                                children: const [
                                  kWidth10,
                                  Icon(Icons.camera),
                                  kWidth10,
                                  Text("Camera")
                                ],
                              ),
                            ),
                            kHeight20,
                            GestureDetector(
                              onTap: () async {
                            
                                final XFile? img = await _picker.pickImage(
                                    source: ImageSource.gallery);
                                    
                                context.read<StudentlistCubit>().saveImage(img);
                               
                                Navigator.of(context);
                              },
                              child: Row(
                                children: const [
                                  kWidth10,
                                  Icon(Icons.photo),
                                  kWidth10,
                                  Text("Gallery")
                                ],
                              ),
                            ),
                          ],
                        ),
                      ));
            },
            child: state.selectedImage == null
                ?  CircleAvatar(
                    radius: 60,
                    backgroundImage: FileImage(File(state.studentList[index].image.toString())))
                : CircleAvatar(
                    radius: 60,
                    backgroundImage:
                        FileImage(File(state.selectedImage.toString())),
                  ));
      },
    );
  }
}
