import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:yatrigan/src/controller/handle_errors_api.dart';
import 'package:yatrigan/src/controller/http_status_code.dart';
import 'package:yatrigan/src/controller/rest_api.dart';
import 'package:yatrigan/src/model/main/ir/helpline/ir_helpline_grp_mdl.dart';
import 'package:yatrigan/src/model/main/ir/helpline/ir_helpline_mdl.dart';
import 'package:yatrigan/src/model/main/ir/railstation/shop/ir_shop_inv_mdl.dart';
import 'package:yatrigan/src/model/main/ir/railstation/ir_shops_mdl.dart';
import 'package:yatrigan/src/model/main/ir/rail_stations_mdl.dart';
import 'package:yatrigan/src/model/main/ir/railstation/shop/ir_shop_info_mdl.dart';
import 'package:yatrigan/src/model/main/ir/trains_mdl.dart';
import 'package:yatrigan/src/model/main/ir/trainschedule/train_schedule.dart';

class IrCtrlApi extends HandleErrorsApi {
  bool error = false;

  Future<RailStationsMdl> getRailStationsApi({
    required BuildContext context,
    required bool showError,
  }) async {
    RailStationsMdl stations = RailStationsMdl(stations: []);
    error = false;
    super.context = context;
    super.errorMessage = '';
    bool internet = await noInternetConnectivity(
      showError: showError,
    );
    if (internet) {
      http.Response? response;
      try {
        response = await http
            .get(
              Uri.parse(IrApiUri.railStations.uri),
            )
            .timeout(
              const Duration(seconds: 5),
            );
      } on TimeoutException catch (_) {
        connectTimeOut(
          error: 'conTout-getRailStationsApi',
          show: showError,
        );
        return stations;
      }
      HttpStatusAction? action = httpStatus[response.statusCode];
      var responseDecode = jsonDecode(response.body);
      if (resAction[action] == ResAction.success) {
        stations = RailStationsMdl.fromJson(responseDecode);
      } else {
        error = true;
        handleErrorApi(
          response: responseDecode,
          action: action,
        );
      }
    }
    return stations;
  }

  Future<IrShopsMdl?> getShopsApi({
    required BuildContext context,
    required bool showError,
    required String stationCode,
  }) async {
    IrShopsMdl? shops;
    error = false;
    super.context = context;
    super.errorMessage = '';
    bool internet = await noInternetConnectivity(
      showError: showError,
    );
    if (internet) {
      String uri = IrApiUri.stationShops.uri;
      uri = uri.replaceAll("<station>", stationCode);
      var response = await http.get(
        Uri.parse(uri),
      );
      HttpStatusAction? action = httpStatus[response.statusCode];
      var responseDecode = jsonDecode(response.body);
      if (resAction[action] == ResAction.success) {
        shops = IrShopsMdl.success(responseDecode);
      } else {
        shops = IrShopsMdl.fail(responseDecode);
        error = true;
        handleErrorApi(
          response: responseDecode,
          action: action,
        );
      }
    }
    return shops;
  }

  Future<IrShopInvMdl?> getShopInvApi({
    required BuildContext context,
    required bool showError,
    required String stationCode,
    required String shopId,
  }) async {
    IrShopInvMdl? shopInv;
    super.context = context;
    super.errorMessage = '';
    bool internet = await noInternetConnectivity(
      showError: showError,
    );
    if (internet) {
      var uri = IrApiUri.stationShopInv.uri;
      uri = uri.replaceAll("<station>", stationCode);
      uri = uri.replaceAll("<shopId>", shopId);
      var response = await http.get(
        Uri.parse(uri),
      );
      HttpStatusAction? action = httpStatus[response.statusCode];
      var responseDecode = jsonDecode(response.body);
      if (resAction[action] == ResAction.success) {
        shopInv = IrShopInvMdl.success(responseDecode);
      } else {
        error = true;
        shopInv = IrShopInvMdl.fail(responseDecode);
        handleErrorApi(
          response: responseDecode,
          action: action,
        );
      }
    }
    return shopInv;
  }

  Future<IrShopInfoMdl?> getShopInfoApi({
    required BuildContext context,
    required bool showError,
    required String stationCode,
    required String shopId,
  }) async {
    IrShopInfoMdl? shop;
    error = false;
    super.context = context;
    super.errorMessage = '';
    bool internet = await noInternetConnectivity(
      showError: showError,
    );
    if (internet) {
      var uri = IrApiUri.stationShopInfo.uri;
      uri = uri.replaceAll("<station>", stationCode);
      uri = uri.replaceAll("<shopId>", shopId);
      var response = await http.get(
        Uri.parse(uri),
      );
      HttpStatusAction? action = httpStatus[response.statusCode];
      var responseDecode = jsonDecode(response.body);
      if (resAction[action] == ResAction.success) {
        shop = IrShopInfoMdl.fromJson(responseDecode);
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

  Future<List<IrHelplineGrpMdl>> getHelplinesGrpApi({
    required BuildContext context,
    required bool showError,
  }) async {
    List<IrHelplineGrpMdl> list = [];
    error = false;
    super.context = context;
    super.errorMessage = '';
    bool internet = await noInternetConnectivity(
      showError: showError,
    );
    if (internet) {
      var response = await http.get(
        Uri.parse(IrApiUri.helplineGrp.uri),
      );
      HttpStatusAction? action = httpStatus[response.statusCode];
      var responseDecode = jsonDecode(response.body);
      if (resAction[action] == ResAction.success) {
        var responseData = responseDecode as List;
        list = responseData
            .map<IrHelplineGrpMdl>((json) => IrHelplineGrpMdl.fromJson(json))
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

  Future<List<IrHelplineMdl>> getHelplinesApi({
    required BuildContext context,
    required bool showError,
  }) async {
    List<IrHelplineMdl> list = [];
    error = false;
    super.context = context;
    super.errorMessage = '';
    bool internet = await noInternetConnectivity(
      showError: showError,
    );
    if (internet) {
      var response = await http.get(
        Uri.parse(IrApiUri.helpline.uri),
      );
      HttpStatusAction? action = httpStatus[response.statusCode];
      var responseDecode = jsonDecode(response.body);
      if (resAction[action] == ResAction.success) {
        var responseData = responseDecode as List;
        list = responseData
            .map<IrHelplineMdl>((json) => IrHelplineMdl.fromJson(json))
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

  Future<TrainsMdl> getTrainsApi({
    required BuildContext context,
    required bool showError,
  }) async {
    TrainsMdl trains = TrainsMdl(trains: []);
    error = false;
    super.context = context;
    super.errorMessage = '';
    bool internet = await noInternetConnectivity(
      showError: showError,
    );
    if (internet) {
      http.Response? response;
      try {
        response = await http
            .get(
              Uri.parse(IrApiUri.trains.uri),
            )
            .timeout(
              const Duration(seconds: 10),
            );
      } on TimeoutException catch (_) {
        connectTimeOut(
          error: 'conTout-getTrainsApi',
          show: showError,
        );
        return trains;
      }
      HttpStatusAction? action = httpStatus[response.statusCode];
      var responseDecode = jsonDecode(response.body);
      if (resAction[action] == ResAction.success) {
        trains = TrainsMdl.fromJson(responseDecode);
      } else {
        error = true;
        handleErrorApi(
          response: responseDecode,
          action: action,
        );
      }
    }
    return trains;
  }

  Future<TrainSchedule?> getTrainScheduleApi({
    required BuildContext context,
    required bool showError,
    required String train,
  }) async {
    TrainSchedule? trainSc;
    error = false;
    super.context = context;
    super.errorMessage = '';
    bool internet = await noInternetConnectivity(
      showError: showError,
    );
    if (internet) {
      var response = await http.get(
        Uri.parse(IrApiUri.trainSchedule.uri),
        headers: {
          'train': train,
        },
      );
      HttpStatusAction? action = httpStatus[response.statusCode];
      var responseDecode = jsonDecode(response.body);
      if (resAction[action] == ResAction.success) {
        trainSc = TrainSchedule.fromJson(responseDecode);
      } else {
        error = true;
        handleErrorApi(
          response: responseDecode,
          action: action,
        );
      }
    }
    return trainSc;
  }
}
