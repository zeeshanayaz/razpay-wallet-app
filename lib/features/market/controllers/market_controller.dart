import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:get/get.dart';

import '../../../models/market/market.dart';
import '../../../network/api_routes.dart';
import '../../../network/base_client.dart';
import '../../../network/base_controller.dart';

class MarketController extends GetxController {
  var isLoadingMarket = false.obs;
  var market = <Market>[].obs;
  var marketCap = MarketCap().obs;

  @override
  void onInit() {
    retrieveMarketData();
    super.onInit();
  }

  retrieveMarketData() async {
    isLoadingMarket(true);
    var response = await BaseClient().get(ApiRoutes.market)
        .catchError(BaseController.handleError);

    if (response == null) return;
    isLoadingMarket(false);
    if(kDebugMode) print(response);

    market(marketResponseFromJson(response).market);
    marketCap(marketResponseFromJson(response).marketCap);
  }
}