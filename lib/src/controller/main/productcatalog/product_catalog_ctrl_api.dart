import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:yatrigan/src/controller/handle_errors_api.dart';
import 'package:yatrigan/src/controller/http_status_code.dart';
import 'package:yatrigan/src/controller/rest_api.dart';
import 'package:yatrigan/src/model/main/product/product_details_model.dart';

class PcCtrlApi extends HandleErrorsApi {
  late String _token = '';
  void setToken(String token) => _token = token;

  bool error = false;

  Future<ProductDetailsModel?> getProductDetailsApi({
    required BuildContext context,
    required bool showError,
    required String productId,
  }) async {
    ProductDetailsModel? product;
    error = false;
    super.context = context;
    super.errorMessage = '';
    bool internet = await noInternetConnectivity(
      showError: showError,
    );
    if (internet) {
      var uri = productDetailsUriV1;
      uri = uri.replaceAll("<pid>", productId);
      var response = await http.get(
        Uri.parse(uri),
      );
      HttpStatusAction? action = httpStatus[response.statusCode];
      var responseDecode = jsonDecode(response.body);
      if (resAction[action] == ResAction.success) {
        product = ProductDetailsModel.fromJson(responseDecode['data']);
      } else {
        error = true;
        handleErrorApi(
          response: responseDecode,
          action: action,
        );
      }
    }
    return product;
  }
}
