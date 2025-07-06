class Transaction {
  final String title;
  final double amount;
  final DateTime date;
  final String type; // 'debit' or 'credit'

  Transaction({
    required this.title,
    required this.amount,
    required this.date,
    required this.type,
  });
}