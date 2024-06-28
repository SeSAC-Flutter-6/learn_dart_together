enum OrderStatus {
  pending(0),
  processing(1),
  completed(2);

  final int value;

  const OrderStatus(this.value);

  @override
  String toString() {
    switch (this) {
      case OrderStatus.pending:
        return '대기';
      case OrderStatus.processing:
        return '처리중';
      case OrderStatus.completed:
        return '완료';
      default:
        throw Exception('Unknown OrderStatus: $this');
    }
  }
}

OrderStatus parseStatus(String status) {
  switch (status) {
    case '대기':
      return OrderStatus.pending;
    case '처리중':
      return OrderStatus.processing;
    case '완료':
      return OrderStatus.completed;
    default:
      throw ArgumentError('Unknown status: $status');
  }
}
