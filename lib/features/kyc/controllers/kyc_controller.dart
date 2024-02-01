import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/colors.dart';
import '../../../core/helper.dart';
import '../../../models/general/general_response.dart';
import '../../../network/api_routes.dart';
import '../../../network/base_client.dart';
import '../../../network/base_controller.dart';
import '../../../router.dart';

class KYCInformationController extends GetxController {
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController country = TextEditingController();
  var documentType = ''.obs;
  XFile? imageFileFront;
  XFile? imageFileBack;

  void navigateToKycChooseDoc() {
    if(firstName.text.isEmpty || lastName.text.isEmpty || city.text.isEmpty || phoneNumber.text.isEmpty || country.text.isEmpty) {
      return;
    } else {
      Get.toNamed(AppRoutes.kycChooseDoc);
    }
  }

  void navigateToKycDoc(String docType) {
    documentType(docType);
    Get.toNamed(AppRoutes.kyDoc);
  }

  void navigateToKycBackDoc() {
    if(imageFileFront == null) {
      BaseHelper.showSnackBar('Image is required.', color: red);
    } else {
      Get.toNamed(AppRoutes.kyDocBack);
    }
  }

  void pickImageFrontFromCamera() async {
    final ImagePicker picker = ImagePicker();
    imageFileFront = await picker.pickImage(source: ImageSource.camera, imageQuality: 90);

    if(imageFileFront != null) {
      if (kDebugMode) {
        print('You selected Front image : ${imageFileFront?.path}');
      } else {
        if (kDebugMode) {
          print('You have not taken image');
        }
      }
    }
  }

  void pickImageBackFromCamera() async {
    final ImagePicker picker = ImagePicker();
    imageFileBack = await picker.pickImage(source: ImageSource.camera, imageQuality: 90);

    if(imageFileBack != null) {
      if (kDebugMode) {
        print('You selected  Back image : ${imageFileBack?.path}');
      } else {
        if (kDebugMode) {
          print('You have not taken image');
        }
      }
    }
  }

  void submitKycInformation() async {
    if(imageFileBack == null) {
      BaseHelper.showSnackBar('Image is required.', color: red);
      return;
    }

    BaseController.showLoading('Uploading Documents...');
    Map<String, String> queryParameters = {
      'first_name': firstName.text,
      'last_name': lastName.text,
      'phone_number': phoneNumber.text,
      'city': city.text,
      'country': country.text,
      'document_name': documentType.value,
      'front': imageFileFront!.path,
      'back': imageFileBack!.path,
    };

    var response = await BaseClient().postFormUploadDoc(ApiRoutes.kyc, queryParameters)
        .catchError(BaseController.handleError);

    if (response == null) return;

    BaseController.hideLoading();
    if(kDebugMode) print(response);
    var kycResponse = generalResponseFromJson(response);
    BaseHelper.showSnackBar(kycResponse.success);
    Get.offAllNamed(AppRoutes.kycCompleted);
  }

}