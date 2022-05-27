part of 'search_bloc.dart';

@immutable
abstract class SearchState {}

class SearchInitial extends SearchState {
  List<StudentModel> searchValue;
  SearchInitial({required this.searchValue});
}
