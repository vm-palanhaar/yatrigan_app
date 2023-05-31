import 'package:yatrigan/src/model/main/ir/ir_grp_list_model.dart';
import 'package:yatrigan/src/model/main/ir/railstation/shop/ir_shop_inv_mdl.dart';
import 'package:yatrigan/src/model/main/ir/railstation/shop/ir_shop_info_mdl.dart';
import 'package:yatrigan/src/model/main/ir/railstation/ir_shops_mdl.dart';
import 'package:yatrigan/src/model/main/ir/rail_stations_mdl.dart';
import 'package:yatrigan/src/model/main/ir/trains_mdl.dart';
import 'package:yatrigan/src/model/main/ir/trainschedule/train_schedule.dart';

class IrCtrlModel {
  String errorMsg = '';

  RailStationsMdl railStations = RailStationsMdl(
    stations: [],
  );
  String railStationCode = '';
  String railStationName = '';

  TrainsMdl irTrains = TrainsMdl(
    trains: [],
  );
  String trainNo = '';
  String trainName = '';

  Set<String> trainsRs = {};

  IrShopsMdl? irShops;

  IrShopMdl? irShop;

  IrShopInvMdl? irShopInv;

  IrShopInfoMdl? irShopInfo;

  List<IrGrpListModel> irGrpList = [];

  TrainSchedule? trainSchedule;
}
