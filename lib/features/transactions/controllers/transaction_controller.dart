import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:get/get.dart';

import '../../../models/transaction/transaction.dart';
import '../../../models/transaction/transaction_detail.dart';
import '../../../models/transaction/transaction_history.dart';
import '../../../network/api_routes.dart';
import '../../../network/base_client.dart';
import '../../../network/base_controller.dart';

class TransactionController extends GetxController {
  var isLoading = false.obs;
  var transaction = <Transaction>[].obs;
  var filteredTransactions = <Transaction>[].obs;

  var isLoadingTransactionDetail = false.obs;
  var transactionDetail = Transaction().obs;

  ///Filter Transaction variables
  var curBtc = true.obs;
  var curEth = true.obs;
  var curUsdt = true.obs;

  var typeSent = true.obs;
  var typeReceive = true.obs;

  @override
  void onInit() {
    retrieveTransactions();
    super.onInit();
  }

  retrieveTransactions() async {
    isLoading(true);
    var response = await BaseClient().get(ApiRoutes.getTransaction)
        .catchError(BaseController.handleError);

    if (response == null) return;
    isLoading(false);
    if(kDebugMode) print(response);

    transaction(transactionHistoryResponseFromJson(response).transactionHistory);
    filteredTransactions(transactionHistoryResponseFromJson(response).transactionHistory);
  }

  filterTransactionList() async {
    if(curBtc.isTrue && curEth.isTrue && curUsdt.isTrue && typeSent.isTrue && typeReceive.isTrue) {
      filteredTransactions(transaction);
    } else {
      List<String> coinIds = [];
      if(curBtc.isTrue) {
        coinIds.add('btc');
      }
      if(curEth.isTrue) {
        coinIds.add('eth');
      }
      if(curUsdt.isTrue) {
        coinIds.add('usdt');
      }

      var compareCategory = false;
      var category = '';
      if(typeSent.isTrue && typeReceive.isTrue) {
        compareCategory = false;
      } else {
        compareCategory = true;
        if(typeReceive.isTrue) {
          category = 'receive';
        } else {
          category = 'sent';
        }
      }

      filteredTransactions(transaction.where((transaction) => coinIds.contains((transaction.coinId ?? '').toLowerCase())).toList());
      filteredTransactions(filteredTransactions.where((transaction) => compareCategory ? transaction.category == category : true).toList());
    }
  }

  getSingleTransactionDetail(int id) async {
    isLoadingTransactionDetail(true);
    var response = await BaseClient().get('${ApiRoutes.singleTransaction}/$id')
        .catchError(BaseController.handleError);

    if (response == null) return;
    isLoadingTransactionDetail(false);
    if(kDebugMode) print(response);

    transactionDetail(transactionDetailResponseFromJson(response).transactionHistory);
  }

}