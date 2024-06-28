enum OrderStatus {
  pending,
  processing,
  completed,
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
