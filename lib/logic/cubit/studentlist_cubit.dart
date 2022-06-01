// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:image_picker/image_picker.dart';
import 'package:student_manager_bloc/database/db_model.dart';
import 'package:student_manager_bloc/main.dart';

part 'studentlist_state.dart';

class StudentlistCubit extends Cubit<StudentlistState> {
  var box = Hive.box<StudentModel>(ModelName);

  StudentlistCubit()
      : super(
          InitialState(
            studentList: Hive.box<StudentModel>(ModelName).values.toList(),
          ),
        );
  void addList(StudentModel studentList) {
    box.add(studentList);
    emit(InitialState(studentList: box.values.toList()));
  }

  void saveImage(XFile? photo) {
    if (photo != null) {
      emit(InitialState(
          studentList: box.values.toList(), selectedImage: photo.path));
    } else {
      return;
    }
  }

  void searchStudent(List<StudentModel> value) {
    emit(InitialState(studentList: value));
  }
  void searchStudentlist(){
    emit(InitialState(studentList: box.values.toList()));
  }

  void editStudent(StudentModel studentDetails, int index) {
    box.putAt(index, studentDetails);
    emit(InitialState(studentList: box.values.toList()));
  }

  void deleteStudent(index) {
    final keys = box.keys;
    final key = keys.elementAt(index);
    box.delete(key);
    emit(InitialState(studentList: box.values.toList()));
  }
}
