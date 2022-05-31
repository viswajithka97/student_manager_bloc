// ignore_for_file: depend_on_referenced_packages, unnecessary_type_check

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:student_manager_bloc/database/db_model.dart';
import 'package:student_manager_bloc/main.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final box = Hive.box<StudentModel>(ModelName).values;

  SearchBloc()
      : super(SearchInitial(
            searchValue: Hive.box<StudentModel>(ModelName).values.toList())) {
    on<SearchingEvent>((event, emit) {
      if (event is SearchEvent) {
        List<StudentModel> searchedList = Hive.box<StudentModel>(ModelName)
            .values
            .toList()
            .where((element) => element.name
                .toLowerCase()
                .contains(event.searchedvalues.toString()))
            .toList();
            emit(SearchInitial(searchValue: searchedList));
      }
      else if(event is EmptyEvent){
        emit(SearchInitial(searchValue: box.toList()));
      }
    });
  }
}
