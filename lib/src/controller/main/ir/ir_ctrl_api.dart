import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:yatrigan/src/controller/handle_errors_api.dart';
import 'package:yatrigan/src/controller/http_status_code.dart';
import 'package:yatrigan/src/controller/rest_api.dart';
import 'package:yatrigan/src/model/main/ir/ir_grp_list_model.dart';
import 'package:yatrigan/src/model/main/ir/ir_shop_inv_list_model.dart';
import 'package:yatrigan/src/model/main/ir/ir_shop_list_model.dart';
import 'package:yatrigan/src/model/main/ir/ir_station_list_model.dart';
import 'package:yatrigan/src/model/main/ir/ir_station_shop_details_model.dart';

class IrCtrlApi extends HandleErrorsApi {
  bool error = false;

  Future<List<IrStationListModel>> getRailwayStationListApi({
    required BuildContext context,
    required bool showError,
  }) async {
    List<IrStationListModel> list = [];
    error = false;
    super.context = context;
    super.errorMessage = '';
    bool internet = await noInternetConnectivity(
      showError: showError,
    );
    if (internet) {
      var response = await http.get(
        Uri.parse(irStationListUriV1),
      );
      HttpStatusAction? action = httpStatus[response.statusCode];
      var responseDecode = jsonDecode(response.body);
      if (resAction[action] == ResAction.success) {
        var responseData = responseDecode['data'] as List;
        list = responseData
            .map<IrStationListModel>(
                (json) => IrStationListModel.fromJson(json))
            .toList();
      } else {
        error = true;
        handleErrorApi(
          response: responseDecode,
          action: action,
        );
      }
    }
    return list;
  }

  Future<List<IrShopListModel>> getRailwayStationShopListApi({
    required BuildContext context,
    required bool showError,
    required String stationCode,
  }) async {
    List<IrShopListModel> list = [];
    error = false;
    super.context = context;
    super.errorMessage = '';
    bool internet = await noInternetConnectivity(
      showError: showError,
    );
    if (internet) {
      String uri = irShopListUriV1;
      uri = uri.replaceAll("<station>", stationCode);
      var response = await http.get(
        Uri.parse(uri),
      );
      HttpStatusAction? action = httpStatus[response.statusCode];
      var responseDecode = jsonDecode(response.body);
      if (resAction[action] == ResAction.success) {
        var responseData = responseDecode['data'] as List;
        list = responseData
            .map<IrShopListModel>((json) => IrShopListModel.fromJson(json))
            .toList();
      } else {
        error = true;
        handleErrorApi(
          response: responseDecode,
          action: action,
        );
      }
    }
    return list;
  }

  Future<List<IrShopInvListModel>> getRailwayStationShopInvListApi({
    required BuildContext context,
    required bool showError,
    required String stationCode,
    required String shopId,
  }) async {
    List<IrShopInvListModel> list = [];
    super.context = context;
    super.errorMessage = '';
    bool internet = await noInternetConnectivity(
      showError: showError,
    );
    if (internet) {
      var uri = irShopInvListUriV1;
      uri = uri.replaceAll("<station>", stationCode);
      uri = uri.replaceAll("<shopId>", shopId);
      var response = await http.get(
        Uri.parse(uri),
      );
      HttpStatusAction? action = httpStatus[response.statusCode];
      var responseDecode = jsonDecode(response.body);
      if (resAction[action] == ResAction.success) {
        var responseData = responseDecode['data'] as List;
        list = responseData
            .map<IrShopInvListModel>(
                (json) => IrShopInvListModel.fromJson(json))
            .toList();
      } else {
        error = true;
        handleErrorApi(
          response: responseDecode,
          action: action,
        );
      }
    }
    return list;
  }

  Future<IrStationShopDetailsModel?> getRailwayStationShopDetailsApi({
    required BuildContext context,
    required bool showError,
    required String stationCode,
    required String shopId,
  }) async {
    IrStationShopDetailsModel? shop;
    error = false;
    super.context = context;
    super.errorMessage = '';
    bool internet = await noInternetConnectivity(
      showError: showError,
    );
    if (internet) {
      var uri = irShopDetailsUriV1;
      uri = uri.replaceAll("<station>", stationCode);
      uri = uri.replaceAll("<shopId>", shopId);
      var response = await http.get(
        Uri.parse(uri),
      );
      HttpStatusAction? action = httpStatus[response.statusCode];
      var responseDecode = jsonDecode(response.body);
      if (resAction[action] == ResAction.success) {
        shop = IrStationShopDetailsModel.fromJson(responseDecode['data']);
      } else {
        error = true;
        handleErrorApi(
          response: responseDecode,
          action: action,
        );
      }
    }
    return shop;
  }

  Future<List<IrGrpListModel>> getGrpListApi({
    required BuildContext context,
    required bool showError,
  }) async {
    List<IrGrpListModel> list = [];
    error = false;
    super.context = context;
    super.errorMessage = '';
    bool internet = await noInternetConnectivity(
      showError: showError,
    );
    if (internet) {
      var response = await http.get(
        Uri.parse(irGrpListUriV1),
      );
      HttpStatusAction? action = httpStatus[response.statusCode];
      var responseDecode = jsonDecode(response.body);
      if (resAction[action] == ResAction.success) {
        var responseData = responseDecode['data'] as List;
        list = responseData
            .map<IrGrpListModel>((json) => IrGrpListModel.fromJson(json))
            .toList();
      } else {
        error = true;
        handleErrorApi(
          response: responseDecode,
          action: action,
        );
      }
    }
    return list;
  }
}
