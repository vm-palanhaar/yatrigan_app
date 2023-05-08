const String baseUrlApi = 'http://192.168.29.176:8000/api';

//---Indian Railways-PROD---
const String baseUrlApiIrV1 = '$baseUrlApi/ir/v1';
const String baseUrlApiIrYatriganV1 = '$baseUrlApiIrV1/yatrigan';

String irStationListUriV1 = '$baseUrlApiIrV1/station/';
String irTrainListUriV1 = '$baseUrlApiIrV1/trainList/';
String irTrainScheduleUriV1 = '$baseUrlApiIrV1/trainSchedule/';
String irTrainStationListUriV1 = '$baseUrlApiIrV1/trainStationList/';
String irGrpListUriV1 = '$baseUrlApiIrV1/grp/';
String irShopListUriV1 = '$baseUrlApiIrYatriganV1/station/<station>/shop/';
String irShopInvListUriV1 = '$baseUrlApiIrYatriganV1/station/<station>/shop/<shopId>/inv/';
String irShopDetailsUriV1 = '$baseUrlApiIrYatriganV1/station/<station>/shop/<shopId>/';
//---Indian Railways-DEV---


//---ProductCatalog-PROD---
const String baseUrlApiPcV1 = '$baseUrlApi/pc/v1';
const String baseUrlApiPcYatriganV1 = '$baseUrlApiPcV1/yatrigan';

String productDetailsUriV1 = '$baseUrlApiPcV1/product/<pid>/';
//---ProductCatalog-DEV---
