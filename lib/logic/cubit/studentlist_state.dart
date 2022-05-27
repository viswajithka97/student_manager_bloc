part of 'studentlist_cubit.dart';

abstract class StudentlistState {
  // final List<StudentModel> studentList;

  // StudentlistState({required this.studentList});
}

class InitialState extends StudentlistState {
   String? selectedImage;
  final List<StudentModel> studentList;

  InitialState({required this.studentList, this.selectedImage});
}
