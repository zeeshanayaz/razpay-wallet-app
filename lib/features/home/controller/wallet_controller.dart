import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

import '../../../core/helper.dart';
import '../../../models/wallet/wallet.dart';
import '../../../network/api_routes.dart';
import '../../../network/base_client.dart';
import '../../../network/base_controller.dart';

class WalletController extends GetxController {
  var isLoading = false.obs;
  var wallet = <WalletAddress>[].obs;
  var selectedWallet = WalletAddress().obs;

  @override
  void onInit() {
    retrieveWallet();
    super.onInit();
  }

  retrieveWallet() async {
    isLoading(true);
    var response = await BaseClient().get(ApiRoutes.wallet)
        .catchError(BaseController.handleError);

    if (response == null) return;
    isLoading(false);
    if(kDebugMode) print(response);

    wallet(walletResponseFromJson(response).walletAddress);
    wallet.isNotEmpty ? selectedWallet(wallet[0]) : selectedWallet(WalletAddress());
  }

  copyAddressToClipboard() {
    Clipboard.setData(ClipboardData(text: selectedWallet.value.address ?? ''));
    BaseHelper.showSnackBar('Address copied to clipboard');
  }

  shareAddress() {
    Share.share(selectedWallet.value.address ?? '');
  }
}