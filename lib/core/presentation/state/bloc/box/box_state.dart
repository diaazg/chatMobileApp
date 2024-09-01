abstract class BoxState {}

class BoxStateSuccess extends BoxState {}

class BoxStateFailure extends BoxState {
  final String error ;

  BoxStateFailure({required this.error});
}

