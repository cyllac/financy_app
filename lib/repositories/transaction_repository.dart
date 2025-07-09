import 'package:financy_app/common/models/transaction_model.dart';

abstract class TransactionRepository {
  Future<void> addTransactions();
  Future<List<TransactionModel>> getAllTransactions();
}

class TransactionRepositoryImpl implements TransactionRepository {
  @override
  Future<void> addTransactions() {
    // TODO: implement addTransactions
    throw UnimplementedError();
  }

  @override
  Future<List<TransactionModel>> getAllTransactions() async {
    await Future.delayed(const Duration(seconds: 2));
    return <TransactionModel>[
      TransactionModel(
        title: 'Salário',
        value: 1000,
        date: DateTime.now().millisecondsSinceEpoch,
      ),
      TransactionModel(
        title: 'Mercado',
        value: -200,
        date: DateTime.now().millisecondsSinceEpoch,
      ),
      TransactionModel(
        title: 'Aluguel',
        value: -800,
        date: DateTime.now().millisecondsSinceEpoch,
      ),
    ];
  }
}
