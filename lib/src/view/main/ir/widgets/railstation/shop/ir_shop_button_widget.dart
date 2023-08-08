import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yatrigan/src/controller/main/ir/ir_ctrl.dart';
import 'package:yatrigan/src/model/main/ir/railstation/ir_shops_mdl.dart';
import 'package:yatrigan/src/view/main/ir/screens/ir_shop_screen.dart';
import 'package:yatrigan/src/view/widgets/text_row_widget.dart';

class IrShopButtonWidget extends StatelessWidget {
  final IrShopMdl shop;
  const IrShopButtonWidget({
    Key? key,
    required this.shop,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Provider.of<IrCtrl>(context, listen: false).irShop = shop;
        Navigator.pushNamed(context, IrShopScreen.id);
      },
      child: Card(
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
            ],
          ),
        ),
      ),
    );
  }
}
