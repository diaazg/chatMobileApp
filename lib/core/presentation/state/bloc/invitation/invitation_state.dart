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