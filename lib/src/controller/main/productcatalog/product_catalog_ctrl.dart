import 'package:flutter/material.dart';
import 'package:yatrigan/src/model/main/product/product_details_images_model.dart';

import 'product_catalog_ctrl_api.dart';
import 'product_catalog_ctrl_model.dart';

class PcCtrl extends PcCtrlModel {
  final PcCtrlApi _api = PcCtrlApi();

  void _errorMsgApi() {
    errorMsg = _api.errorMessage;
  }

  Future<void> getProductDetailsApi({
    required BuildContext context,
    required String productId,
  }) async {
    product = await _api.getProductDetailsApi(
      context: context,
      showError: true,
      productId: productId,
    );
    if (product != null) {
      productImage.clear();
      productImage.add(product!.getImage);
      for (ProductDetailsImagesModel image in product!.getImages) {
        productImage.add(image.image);
      }
    }
    _errorMsgApi();
    notifyListeners();
  }
}
