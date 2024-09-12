abstract class PeopleState {}

class PeopleStateInit extends PeopleState {}

class PeopleStateLoading extends PeopleState {}

class PeopleStateSuccess extends PeopleState {}

class PeopleStateFailure extends PeopleState {
  final String err;

  PeopleStateFailure({required this.err});
}
