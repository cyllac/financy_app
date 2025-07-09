import 'package:financy_app/common/models/transaction_model.dart';
import 'package:financy_app/features/home/home_state.dart';
import 'package:financy_app/repositories/transaction_repository.dart';
import 'package:flutter/foundation.dart';

class HomeController extends ChangeNotifier {
  final TransactionRepository _transactionRepository;

  HomeController(this._transactionRepository);

  HomeState _state = HomeStateInitial();

  HomeState get state => _state;

  List<TransactionModel> _transactions = [];
  List<TransactionModel> get transactions => _transactions;

  void changeState(HomeState newState) {
    _state = newState;
    notifyListeners();
  }

  Future<void> getAllTransactions() async {
    changeState(HomeStateLoading());
    try {      
      _transactions = await _transactionRepository.getAllTransactions();
      changeState(HomeStateSuccess());
    } catch (e) {
      changeState(HomeStateError());
    }
  }
}
