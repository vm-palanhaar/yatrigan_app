import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yatrigan/src/controller/main/ir/ir_ctrl.dart';
import 'package:yatrigan/src/model/main/ir/ir_shop_inv_list_model.dart';
import 'package:yatrigan/src/view/main/ir/widgets/retail/shop_inv_screen_product_button_widget.dart';
import 'package:yatrigan/src/view/widgets/text_row_widget.dart';

class IrStationShopInvListScreen extends StatefulWidget {
  const IrStationShopInvListScreen({Key? key}) : super(key: key);
  static String id = 'IrStationShopInvListScreen';

  @override
  State<IrStationShopInvListScreen> createState() =>
      _IrStationShopInvListScreenState();
}

class _IrStationShopInvListScreenState
    extends State<IrStationShopInvListScreen> {
  @override
  void initState() {
    _getRailwayStationShopInvListApi();
    super.initState();
  }

  void _getRailwayStationShopInvListApi() async {
    await Provider.of<IrCtrl>(context, listen: false)
        .getRailwayStationShopInvListApi(
      context: context,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Provider.of<IrCtrl>(context, listen: false).irStationShop!.name,
        ),
      ),
      body: Consumer<IrCtrl>(
        builder: (context, consumer, _) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Card(
                  child: Column(
                    children: [
                      TextRowWidget(
                        header: 'Station',
                        value: consumer.railwayStation!.name,
                      ),
                      if (consumer.irStationShop!.platformA.isNotEmpty &&
                          consumer.irStationShop!.platformB.isEmpty)
                        TextRowWidget(
                          header: 'Platform',
                          value: consumer.irStationShop!.platformA,
                        ),
                      if (consumer.irStationShop!.platformA.isEmpty &&
                          consumer.irStationShop!.platformB.isNotEmpty)
                        TextRowWidget(
                          header: 'Platform',
                          value: consumer.irStationShop!.platformB,
                        ),
                      if (consumer.irStationShop!.platformA.isNotEmpty &&
                          consumer.irStationShop!.platformB.isNotEmpty)
                        TextRowWidget(
                          header: 'Platform',
                          value:
                              '${consumer.irStationShop!.platformA}, ${consumer.irStationShop!.platformB}',
                        ),
                      TextRowWidget(
                        header: 'Inventory',
                        value: consumer.irStationShopInvList.length.toString(),
                      ),
                    ],
                  ),
                ),
                ListView.builder(
                  itemCount: consumer.irStationShopInvList.length,
                  itemBuilder: (context, index) {
                    IrShopInvListModel invProd =
                        consumer.irStationShopInvList.elementAt(index);
                    return ShopInvProductButtonWidget(
                      key: ObjectKey(invProd),
                      invProduct: invProd.getProduct,
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
