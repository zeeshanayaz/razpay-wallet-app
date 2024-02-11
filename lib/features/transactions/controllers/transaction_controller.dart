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

  var isLoadingTransactionDetail = false.obs;
  var transactionDetail = Transaction().obs;

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