abstract class BaseActionState {
  const BaseActionState();
}

class ActionInitial extends BaseActionState {}

class ActionLoading extends BaseActionState {}

class ActionSuccess extends BaseActionState {
  final String message;

  const ActionSuccess(this.message);
}

class ActionError extends BaseActionState {
  final String message;

  const ActionError(this.message);
}
