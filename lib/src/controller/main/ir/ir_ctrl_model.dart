import 'package:yatrigan/src/model/main/ir/ir_grp_list_model.dart';
import 'package:yatrigan/src/model/main/ir/ir_station_shop_details_model.dart';
import 'package:yatrigan/src/model/main/ir/ir_shop_inv_list_model.dart';
import 'package:yatrigan/src/model/main/ir/ir_shop_list_model.dart';
import 'package:yatrigan/src/model/main/ir/ir_station_list_model.dart';
import 'package:yatrigan/src/model/main/ir/ir_train_list.dart';
import 'package:yatrigan/src/model/main/ir/ir_train_station_list.dart';
import 'package:yatrigan/src/model/main/ir/trainschedule/train_schedule.dart';

class IrCtrlModel {
  String errorMsg = '';

  List<IrStationListModel> irStationList = [];

  String stationCode = '';
  IrStationListModel? railwayStation;

  List<IrShopListModel> irStationShopList = [];

  IrShopListModel? irStationShop;

  List<IrShopInvListModel> irStationShopInvList = [];

  IrStationShopDetailsModel? irStationShopDetails;

  List<IrGrpListModel> irGrpList = [];

  List<IrTrainListModel> irTrainList = [];

  String train = '';

  TrainStationList? trainStationList;

  TrainSchedule? trainSchedule;

}
