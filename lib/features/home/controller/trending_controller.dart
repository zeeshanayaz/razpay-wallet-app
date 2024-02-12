import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:get/get.dart';

import '../../../models/trending/trending.dart';
import '../../../network/api_routes.dart';
import '../../../network/base_client.dart';
import '../../../network/base_controller.dart';

class TrendingController extends GetxController {
  var isLoading = false.obs;
  var trending = <Trending>[].obs;

  @override
  void onInit() {
    retrieveTrending();
    super.onInit();
  }

  retrieveTrending() async {
    isLoading(true);
    var response = await BaseClient().get(ApiRoutes.trending)
        .catchError(BaseController.handleError);

    if (response == null) return;
    isLoading(false);
    if(kDebugMode) print(response);

    trending(trendingResponseFromJson(response).trending);
  }
}