///
///For APIResultType Use [success], [error], [connectionProblem], [timeout], [unauthorized] #[Status]
///
///For loading use [initial], [success], [error], [loading]  #[Status]
enum Status {
  /// [initial] api call
  initial,

  /// result type success
  success,

  /// result type error
  error,

  /// waiting for result
  loading,

  ///
  selected,

  /// update any data
  updated,

  /// internet connection or any other problem
  connectionProblem,

  /// api response timeout error
  timeout,

  /// unauthorized api connection
  unauthorized,

  ///search
  search
}

extension StatusX on Status {
  bool get isInitial => this == Status.initial;

  bool get isSuccess => this == Status.success;

  bool get isError => this == Status.error;

  bool get isLoading => this == Status.loading;

  bool get isSelected => this == Status.selected;

  bool get isUpdate => this == Status.updated;

  bool get isConnectionProblem => this == Status.connectionProblem;

  bool get isTimeout => this == Status.timeout;

  bool get isUnauthorized => this == Status.unauthorized;
}
