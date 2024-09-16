abstract class InvitationState {}

class InvitationStateInit extends InvitationState {}

class InvitationStateLoading extends InvitationState {}

class InvitationStateGetSuccess extends InvitationState {}

class InvitationStateGetFailure extends InvitationState {}

class InvitationStateSendSuccess extends InvitationState {
  final int id;

  InvitationStateSendSuccess({required this.id});
}

class InvitationStateSendFailure extends InvitationState {
  
}

class InvitationAcceptSuccess extends InvitationState {}

class InvitationAcceptFailure extends InvitationState {
  final String error;

  InvitationAcceptFailure({required this.error});
}