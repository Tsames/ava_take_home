class CreditAccount {
  final String cardName;
  final int balance;
  final int limit;
  final String reportedDate;

  CreditAccount({required this.cardName, required this.balance, required this.limit, required this.reportedDate});

  CreditAccount copyWith({String? cardName, int? balance, int? limit, String? reportedDate}) {
    return CreditAccount(
      cardName: cardName ?? this.cardName,
      balance: balance ?? this.balance,
      limit: limit ?? this.limit,
      reportedDate: reportedDate ?? this.reportedDate,
    );
  }
}
