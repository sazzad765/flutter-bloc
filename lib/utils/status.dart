enum Status { initial, success, error, loading, selected, updated }

extension StatusX on Status {
  bool get isInitial => this == Status.initial;

  bool get isSuccess => this == Status.success;

  bool get isError => this == Status.error;

  bool get isLoading => this == Status.loading;

  bool get isSelected => this == Status.selected;

  bool get isUpdate => this == Status.updated;
}
