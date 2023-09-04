import 'package:flutter/material.dart';
import 'package:yatrigan/src/controller/main/ir/ir_ctrl_api.dart';
import 'package:yatrigan/src/controller/main/ir/ir_ctrl_model.dart';

import 'ir_ctrl_db.dart';

class IrCtrl  extends IrCtrlModel {
  final IrCtrlApi _api = IrCtrlApi();
  final IrCtrlDb _db = IrCtrlDb();

  IrCtrl() {
    getTrainsRsDb();
  }


  Future<void> getTrainsRsDb() async {
    trainsRs = await _db.getTrainsRsDb();
    notifyListeners();
  }

  Future<void> postTrainsRsDb({
    required String train,
  }) async {
    trainsRs.add(train);
    await _db.postTrainsRsDb(
      train: train,
    );
    notifyListeners();
  }

  Future<void> deleteTrainsRsDb() async {
    trainsRs.clear;
    await _db.deleteTrainsRsDb(
      trains: trainsRs,
    );
    notifyListeners();
  }

  void _errorMsgApi() {
    if (_api.error) {
      errorMsg = _api.errorMessage;
    }
  }

  Future<void> getRailStationsApi({
    required BuildContext context,
  }) async {
    railStations = await _api.getRailStationsApi(
      context: context,
      showError: true,
    );
    if (!_api.error) {
      //_postRailStationsDb();
    }
    _errorMsgApi();
    notifyListeners();
  }

  Future<void> getRailStationShopsApi({
    required BuildContext context,
  }) async {
    if (railStationCode.isNotEmpty) {
      irShops = await _api.getShopsApi(
        context: context,
        showError: true,
        stationCode: railStationCode,
      );
      _errorMsgApi();
      notifyListeners();
    }
  }

  Future<void> getRailStationShopInvApi({
    required BuildContext context,
  }) async {
    irShopInv = await _api.getShopInvApi(
      context: context,
      showError: true,
      shopId: irShop!.id,
      stationCode: railStationCode,
    );
    _errorMsgApi();
    notifyListeners();
  }

  Future<void> getRailStationShopInfoApi({
    required BuildContext context,
  }) async {
    irShopInfo = await _api.getShopInfoApi(
      context: context,
      showError: true,
      stationCode: railStationCode,
      shopId: irShop!.id,
    );
    notifyListeners();
  }

  Future<void> getHelplinesGrpApi({
    required BuildContext context,
  }) async {
    irHelplinesGrp = await _api.getHelplinesGrpApi(
      context: context,
      showError: true,
    );
    _errorMsgApi();
    notifyListeners();
  }

  Future<void> getHelplinesApi({
    required BuildContext context,
  }) async {
    irHelplines = await _api.getHelplinesApi(
      context: context,
      showError: true,
    );
    _errorMsgApi();
    notifyListeners();
  }

  Future<void> getTrainsApi({
    required BuildContext context,
  }) async {
    irTrains = await _api.getTrainsApi(
      context: context,
      showError: false,
    );
    if (!_api.error) {
      //_postTrainsDb();
    }
    _errorMsgApi();
    notifyListeners();
  }

  Future<void> getTrainScheduleApi({
    required BuildContext context,
  }) async {
    trainSchedule = await _api.getTrainScheduleApi(
      context: context,
      showError: true,
      train: trainNo,
    );
    _errorMsgApi();
    notifyListeners();
  }
}
