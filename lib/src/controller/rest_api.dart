const String baseUrlApi = 'http://192.168.29.176:8000/api';

//---UserApp---
enum UserApiUri {
  //PROD
  register(uri: '$baseUrlApi/user/v1/register/'),
  login(uri: '$baseUrlApi/user/v1/login/'),
  profileInfo(uri: '$baseUrlApi/user/v1/profile/'),
  logout(uri: '$baseUrlApi/user/v1/logout/'),
  logoutAll(uri: '$baseUrlApi/user/v1/logout/all/'),
  //DEV
  doNotUse(uri: '');

  const UserApiUri({
    required this.uri,
  });

  final String uri;
}

//---IndianRailwaysApp---
const String baseUrlApiIrV1 = '$baseUrlApi/ir/v1';
const String baseUrlApiIrAppV1 = '$baseUrlApiIrV1/yatrigan';

enum IrApiUri {
  //PROD
  railStations(uri: '$baseUrlApiIrV1/station'),
  trains(uri: '$baseUrlApiIrAppV1/trainList'),
  trainSchedule(uri: '$baseUrlApiIrAppV1/trainSchedule'),
  helpline(uri: '$baseUrlApiIrV1/helpline'),
  helplineGrp(uri: '$baseUrlApiIrV1/helpline/grp'),
  stationShops(uri: '$baseUrlApiIrAppV1/station/<station>/shop'),
  stationShopInv(
      uri: '$baseUrlApiIrAppV1/station/<station>/shop/<shopId>/inv'),
  stationShopInfo(uri: '$baseUrlApiIrAppV1/station/<station>/shop/<shopId>'),
  //DEV
  doNotUse(uri: '');

  const IrApiUri({
    required this.uri,
  });

  final String uri;
}

//---ProductCatalog-PROD---
const String baseUrlApiPcV1 = '$baseUrlApi/pc/v1';
const String baseUrlApiPcYatriganV1 = '$baseUrlApiPcV1/yatrigan';

String productDetailsUriV1 = '$baseUrlApiPcV1/product/<pid>/';
//---ProductCatalog-DEV---
