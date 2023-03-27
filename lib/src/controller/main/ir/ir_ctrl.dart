import 'package:flutter/material.dart';
import 'package:yatrigan/src/controller/main/ir/ir_ctrl_api.dart';

import 'ir_ctrl_model.dart';

class IrCtrl extends ChangeNotifier with IrCtrlModel {
  final IrCtrlApi _api = IrCtrlApi();

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
}
