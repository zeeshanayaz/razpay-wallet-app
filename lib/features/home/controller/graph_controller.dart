import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:get/get.dart';

import '../../../models/graph/graph.dart';
import '../../../network/api_routes.dart';
import '../../../network/base_client.dart';
import '../../../network/base_controller.dart';

class GraphController extends GetxController {
  var isLoading = false.obs;
  var graph = Graph().obs;

  @override
  void onInit() {
    retrieveGraph();
    super.onInit();
  }

  retrieveGraph() async {
    isLoading(true);
    var response = await BaseClient().get(ApiRoutes.graph)
        .catchError(BaseController.handleError);

    if (response == null) return;
    isLoading(false);
    if(kDebugMode) print(response);

    graph(graphResponseFromJson(response).graph);
  }
}