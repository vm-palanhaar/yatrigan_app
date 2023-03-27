import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yatrigan/src/controller/main/ir/ir_ctrl.dart';
import 'package:yatrigan/src/model/main/ir/ir_shop_list_model.dart';
import 'package:yatrigan/src/view/main/ir/screens/ir_station_shop_details_screen.dart';
import 'package:yatrigan/src/view/main/ir/screens/ir_station_shop_inv_list_screen.dart';
import 'package:yatrigan/src/view/widgets/text_row_widget.dart';

class RailwayStationShopWidget extends StatelessWidget {
  final IrShopListModel shop;
  const RailwayStationShopWidget({
    Key? key,
    required this.shop,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.02,
          vertical: MediaQuery.of(context).size.height * 0.02,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.12,
              margin: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height * 0.009,
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    shop.image,
                  ),
                  fit: BoxFit.fitWidth,
                ),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            TextRowWidget(header: 'Shop', value: shop.name),
            if (shop.platformA.isNotEmpty && shop.platformB.isEmpty)
              TextRowWidget(
                header: 'Platform',
                value: shop.platformA,
              ),
            if (shop.platformA.isEmpty && shop.platformB.isNotEmpty)
              TextRowWidget(
                header: 'Platform',
                value: shop.platformB,
              ),
            if (shop.platformA.isNotEmpty && shop.platformB.isNotEmpty)
              TextRowWidget(
                header: 'Platform',
                value: '${shop.platformA}, ${shop.platformB}',
              ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlinedButton(
                  onPressed: () {
                    Provider.of<IrCtrl>(context, listen: false).irStationShop =
                        shop;
                    Navigator.pushNamed(context, IrStationShopInvListScreen.id);
                  },
                  style: OutlinedButton.styleFrom(
                    fixedSize: Size(
                      MediaQuery.of(context).size.width * 0.4,
                      MediaQuery.of(context).size.height * 0.05,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.shopping_cart),
                      Text('Inventory'),
                    ],
                  ),
                ),
                OutlinedButton(
                  onPressed: () async {
                    Provider.of<IrCtrl>(context, listen: false).irStationShop =
                        shop;
                    await Provider.of<IrCtrl>(context, listen: false)
                        .getRailwayStationOrgShopDetailsApi(
                      context: context,
                    );
                    if (Provider.of<IrCtrl>(context, listen: false)
                            .irStationShopDetails !=
                        null) {
                      Navigator.pushNamed(
                          context, IrStationShopDetailsScreen.id);
                    }
                  },
                  style: OutlinedButton.styleFrom(
                    fixedSize: Size(
                      MediaQuery.of(context).size.width * 0.4,
                      MediaQuery.of(context).size.height * 0.05,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.info),
                      Text('Info'),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
