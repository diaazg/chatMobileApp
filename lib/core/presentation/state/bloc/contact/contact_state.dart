
abstract class ContactState {}

class ContactStateInit extends ContactState {}

class ContactStateLoading extends ContactState {}

class ContactStateSuccess extends ContactState {
}

class ContactStateFailure extends ContactState {
  final String error;

  ContactStateFailure({required this.error});
}


