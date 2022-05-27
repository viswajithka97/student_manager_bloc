part of 'search_bloc.dart';

@immutable
abstract class SearchEvent {}
class SearchingEvent extends SearchEvent{
  String searchedvalues;
SearchingEvent({required this.searchedvalues});
}
class EmptyEvent extends SearchEvent{}