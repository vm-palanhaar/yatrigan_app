import 'package:flutter/material.dart';
import 'package:yatrigan/src/controller/main/ir/ir_ctrl_api.dart';

import 'ir_ctrl_model.dart';

class IrCtrl extends ChangeNotifier with IrCtrlModel {
  final IrCtrlApi _api = IrCtrlApi();
  final BuildContext context;

  IrCtrl({
    required this.context,
  }) {
    getRailwayStationListApi(context: context);
    getTrainListApi(context: context);
  }

  void _errorMsgApi() {
    if (_api.error) {
      errorMsg = _api.errorMessage;
    }
  }

  Future<void> getRailwayStationListApi({
    required BuildContext context,
  }) async {
    irStationList = await _api.getRailwayStationListApi(
      context: context,
      showError: true,
    );
    _errorMsgApi();
    notifyListeners();
  }

  Future<void> getRailwayStationShopListApi({
    required BuildContext context,
  }) async {
    if (stationCode.isNotEmpty) {
      irStationShopList = await _api.getRailwayStationShopListApi(
        context: context,
        showError: true,
        stationCode: stationCode,
      );
      _errorMsgApi();
      notifyListeners();
    }
  }

  Future<void> getRailwayStationShopInvListApi({
    required BuildContext context,
  }) async {
    irStationShopInvList = await _api.getRailwayStationShopInvListApi(
      context: context,
      showError: true,
      shopId: irStationShop!.id,
      stationCode: stationCode,
    );
    _errorMsgApi();
    notifyListeners();
  }

  Future<void> getRailwayStationOrgShopDetailsApi({
    required BuildContext context,
  }) async {
    irStationShopDetails = await _api.getRailwayStationShopDetailsApi(
      context: context,
      showError: true,
      stationCode: stationCode,
      shopId: irStationShop!.id,
    );
    notifyListeners();
  }

  Future<void> getGrpListApi({
    required BuildContext context,
  }) async {
    irGrpList = await _api.getGrpListApi(
      context: context,
      showError: true,
    );
    _errorMsgApi();
    notifyListeners();
  }

  Future<void> getTrainListApi({
    required BuildContext context,
  }) async {
    irTrainList = await _api.getTrainListApi(
      context: context,
      showError: true,
    );
    _errorMsgApi();
    notifyListeners();
  }

  Future<void> getTrainStationListApi({
    required BuildContext context,
  }) async {
    trainStationList = await _api.getTrainStationListApi(
      context: context,
      showError: true,
      train: train,
    );
    _errorMsgApi();
    notifyListeners();
  }

  Future<void> getTrainScheduleApi({
    required BuildContext context,
  }) async {
    trainSchedule = await _api.getTrainScheduleApi(
      context: context,
      showError: true,
      train: train,
    );
    _errorMsgApi();
    notifyListeners();
  }
}
