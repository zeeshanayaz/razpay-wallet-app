import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant.dart';
import '../../../core/helper.dart';
import '../../../models/general/general_response.dart';
import '../../../network/api_routes.dart';
import '../../../network/base_client.dart';
import '../../../network/base_controller.dart';
import '../../../router.dart';
import '../../home/controller/wallet_controller.dart';

class SendCoinController extends GetxController {
  final amountController = TextEditingController();
  final addressController = TextEditingController();
  final pinController = TextEditingController();

  getUsdAmount(String usdRate) {
    return double.parse(usdRate) * double.parse(amountController.text);
  }

  totalAmount() {
    final walletController = Get.find<WalletController>();
    double inputAmount = double.parse(amountController.text);
    double withdrawalFee = getWithdrawalFee(walletController.selectedWallet.value.currency ?? '');
    return inputAmount + withdrawalFee;
  }

  getTotalUsdAmount(String usdRate) {
    final walletController = Get.find<WalletController>();
    double inputUsdAmount = double.parse(usdRate) * double.parse(amountController.text);

    double withdrawalFee = getWithdrawalFee(walletController.selectedWallet.value.currency ?? '');
    double withdrawalFeeUsdAmount = double.parse(usdRate) * withdrawalFee;

    return inputUsdAmount + withdrawalFeeUsdAmount;
  }

  sendCoin() async {

    if(pinController.text.isEmpty && pinController.text.length < 4) {
      return;
    }
    final walletController = Get.find<WalletController>();

    BaseController.showLoading('Verifying pin...');
    var response = await BaseClient().post(ApiRoutes.sendCoins, {
      'amount': amountController.text,
      'currency': walletController.selectedWallet.value.currency,
      'sender_address': walletController.selectedWallet.value.address,
      'receiver_address': addressController.text,
      'pin': pinController.text,
    }).catchError(BaseController.handleError);

    if (response == null) return;
    BaseController.hideLoading();
    if(kDebugMode) print(response);

    var sendCoinResponse = generalResponseFromJson(response);
    BaseHelper.showSnackBar(sendCoinResponse.message);
    Get.offAllNamed(
      AppRoutes.sendCryptoSuccessful,
        arguments: {
          'amount': '${amountController.text} ${walletController.selectedWallet.value.currency}',
          'status': sendCoinResponse.success ?? sendCoinResponse.status,
          'message': sendCoinResponse.message,
        }
    );


   /* if(sendCoinResponse.status == 'success') {
      Get.offAllNamed(AppRoutes.sendCryptoSuccessful);
    } else {
      // Get.offAllNamed(AppRoutes.sendCryptoFailed);
    }*/
  }
}